// Previews authorized local images, PDFs, videos and text
// Owns native preview-controller lifetimes.
// Does not fetch remote resources or retain files.

import '../../app/app_icons.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:video_player/video_player.dart';
import 'file_metadata.dart';

class FilePreview extends StatefulWidget {
  final File file;
  const FilePreview({super.key, required this.file});
  @override
  State<FilePreview> createState() => _FilePreviewState();
}

class _FilePreviewState extends State<FilePreview> {
  VideoPlayerController? video;
  Future<String>? text;
  String? error;
  @override
  void initState() {
    super.initState();
    final ext = fileExtension(widget.file.path);
    if (ext == 'mp4') {
      video = VideoPlayerController.file(widget.file);
      video!
          .initialize()
          .then((_) {
            if (mounted) setState(() {});
          })
          .catchError((Object e) {
            if (mounted) setState(() => error = 'Video preview unavailable.');
          });
    }
    if (ext == 'txt') text = readText();
  }

  Future<String> readText() async {
    final bytes = await widget.file
        .openRead(0, 65536)
        .expand((chunk) => chunk)
        .toList();
    return utf8.decode(bytes, allowMalformed: true);
  }

  @override
  void dispose() {
    video?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ext = fileExtension(widget.file.path);
    if (error != null) return Text(error!);
    if (['png', 'jpg', 'jpeg', 'gif', 'webp'].contains(ext)) {
      return Image.file(
        widget.file,
        errorBuilder: (_, _, _) => const Text('Image preview unavailable.'),
      );
    }
    if (ext == 'pdf') {
      return SizedBox(height: 480, child: PdfViewer.file(widget.file.path));
    }
    if (ext == 'txt') {
      return FutureBuilder<String>(
        future: text,
        builder: (context, snapshot) =>
            SelectableText(snapshot.data ?? 'Loading text preview…'),
      );
    }
    if (video != null) {
      return video!.value.isInitialized
          ? Column(
              children: [
                AspectRatio(
                  aspectRatio: video!.value.aspectRatio,
                  child: VideoPlayer(video!),
                ),
                IconButton(
                  tooltip: video!.value.isPlaying ? 'Pause' : 'Play',
                  onPressed: () {
                    setState(() {
                      video!.value.isPlaying ? video!.pause() : video!.play();
                    });
                  },
                  icon: Icon(
                    video!.value.isPlaying ? AppIcons.pause : AppIcons.play,
                  ),
                ),
              ],
            )
          : const CircularProgressIndicator();
    }
    return const Text('Export this file to open it in a compatible app.');
  }
}
