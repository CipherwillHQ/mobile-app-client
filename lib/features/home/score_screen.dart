// Presents the existing account score and its server-provided components.
// Owns score details and useful planning destinations.
// Does not award points locally or offer an upgrade flow.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/icon_badge.dart';
import 'account_score.dart';

const scoreLabels = {
  'base': 'Account created',
  'firstName': 'First name',
  'lastName': 'Last name',
  'birthDate': 'Date of birth',
  'metamodel': 'Vault items',
  'beneficiary': 'Beneficiaries',
  'sessions': 'Account activity',
  'premium': 'Premium subscription',
};

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});
  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Account score',
    children: [
      RemotePanel(
        operation: 'GET_USER_SCORE',
        builder: (r) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PanelSection(
              title: 'Your Cipherwill score',
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: IconBadge(Icons.auto_awesome_outlined, size: 56),
                ),
                const SizedBox(height: 20),
                Text(
                  accountScore(r['getUserScore']).toString(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Text(
                  'Points from your account completeness and activity.',
                ),
              ],
            ),
            PanelSection(
              title: 'How your score is calculated',
              children: [
                for (final entry in accountScoreComponents(
                  r['getUserScore'],
                ).entries)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      entry.value > 0
                          ? Icons.check_circle_outline
                          : Icons.circle_outlined,
                    ),
                    title: Text(scoreLabels[entry.key] ?? entry.key),
                    trailing: Text(entry.value.toString()),
                  ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      FilledButton.icon(
        onPressed: () => context.push('/guide'),
        icon: const Icon(Icons.arrow_forward_rounded),
        label: const Text('Continue your guide'),
      ),
    ],
  );
}
