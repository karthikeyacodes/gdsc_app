import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Blog"),
        centerTitle: true,
      ),
      body: Column(children: [
        Form(
          child: Column(
            children: [
              SizedBox(
                width: 375.0,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter something";
                    } else {
                      title = value;
                      return null;
                    }
                  },
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "Blog Title",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 375.0,
                height: 350.0,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter something";
                    } else {
                      description = value;
                      return null;
                    }
                  },
                  controller: descriptionController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: "Blog Description",
                    border: OutlineInputBorder(),
                    // filled: true.
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'title': titleController.text,
                    'description': descriptionController.text,
                  });
                },
                child: Text("Add Post"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
