import 'package:flutter/material.dart';
import 'package:groundapp/ground_data/dummy_grounds.dart';
import 'package:groundapp/model/ground.dart';
import 'package:groundapp/screen/booking_screen.dart';

class GroundDetailsScreen extends StatelessWidget {
  final Ground ground;
  const GroundDetailsScreen({super.key, required this.ground});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(ground.name, style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  ground.imgUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 16),
              Text(
                ground.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                '${ground.location} : ${ground.type}',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
              SizedBox(height: 12),
              Text(ground.description),
              SizedBox(height: 20),
              Text(
                'Available Time Slots:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Wrap(
                spacing: 10,
                // runSpacing: 8,
                children:
                    ground.availableSlots
                        .map(
                          (slot) => Chip(
                            label: Text(slot),
                            backgroundColor: Colors.deepPurple.shade50,
                            labelStyle: TextStyle(color: Colors.deepPurple),
                          ),
                        )
                        .toList(),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookingScreen(grounds: dummyGrounds),
                      ),
                    );
                  },
                  child: Text('Book Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
