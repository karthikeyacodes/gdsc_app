// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                13.0,
                0,
                13.0,
                0,
              ),
              width: MediaQuery.of(context).size.width,
              child: Text(
                title,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 13.0),
              width: MediaQuery.of(context).size.width,
              child: Text(
                description,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 13.0),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Written by User",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
          // child: Expanded(
          //     child: Column(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.fromLTRB(
          //         13.0,
          //         0,
          //         13.0,
          //         0,
          //       ),
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //       child: Text(
          //         title,
          //         style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 10.0,
          //     ),
          //     Container(
          //       width: MediaQuery.of(context).size.width,
          //       padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 13.0),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //       child: SingleChildScrollView(
          //         child: Text(
          //           description,
          //           style: TextStyle(fontSize: 18.0),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 10.0,
          //     ),
          //     Container(
          //       padding: EdgeInsets.only(left: 13.0),
          //       width: MediaQuery.of(context).size.width,
          //       child: Text(
          //         "Written by User",
          //         style: TextStyle(fontSize: 18.0),
          //       ),
          //     ),
          //   ],
          // )),
        ),
      ),
    );
  }
}
