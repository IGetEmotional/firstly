import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      Container(
        child: Column(
          children: <Widget>[
            const Text(
              'Here it is!',
              style: TextStyle(fontSize: 20, backgroundColor: Colors.amber),
            ),
            const Spacer(),
            const Image(image: AssetImage("lib/assets/images/capricorn.png")),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                showAlertDialog(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber)),
              child: const Text("Help"),
            )
          ],
        ),
      ),
      Image.network(
        'https://sun9-66.userapi.com/impf/Hmxvzzz8K_OdGfdwjdcC6MjeTmNyZnxWgf6kFA/GAzuiYHkYGQ.jpg?size=1200x600&quality=96&proxy=1&sign=4c705abb2bbf81485af596e2bbc79284',
        filterQuality: FilterQuality.high,
        height: 600,
        width: 300,
        alignment: Alignment(0.02, 0),
        fit: BoxFit.none,
        scale: 1.5,
      ),
    ];
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 254, 145, 188),
          title: const Text("My First App"),
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 223, 154, 179),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.indigo,
                size: 30,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.indigo,
                size: 30,
              ),
              label: "Settings",
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      theme: ThemeData.light(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text('ok'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
