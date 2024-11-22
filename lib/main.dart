import 'package:ecommerce_ar/pages/3d.dart';
import 'package:ecommerce_ar/pages/flats.dart';
import 'package:flutter/material.dart';
import 'pages/model_list_page.dart';
import 'pages/model_viewer_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D Model Viewer',
      initialRoute: '/',
      routes: {
        '/': (context) => const ModelListPage(),
        '/viewer': (context) => const ModelViewerPage(),
        '/flats': (context) => Flats(realEstateId: ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}
