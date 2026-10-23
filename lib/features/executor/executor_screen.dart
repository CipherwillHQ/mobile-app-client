// Lists released wills and donor information for the signed-in beneficiary
// Owns executor entry points.
// Does not read protected asset contents.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';

class ExecutorScreen extends StatelessWidget {
  const ExecutorScreen({super.key});
  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Executor workspace',
    children: [
      const Text('Read-only access to the digital wills released to you.'),
      const SizedBox(height: 20),
      RemotePanel(
        operation: 'GET_ALL_BENEFICIARY_ACCESS',
        builder: (r) {
          final grants = jsonList(r['getAllBeneficiaryAccess']);
          if (grants.isEmpty) {
            return const Text('No wills have been released to you.');
          }
          return Column(
            children: [
              for (final access in grants)
                RemotePanel(
                  operation: 'GET_PERSON',
                  variables: {'id': access['user']},
                  builder: (p) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.lock_open),
                      title: Text(label(asJson(p['getPerson']))),
                      subtitle: Text(
                        'Expires ' +
                            DateTime.fromMillisecondsSinceEpoch(
                              int.parse(access['expire_at']),
                            ).toLocal().toString(),
                      ),
                      onTap: () => context.push('/executor/' + access['id']),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    ],
  );
}
