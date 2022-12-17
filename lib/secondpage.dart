import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class secondpage extends StatelessWidget {
  var index;
  var res;
  secondpage({super.key, required this.index, required this.res});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(11.0),
              child: Container(
                // padding: EdgeInsets.zero,
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0)
                    ]),
                child: Container(
                  child: Stack(children: [
                    Image.network(
                      res[index + 1]['urlToImage'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                        left: 15,
                        top: 160,
                        child: Text(res[index + 1]['title'],
                            maxLines: 3,
                            style: GoogleFonts.acme(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ))),
                  ]),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    child: Text(
                      res[index + 1]['description'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          res[index + 1]['publishedAt'],
                          style: GoogleFonts.acme(),
                        ),
                      ),
                      Container(
                        child: Text("~" +res[index + 1]['author'],
                        style: GoogleFonts.acme(),
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Text(res[index + 1]['content'],
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontWeight: FontWeight.bold))),
                  
                ],
              ),
            ),
          )
        ]));
  }
}
