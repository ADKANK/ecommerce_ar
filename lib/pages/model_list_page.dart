import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ecommerce_ar/models/real_estate.dart' ;
import 'package:http/http.dart';

class ModelListPage extends StatefulWidget {
  const ModelListPage({super.key});

  @override
  _ModelListPageState createState() => _ModelListPageState();
}

class _ModelListPageState extends State<ModelListPage> {
  late Future<List<RealEstate>> _realEstates;

  Future<List<RealEstate>> fetchRealEstates() async {
    final response = await get(Uri.parse('https://ecommerce-ar-server.vercel.app/api/real-estates'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => RealEstate.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load real estate data');
    }
  }

  @override
  void initState() {
    super.initState();
    _realEstates = fetchRealEstates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('3D Model List')),
      body: FutureBuilder<List<RealEstate>>(
        future: _realEstates,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          final realEstates = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: realEstates.length,
              itemBuilder: (context, index) {
                final realEstate = realEstates[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/viewer',
                        arguments: realEstate.modelUrl,
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
                            Image.network(
                              realEstate.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    realEstate.name,
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
                                        arguments: realEstate.id
                                      );
                                    },
                                    child: const Text(
                                      'Available Flats',
                                      style: TextStyle(
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
          );
        },
      ),
    );
  }
}
