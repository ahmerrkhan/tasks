import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:video_editor/video_editor.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoEditorController? _videoEditorController;

  File? _video;
  final picker = ImagePicker();

  _pickVideo() async {
    final video = await picker.pickVideo(source: ImageSource.gallery);

    _video = File(video!.path);

    _videoEditorController = VideoEditorController.file(_video!)
      ..initialize().then((_) {
        setState(() {});

        _videoEditorController!.isPlaying;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Editor App'),
      ),
    );
  }
}
