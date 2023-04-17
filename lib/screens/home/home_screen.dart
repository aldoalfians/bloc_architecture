import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: Container(
                color: Colors.grey.shade300,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Joni Sumanto",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text("joni.sumanto@gmail.com"),
            SizedBox(height: 20),
            Text("============== MASAKAN =============="),
            SizedBox(height: 20),
            Text("Mie Ayam Enak Banget"),
            SizedBox(height: 5),
            Text("5 porsi"),
            SizedBox(height: 5),
            Text("Tingkat kesulitan ( Rumit )"),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 150,
              child: Container(
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
    );
  }
}
