import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  const Blog({super.key, required this.updateBlog});
  final Function(String, String) updateBlog;

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
        title: const Text("Add Blog"),
        centerTitle: true,
      ),
      body: Column(children: [
        Form(
          child: Column(
            children: [
              SizedBox(
                width: 375.0,
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: "Blog Title",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 375.0,
                height: 350.0,
                child: TextFormField(
                  controller: descriptionController,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    labelText: "Blog Description",
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
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  widget.updateBlog(
                      titleController.text, descriptionController.text);
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text("Add Post"),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
