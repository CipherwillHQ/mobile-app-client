// Presents trusted contacts and the separate executor workspace.
// Owns People navigation and contextual release explanations.
// Does not grant friends access to vault data.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/design_tokens.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/photo_banner.dart';
import '../../shared/ui/section_heading.dart';
import '../../shared/ui/feature_card.dart';
import '../../shared/ui/guide_panel.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});
  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Your people',
    subtitle: 'A thoughtful handoff starts with the people you trust.',
    children: [
      const PhotoBanner(
        title: 'For the people\nyou love.',
        message: 'Your digital legacy is a way to keep taking care of them.',
      ),
      const SectionHeading('Your trusted circle'),
      FeatureCard(
        title: 'Beneficiaries',
        subtitle: 'The people who receive your legacy',
        icon: Icons.people_outline_rounded,
        color: CipherwillColors.clay,
        onTap: () => context.push('/beneficiaries'),
      ),
      FeatureCard(
        title: 'Friends and family',
        subtitle: 'Trusted contacts who help us reach your beneficiaries',
        icon: Icons.favorite_outline_rounded,
        color: CipherwillColors.sage,
        onTap: () => context.push('/friends'),
      ),
      const SectionHeading('When someone trusts you'),
      FeatureCard(
        title: 'Executor workspace',
        subtitle: 'Read the wills released to you',
        icon: Icons.lock_open_outlined,
        onTap: () => context.push('/executor'),
      ),
      const SizedBox(height: 18),
      const GuidePanel(
        title: 'Access stays in your hands',
        message:
            'Beneficiaries receive only the information you allow, when the conditions in your timeline are met.',
      ),
    ],
  );
}
