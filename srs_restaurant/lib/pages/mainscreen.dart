import 'package:flutter/material.dart';
import 'package:srs_restaurant/pages/login.dart';
import 'package:srs_restaurant/pages/registeration.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
  ));
}

class HomePage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Text("Hello Dr."),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("AidilQayyum"), 
              accountEmail: Text("aidiilqayyum@yahoo.com")),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Name"),
                subtitle: Text("Mohamad Aidil Qayyum"),
                trailing: Icon(Icons.edit)),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("User ID"),
                subtitle: Text("aidilqayyum"),
                trailing: Icon(Icons.edit)),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("Email"),
                subtitle: Text("aidiilqayyum@yahoo.com"),
                trailing: Icon(Icons.edit)),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Phone Number"),
                subtitle: Text("0123654789"),
                trailing: Icon(Icons.edit)),  
              Container(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings')),
                        ListTile(
                          leading: Icon(Icons.add_to_home_screen),
                          title: Text('Login'),
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginPage()));
                          }),
                          ListTile(
                          leading: Icon(Icons.create),
                          title: Text('Register'),
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => RegisterScreen()));
                          }),
                        ListTile(
                          leading: Icon(Icons.help),
                          title: Text('Help and Feedback')),
                        ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Exit')),
                      ],)
                  ),)
              )
          ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
        ),
    );
  }
}