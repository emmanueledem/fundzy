import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/colors.dart';
import 'pages.dart';

class AppTabScreen extends StatefulWidget {
  const AppTabScreen({Key? key}) : super(key: key);

  @override
  State<AppTabScreen> createState() => _AppTabScreenState();
}

class _AppTabScreenState extends State<AppTabScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    TransactionScreen(),
    AllUsersScreen(),
    AccountScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          Align(
            alignment: const Alignment(0.0, 1.0),
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(0, 2),
                    blurRadius: 20,
                    spreadRadius: 0)
              ]),
              child: BottomNavigationBar(
                elevation: 300,
                unselectedItemColor: AppColors.black,
                backgroundColor: AppColors.white,
                currentIndex: _selectedIndex,
                selectedItemColor: AppColors.primaryColor,
                onTap: _onItemTapped,
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.rotate_left_outlined),
                    label: 'Transactions',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    label: 'Users',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_box),
                    label: 'Accounts',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
