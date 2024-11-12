import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Flats extends StatefulWidget {
  final String realEstateId;

  const Flats({Key? key, required this.realEstateId}) : super(key: key);

  @override
  _FlatsState createState() => _FlatsState();
}

class _FlatsState extends State<Flats> {
  List flats = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchFlats();
  }

  // Fetch flats data from the API
  Future<void> fetchFlats() async {
    try {
      final response = await http.get(
        Uri.parse('https://ecommerce-ar-server.vercel.app/api/real-estates/${widget.realEstateId}/flats'),
      );
      if (response.statusCode == 200) {
        setState(() {
          flats = json.decode(response.body); 
          isLoading = false;
          print(flats);
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load flats. Status code: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }

  // Function to book a flat
  Future<void> bookFlat(String flatId) async {
  try {
    final response = await http.patch(
      Uri.parse('https://ecommerce-ar-server.vercel.app/api/real-estates/${widget.realEstateId}/flats/$flatId/toggle-availability'),
    );
    
    if (response.statusCode == 200) {
      setState(() {
        flats.firstWhere((flat) => flat['_id'] == flatId)['status'] = 'booked';
  
      });
    } else {
      setState(() {
        errorMessage = 'Failed to book flat. Please try again.';
      });
    }
  } catch (e) {
    setState(() {
      errorMessage = 'Error booking the flat: $e';
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Flats'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
  itemCount: flats.length,
  itemBuilder: (context, index) {
    final flat = flats[index];

    return ListTile(
      title: Text(flat['flatNumber']), 
      subtitle: Text(flat['status']),
      trailing: flat['status'] == 'available'
          ? ElevatedButton(
              onPressed: () {
                bookFlat(flat['_id']);
              },
              child: const Text('Book'),
            )
          : const Text('Booked'),
    );
  },
              )
    );
  }
}


