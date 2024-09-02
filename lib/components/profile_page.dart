import 'package:flutter/material.dart';
import 'package:gdsc_app/components/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();

  String _username = '';
  String _email = '';
  String _bio = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.black,
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _username,
                decoration: InputDecoration(labelText: 'Username'),
                onSaved: (value) {
                  _username = value ?? '';
                },
              ),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) {
                  _email = value ?? '';
                },
              ),
              TextFormField(
                initialValue: _bio,
                decoration: InputDecoration(labelText: 'Bio'),
                maxLines: 3,
                onSaved: (value) {
                  _bio = value ?? '';
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Update the user's profile information in the provider
                    Provider.of<UserProvider>(context, listen: false)
                        .updateUser(_username, _email, _bio);

                    // Go back to the previous screen
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
