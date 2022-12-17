import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mysecond/secondpage.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List res = [];
  @override
  dynamic initState() {
    super.initState();
    fetchdata();
  }

  Future<dynamic> fetchdata() async {
    var client = http.Client();
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5a506e349dcd42a3b996ec04f8a6105d');
    http.Response response = await http.get(url);
    var respons = jsonDecode(response.body);

    if (respons['status'] == "ok") {
      res = respons['articles'];
      print(res);
      return res;
    } else {
      print("Oh shittt");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News2Tech',
          style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Color.fromARGB(255, 42, 19, 53),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        bottom: PreferredSize(
            child: SizedBox(), preferredSize: Size.fromHeight(20)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(11.0),
            child: Container(
                // padding: EdgeInsets.zero,
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0)
                    ]),
                child: Container(
                  child: Stack(children: [
                    Image.network(
                      res[0]['urlToImage'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                        left: 17,
                        top: 160,
                        child: Text(
                          res[0]['title'],
                          maxLines: 2,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        )),
                  ]),
                  // child: Text(res[0]['author'], style: GoogleFonts.acme()),
                  // decoration: const BoxDecoration(
                  //   image: DecorationImage(
                  //     image: NetworkImage('https://picsum.photos/200/300'),
                  //     fit: BoxFit.fitWidth,
                  //   ),
                  // ),
                )),
          ),
          Container(
            height: 100,
            color: Colors.white,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 42, 19, 53),
                  radius: 30,
                  child: Icon(
                    Icons.newspaper,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 42, 19, 53),
                  radius: 30,
                  child: Icon(
                    Icons.speed,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 42, 19, 53),
                  radius: 30,
                  child: Icon(
                    Icons.fork_right,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 42, 19, 53),
                  radius: 30,
                  child: Icon(
                    Icons.wysiwyg_sharp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 42, 19, 53),
                  radius: 30,
                  child: Icon(
                    Icons.local_post_office,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(Icons.newspaper),
                ),
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(Icons.newspaper),
                ),
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(width: 30),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: res.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Image.network(
                                  res[index + 1]['urlToImage'],
                                  width: 120,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(height: 12),
                                    Text(
                                      res[index + 1]['title'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "~" + res[index + 1]['author'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              secondpage(index: index, res: res)));
                    },
                  );
                })),
          )
        ],
      ),
    );
  }
}
