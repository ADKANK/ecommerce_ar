import 'package:flutter/material.dart';

class Flats extends StatefulWidget {
  const Flats({Key? key}) : super(key: key);

  @override
  _FlatsState createState() => _FlatsState();
}

class _FlatsState extends State<Flats> {
  @override

  bool isAvailable = true;
  bool isBooked = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Flats'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Flat 1'),
            subtitle: const Text('2 BHK'),
            trailing: isAvailable
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAvailable = false;
                        isBooked = true;
                      });
                    },
                    child: const Text('Book'),
                  )
                : isBooked
                    ? const Text('Booked')
                    : const Text('Sold'),
          ),
          ListTile(
            title: const Text('Flat 2'),
            subtitle: const Text('3 BHK'),
            trailing: isAvailable
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAvailable = false;
                        isBooked = true;
                      });
                    },
                    child: const Text('Book'),
                  )
                : isBooked
                    ? const Text('Booked')
                    : const Text('Sold'),
          ),
          ListTile(
            title: const Text('Flat 3'),
            subtitle: const Text('1 BHK'),
            trailing: isAvailable
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAvailable = false;
                        isBooked = true;
                      });
                    },
                    child: const Text('Book'),
                  )
                : isBooked
                    ? const Text('Booked')
                    : const Text('Sold'),
          ),
        ],
      ),
    );
  }
}