import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/constant.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Transactions',
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
              title: Text('PhoneNumber: 0987'),
              subtitle:
                  Text('Amount: 200000, \n\n Date: 2022-07-07T23:09:14.670Z'),
              trailing: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.green,
              ),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}
