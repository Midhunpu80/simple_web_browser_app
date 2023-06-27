// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:websearch/screens/duck.dart';
import 'package:websearch/screens/google.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Search engines",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 105, 104, 104),
      ),
      body: SizedBox(
        height: 1000,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => duck()));
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset.fromDirection(3, 5),
                        spreadRadius: 6)
                  ],
                ),
                height: 200,
                width: 200,
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMSVccPlEiUjzwT82xBUPGiS1zGQZ-lBNbRw&usqp=CAU"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => google()));
              },
              child: Container(
                height: 200,
                width: 200,
                // ignore: prefer_const_literals_to_create_immutables
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset.fromDirection(3, 5),
                          spreadRadius: 6)
                    ]),
                child: Image.network(
                    "https://play-lh.googleusercontent.com/RZ5luCUwc5QtJP9xDn-ZCwEutT160GVyoh5K1eu4YJ5fD7v4LP5ptVdgR9mz4Hnr7A=w240-h480-rw"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
