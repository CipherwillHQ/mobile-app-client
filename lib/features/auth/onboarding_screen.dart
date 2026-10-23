// Collects account onboarding answers from the backend catalog
// Owns selection state and completion.
// Does not hard-code survey membership.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/photo_banner.dart';
import '../../shared/ui/section_heading.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  final Json onboarding;
  final VoidCallback completed;
  const OnboardingScreen({
    super.key,
    required this.onboarding,
    required this.completed,
  });
  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  String? heard;
  final expectations = <String>{};
  final customHeard = TextEditingController();
  final customExpectations = TextEditingController();
  bool busy = false;
  @override
  void dispose() {
    customHeard.dispose();
    customExpectations.dispose();
    super.dispose();
  }

  Future<void> finish(bool skip) async {
    if (busy) return;
    setState(() => busy = true);
    await perform(context, () async {
      await ref.read(apiProvider).run('COMPLETE_MY_ONBOARDING', {
        'data': {
          'heard_from_option_id': heard,
          'heard_from_custom': customHeard.text,
          'expectations_selected_ids': expectations.toList(),
          'expectations_custom': customExpectations.text,
          'skip_questions': skip,
        },
      });
      widget.completed();
    });
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Welcome to Cipherwill',
    children: [
      const PhotoBanner(
        title: 'For everyone you love.',
        message: 'Let’s make your plan feel like you.',
      ),
      const SizedBox(height: 24),
      Text(
        'A little about you',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      const SizedBox(height: 16),
      const SectionHeading('Where did you hear about us?'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final option in jsonList(
            widget.onboarding['heard_from_options_catalog'],
          ))
            ChoiceChip(
              label: Text(option['label']),
              selected: heard == option['id'],
              onSelected: busy
                  ? null
                  : (_) => setState(() => heard = option['id']),
            ),
        ],
      ),
      if (jsonList(
        widget.onboarding['heard_from_options_catalog'],
      ).any((o) => o['id'] == heard && o['requires_custom_text'] == true))
        TextField(
          controller: customHeard,
          decoration: const InputDecoration(labelText: 'Tell us more'),
        ),
      const SizedBox(height: 24),
      const SectionHeading('What would you like to do?'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final option in jsonList(
            widget.onboarding['expectation_options_catalog'],
          ))
            FilterChip(
              label: Text(option['label']),
              selected: expectations.contains(option['id']),
              onSelected: busy
                  ? null
                  : (selected) => setState(
                      () => selected
                          ? expectations.add(option['id'])
                          : expectations.remove(option['id']),
                    ),
            ),
        ],
      ),
      if (jsonList(widget.onboarding['expectation_options_catalog']).any(
        (o) =>
            expectations.contains(o['id']) && o['requires_custom_text'] == true,
      ))
        TextField(
          controller: customExpectations,
          decoration: const InputDecoration(labelText: 'Your expectations'),
        ),
      const SizedBox(height: 24),
      FilledButton(
        onPressed: busy ? null : () => finish(false),
        child: const Text('Continue'),
      ),
      TextButton(
        onPressed: busy ? null : () => finish(true),
        child: const Text('Skip these questions'),
      ),
    ],
  );
}
