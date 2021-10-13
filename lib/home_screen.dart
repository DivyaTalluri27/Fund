import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mutual_fund/home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTabScreen(),
    Text('', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('B', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('C', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff0D4593)),
        title: Padding(
          padding: const EdgeInsets.only(right: 84, bottom: 12),
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
            height: 50,
            width: 80,
          ),
        ),
        toolbarHeight: 65,
        actions: <Widget>[
          // padding: const EdgeInsets.only(left: 256),
          IconButton(
            icon: const Icon(
              Icons.bookmark_border,
              color: Color(0xff0D4593),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff0D4593),
        currentIndex: _selectedIndex,
        elevation: 5,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedItemColor: Color(0xff0D4593),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/bottom1.png"),
              color: Color(0xFF3A5A98),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/bottom2.png"),
              color: Color(0xFF3A5A98),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/bottom3.png"),
              color: Color(0xFF3A5A98),
            ),
            label: 'Profile',
          ),
          // if (auth.userType == UserType.client)
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/bottom4.png"),
              color: Color(0xFF3A5A98),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
