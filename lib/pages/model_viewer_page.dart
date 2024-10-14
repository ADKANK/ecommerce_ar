import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerPage extends StatelessWidget {
  const ModelViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? modelSrc = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: const Text('Model Viewer')),
      body: modelSrc != null
          ? ModelViewer(
              backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
              src: modelSrc,
              alt: 'A 3D model',
              ar: true,
              arModes: ['scene-viewer', 'webxr', 'quick-look'],
              autoRotate: true,
              disableZoom: true,
            )
          : const Center(child: Text('Model not found')),
    );
  }
}
