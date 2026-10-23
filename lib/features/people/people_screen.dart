// Presents beneficiaries, friends and executor navigation
// Owns people entry points.
// Does not grant friends access to vault data.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/ui/page_frame.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});
  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'People',
    children: [
      Card(
        child: ListTile(
          leading: const Icon(Icons.people_outline),
          title: const Text('Beneficiaries'),
          subtitle: const Text('The people who receive your legacy'),
          onTap: () => context.push('/beneficiaries'),
        ),
      ),
      Card(
        child: ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: const Text('Friends and family'),
          subtitle: const Text(
            'Trusted contacts who help us reach your beneficiaries',
          ),
          onTap: () => context.push('/friends'),
        ),
      ),
      Card(
        child: ListTile(
          leading: const Icon(Icons.lock_open_outlined),
          title: const Text('Executor workspace'),
          subtitle: const Text('Read the wills released to you'),
          onTap: () => context.push('/executor'),
        ),
      ),
    ],
  );
}
