import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('İlk Uygulamam'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Add your search action logic here
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Add your settings action logic here
          },
        ),
      ],
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            buildDrawerItem('Sign Up', () {}),
            buildDrawerItem('Login', () {}),
          ],
        ),
      ),
    );
  }

  ListTile buildDrawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }

  Container buildBody() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Uygulamama hoşgeldin',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          buildRow(),
          SizedBox(height: 20.0),
          if (isButtonPressed)
            buildInfoText(),
          SizedBox(height: 20.0),
          buildExplanationText(),
        ],
      ),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildColumn('Widget 1', Colors.amber, 'OPEN Text Button', true),
        SizedBox(
          width: 25,
        ),
        buildColumn('Widget 2', Colors.amber, 'CLOSE Text Button', false),
      ],
    );
  }

  Column buildColumn(String text, Color color, String buttonText, bool open) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isButtonPressed = open;
            });
          },
          child: Text(buttonText),
        ),
      ],
    );
  }

  Text buildInfoText() {
    return Text(
      'You pressed the OPEN button, press the CLOSE button to undo.',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }

  Column buildExplanationText() {
    return Column(
      children: [
        Text(
          'Açıklama:',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Bu benim ilk mobil uygulama ödevim',
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Dialog Title'),
              content: Text('This is a dialog box.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
