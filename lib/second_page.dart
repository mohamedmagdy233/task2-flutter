import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondPage(
        phoneNumber: "123456789",
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final String phoneNumber;

  const SecondPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _pageIndex = 0;

  List<Widget> _pages = [
    MainScreen(),
    CategoriesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlueAccent,
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  children: [Text("Hello world")],
                ),
                height: 150,
                width: 200,
              ),
              Text("Hello"),
              Text(
                "Phone Number: ${widget.phoneNumber}",
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

//page main screeen
class MainScreen extends StatelessWidget {
  List<String> productNames = ["product 1", "mobile", "laptop"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ItemCard(productName: productNames[0]),
        ItemCard(productName: productNames[1]),
        ItemCard(productName: productNames[2]),
        // Add more ItemCard widgets as needed
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final String productName;

  const ItemCard({Key? key, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        iconColor: Color(0xffb55454),
        title: Text(productName),
      ),
    );
  }
}

//page gagtoogry screen
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.blue,
            child: Icon(
              Icons.abc, // Replace 'ac_unit' with a valid Flutter icon
            ),
          ),
        );
      },
    );
  }
}

//page setting screen
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CircleAvatar(
          radius: 50,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 60,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Color(0xffb7b394),
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text("Edit Profile"),
              subtitle: Text("Mange Your setting"),
              trailing: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Color(0xffb7b394),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting Profile"),
              subtitle: Text("Mange Your setting"),
              trailing: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Color(0xffb7b394),
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text("Setting Profile"),
              subtitle: Text("Mange Your setting"),
              trailing: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ],
    );
  }
}
