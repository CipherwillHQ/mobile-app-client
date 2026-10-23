// Requests the existing Cipherwill factor signature from MetaMask
// Owns in-memory wallet connection and personal_sign.
// Does not persist wallet sessions or send transactions.
import 'package:reown_sign/reown_sign.dart';
import 'package:reown_core/reown_core.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/crypto/bytes.dart';

class WalletFactor {
  final String projectId;
  const WalletFactor(this.projectId);
  Future<String> sign(String nonce) async {
    if (projectId.isEmpty) {
      throw StateError('Configure REOWN_PROJECT_ID to use MetaMask.');
    }
    final client = await ReownSignClient.createInstance(
      projectId: projectId,
      memoryStore: true,
      metadata: const PairingMetadata(
        name: 'Cipherwill',
        description: 'Unlock a Cipherwill security factor',
        url: 'https://cipherwill.com',
        icons: ['https://cipherwill.com/favicon.ico'],
        redirect: Redirect(native: 'cipherwill://wallet'),
      ),
    );
    SessionData? session;
    try {
      final connection = await client.connect(
        optionalNamespaces: {
          'eip155': const RequiredNamespace(
            chains: ['eip155:1'],
            methods: ['personal_sign'],
            events: ['accountsChanged', 'chainChanged'],
          ),
        },
      );
      if (connection.uri == null) {
        throw StateError('Unable to connect to MetaMask.');
      }
      final link = Uri.parse(
        'https://metamask.app.link/wc?uri=' +
            Uri.encodeComponent(connection.uri.toString()),
      );
      if (!await launchUrl(link, mode: LaunchMode.externalApplication)) {
        throw StateError('Install MetaMask to use this factor.');
      }
      session = await connection.session.future.timeout(
        const Duration(minutes: 2),
      );
      final account = session.namespaces['eip155']!.accounts.first;
      final parts = account.split(':');
      final chain = parts.take(2).join(':');
      final response = client.request(
        topic: session.topic,
        chainId: chain,
        request: SessionRequestParams(
          method: 'personal_sign',
          params: [
            '0x' + toHex(bytes('Cipherwill Factor: $nonce')),
            parts.last,
          ],
        ),
      );
      await launchUrl(
        Uri.parse('https://metamask.app.link'),
        mode: LaunchMode.externalApplication,
      );
      return (await response.timeout(const Duration(minutes: 2))) as String;
    } finally {
      if (session != null) {
        try {
          await client.disconnect(
            topic: session.topic,
            reason: const ReownSignError(
              code: 6000,
              message: 'Factor signing complete',
            ),
          );
        } catch (_) {
          /* Connection may already be closed by the wallet. */
        }
      }
      client.core.heartbeat.stop();
      await client.core.relayClient.disconnect();
      await client.core.connectivity.dispose();
    }
  }
}
