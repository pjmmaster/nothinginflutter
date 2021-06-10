import 'package:flutter/material.dart';
import 'package:ptaskcheck/ui/calendar/TabCalendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTask();
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: Colors.blue[300],
        elevation: 2,
        iconSize: 22,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        enableFeedback: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(color: Colors.black87),
        unselectedLabelStyle: TextStyle(color: Colors.black54),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }

  addTask() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Add New Task')));
  }

  Widget getBody() {
    if (_currentIndex == 0) {
      return TabCalendar();
    } else if (this._currentIndex == 1) {
      return TabCalendar();
    } else {
      return TabCalendar();
    }
  }
}
