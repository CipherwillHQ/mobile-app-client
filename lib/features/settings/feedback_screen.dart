// Collects feedback through the existing Cipherwill operation.
// Owns a multiline draft, submission state and confirmed-success clearing.
// Does not attach vault contents or send feedback without a user action.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/guide_panel.dart';
import '../../shared/ui/actions.dart';

class FeedbackScreen extends ConsumerStatefulWidget {
  const FeedbackScreen({super.key});
  @override
  ConsumerState<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends ConsumerState<FeedbackScreen> {
  final message = TextEditingController();
  final form = GlobalKey<FormState>();
  bool busy = false;
  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  Future<void> send() async {
    if (busy || !form.currentState!.validate()) return;
    setState(() => busy = true);
    await perform(context, () async {
      await ref.read(apiProvider).run('sendFeedback', {
        'email': ref.read(firebaseProvider).currentUser?.email,
        'message': message.text,
      });
      if (mounted) message.clear();
    }, success: 'Feedback sent.');
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Feedback',
    subtitle: 'Help shape a more thoughtful Cipherwill.',
    children: [
      const GuidePanel(
        title: 'We’re listening',
        message:
            'Tell us what worked, what felt difficult, or what you’d like to see next.',
        icon: Icons.chat_bubble_outline_rounded,
      ),
      const SizedBox(height: 16),
      PanelSection(
        title: 'Your feedback',
        children: [
          Form(
            key: form,
            child: TextFormField(
              controller: message,
              minLines: 6,
              maxLines: 12,
              enabled: !busy,
              decoration: const InputDecoration(
                labelText: 'Message',
                hintText: 'Share your thoughts…',
              ),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Enter your feedback'
                  : null,
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: busy ? null : send,
            icon: const Icon(Icons.send_outlined),
            label: Text(busy ? 'Sending…' : 'Send feedback'),
          ),
        ],
      ),
    ],
  );
}
