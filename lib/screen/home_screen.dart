import 'package:flutter/material.dart';
import 'package:groundapp/ground_data/dummy_grounds.dart';
import 'package:groundapp/model/ground.dart';
import 'package:groundapp/screen/ground_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,

        title: Text(
          'Available Grounds',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyGrounds.length,
        itemBuilder: (ctx, index) {
          final ground = dummyGrounds[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GroundDetailsScreen(ground: ground),
                  ),
                );
              },

              child: Card(
                // margin: EdgeInsets.all(8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      ground.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      ground.location,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
