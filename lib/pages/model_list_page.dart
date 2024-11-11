import 'package:flutter/material.dart';

class ModelListPage extends StatelessWidget {
  const ModelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> models = [
      {'name': 'Demo', 'image': 'assets/demo.png', 'src': 'assets/demo.glb', 'flat': '1', 'inside': 'assets/interior3d.glb'},
      {'name': 'House_demo_1', 'image': 'assets/House_model_demo_1.png', 'src': 'assets/House_demo_1.glb', 'flat': '2', 'inside': 'assets/interior3d.glb'},
      {'name': 'House_demo_2', 'image': 'assets/House_model_demo_2.png', 'src': 'assets/House_demo_2.glb', 'flat': '3', 'inside': 'assets/interior3d.glb'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('3D Model List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: ListView.builder(
          itemCount: models.length,
          itemBuilder: (context, index) {
            final model = models[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0), 
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/viewer',
                    arguments: model['src'], 
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 8, 
                  shadowColor: Colors.grey.withOpacity(0.5), 
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          model['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align leading and trailing text
                            children: [

                              Text(
                                model['name']!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/flats',
                                    arguments: model['src'],
                                  );
                                },
                                child: const Text(
                                  'Available Flats', // Replace with your trailing text
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54,
                                  ),
                                ),

                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
