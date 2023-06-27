// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:websearch/screens/duck.dart';
import 'package:websearch/screens/google.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(40, 0, 140, 255),
      appBar: AppBar(
        actions: const [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://cdna.artstation.com/p/assets/images/images/016/471/998/large/vinicio-shurman-fiverrdeseho.jpg?1552310234"),
            backgroundColor: Colors.amber,
          )
        ],
        leading: Icon(
          Icons.web,
          color: Colors.white,
          size: 38,
        ),
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Search engines",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
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
                  borderRadius: BorderRadius.circular(25),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMSVccPlEiUjzwT82xBUPGiS1zGQZ-lBNbRw&usqp=CAU"),
                ),
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
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset.fromDirection(3, 5),
                          spreadRadius: 6)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                      "https://play-lh.googleusercontent.com/RZ5luCUwc5QtJP9xDn-ZCwEutT160GVyoh5K1eu4YJ5fD7v4LP5ptVdgR9mz4Hnr7A=w240-h480-rw"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
