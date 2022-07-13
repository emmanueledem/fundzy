import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/constant.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Users',
          style: TextStyle(
            fontFamily: AppFont.montserrat,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 12, 8, 8),
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('PhoneNumber: 08100177435'),
              subtitle:
                  Text('Balance: 200000, \n\n Date: 2022-07-07T23:09:14.670Z'),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}
