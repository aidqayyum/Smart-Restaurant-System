import 'package:flutter/material.dart';
import 'package:srs_admin/admin.dart';
import 'package:srs_admin/login.dart';
import 'package:srs_admin/registeration.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
  ));
}
class HomePage extends StatefulWidget {
  final Admin admin;

  const HomePage({Key key, this.admin}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}
class _HomePage extends State<HomePage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Text("This is dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("AidilQayyum"), 
              accountEmail: Text("aidiilqayyum@yahoo.com")),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard")),
              ListTile(
                leading: Icon(Icons.attach_money),
                title: Text("Finance")),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile")),
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