// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gdsc_app/components/blog_view.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyan[300],
      elevation: 10.0,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.notes_rounded),
            title: Text(title),
            subtitle: Text(
              description,
              maxLines: 1,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BlogView(title: title, description: description)));
            },
          ),
        ],
      ),
    );
  }
}
