import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(children: [
          Expanded(
              // ด้านซ้าย
              flex: 7,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'ด้านซ้าย',
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.green,
                  actions: [
                    IconButton(
                        onPressed: () {
                          print('a');
                        },
                        icon: Icon(Icons.access_alarm)),
                    IconButton(
                        onPressed: () {
                          print('b');
                        },
                        icon: Icon(Icons.abc))
                  ],
                ),
                body: Column(children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.orange[300],
                      )),
                  Expanded(
                      flex: 8,
                      child: Container(
                        color: Colors.deepPurple,
                      ))
                ]),
                drawer: Drawer(
                  // Add a ListView to the drawer. This ensures the user can scroll
                  // through the options in the drawer if there isn't enough vertical
                  // space to fit everything.
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Text('Drawer Header'),
                      ),
                      ListTile(
                        title: const Text('Item 1'),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                      ListTile(
                        title: const Text('Item 2'),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
              //ด้านขวา
              flex: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'ด้านขวา',
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.yellow,
                ),
                body: Column(
                  children: [
                    Expanded(
                        flex: 8,
                        child: Container(
                          color: Colors.blue[300],
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.pink[200],
                        ))
                  ],
                ),
                bottomNavigationBar: ConvexAppBar(
                  style: TabStyle.react,
                  items: [
                    TabItem(icon: Icons.list, title: 'a'),
                    TabItem(icon: Icons.calendar_today, title: 'b'),
                    TabItem(icon: Icons.assessment, title: 'c'),
                  ],
                  initialActiveIndex: 1,
                  onTap: (int i) => print('click index=$i'),
                ),
              ))
        ]),
      ),
    );
  }
}
