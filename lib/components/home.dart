// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gdsc_app/components/blog_card.dart';
import 'package:gdsc_app/components/blog_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSwitched = false;
  String title = '';
  String description = '';
  List<String> titleList = [];
  List<String> descriptionList = [];

  void updateBlogDetails(String newTitle, String newDescription) {
    setState(() {
      titleList.add(newTitle);
      descriptionList.add(newDescription);
      title = newTitle;
      description = newDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Hello User!"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
        ],
      ),
      drawer: Drawer(
        child: Container(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              accountName: Text(
                "User",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "user@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Switch(
                  activeColor: Colors.black,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                Text(
                  "Dark/Light Mode",
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            ListTile(
              horizontalTitleGap: 35.0,
              leading: Icon(
                Icons.settings,
                size: 30.0,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () {},
            ),
            ListTile(
              horizontalTitleGap: 35.0,
              leading: Icon(
                Icons.info,
                size: 30.0,
              ),
              title: Text(
                "About",
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () {},
            ),
          ],
        )),
      ),
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: ((context, index) {
          return BlogCard(
              title: titleList[index], description: descriptionList[index]);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Blog(updateBlog: updateBlogDetails)));
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.cyan,
        elevation: 10.0,
      ),
    );
  }
}
