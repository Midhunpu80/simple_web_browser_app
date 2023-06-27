

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:share_plus/share_plus.dart';
import 'package:websearch/model/searchmodel.dart';
import 'package:websearch/service/api.dart';

class google extends StatefulWidget {


  @override
  State<google> createState() => _googleState();
}

Future<Search>? alldata;
bool isloading = false;

class _googleState extends State<google> {
  @override
  void initState() {
    super.initState();
    getallofthem('');
  }

  getallofthem(String query) {
    setState(() {
      isloading = true;

      alldata = getapiposted(query);
    });
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading:const  Icon(Icons.web,color: Colors.white,size: 35,),
            backgroundColor: Colors.black,
            centerTitle: true,
            title:const  Text(
              "GOOGLE",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 25,
              ),
            ),
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 100,
                  child: TextFormField(
                    controller: controller,
                    style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                        ),
                        hintText: "Search something",
                        hintStyle: const TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              getallofthem(controller.text);
                            },
                            icon: const Icon(Icons.send))),
                  ),
                ),
              ),
              FutureBuilder<Search>(
                  future: alldata,
                  builder: (context, AsyncSnapshot<Search> snapshot) {
                    if (!snapshot.hasData) {
                      return const Text(
                        "Is empty",
                        style: TextStyle(color: Colors.white),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 655,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  await Share.share(
                                      snapshot.data!.items[index].link);
                                },
                                child: Card(
                                  color: Colors.white,
                                  child: Container(
                                      height: 170,
                                      color: Colors.white.withOpacity(0.3),
                                      child: Row(children: [
                                        Container(
                                          height: 200,
                                          width: 100,
                                          color: Colors.amber,
                                        ),
                                        SizedBox(
                                          height: 210,
                                          width: 285,
                                          //     color: Colors.red,
                                          child: Column(
                                            children: [
                                              Text(
                                                snapshot.data!.items[index]
                                                    .displayLink
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        left: 10),
                                                child: Text(
                                                  snapshot.data!.items[index]
                                                      .title
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        left: 10),
                                                child: Text(
                                                  snapshot
                                                      .data!.items[index].link
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 187, 255),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        left: 10),
                                                child: Text(
                                                  snapshot.data!.items[index]
                                                      .snippet
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ])),
                                ),
                              );
                            },
                            itemCount: snapshot.data!.items.length,
                          ),
                        ),
                      );
                    }
                  })
            ],
          )),
    );
  }
}
