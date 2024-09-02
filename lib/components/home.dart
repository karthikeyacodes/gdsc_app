// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gdsc_app/components/blog_card.dart';
import 'package:gdsc_app/components/blog_page.dart';
import 'package:gdsc_app/components/profile_page.dart';
import 'package:gdsc_app/components/user_provider.dart';
import 'package:gdsc_app/main.dart';
import 'package:provider/provider.dart';

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
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Hello User!"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileEditPage()));
              },
              icon: Icon(Icons.account_circle))
        ],
      ),
      drawer: Drawer(
        child: Container(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              accountName: Text(
                user.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                user.email,
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
                  value: themeNotifier.value == ThemeMode.dark,
                  onChanged: (value) {
                    themeNotifier.value =
                        value ? ThemeMode.dark : ThemeMode.light;
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
        foregroundColor: Colors.black,
        elevation: 10.0,
      ),
    );
  }
}
