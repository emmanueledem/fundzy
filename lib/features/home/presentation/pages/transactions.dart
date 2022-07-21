import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/home/presentation/presentation.dart';
import 'package:fundzy/injections.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      transactionActivity();
    });
  }

  Future<void> transactionActivity() async {
    var loader =
        sl<TransactionProvider>().transactionEntity?.isNotEmpty == true;
    await sl<TransactionProvider>().transactionHandler(context, loader);
  }

  Future<void> refreshList() async {
    Future.delayed(Duration.zero, () async {
      var loader =
          sl<TransactionProvider>().transactionEntity?.isNotEmpty == true;
      await sl<TransactionProvider>().transactionHandler(context, loader);
    });
  }

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
      body: RefreshIndicator(
        onRefresh: () => refreshList(),
        color: AppColors.primaryColor,
        child: Consumer<TransactionProvider>(
            builder: (context, transactionProvider, child) {
          return transactionProvider.isComplete == false
              ? const Text('')
              : transactionProvider.transactionEntity!.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Align(
                          child:
                              NoDataWidget(text: 'Error occurred. Try again!'),
                        )
                      ],
                    )
                  : transactionProvider.transactionEntity!.isEmpty
                      ? const NoDataWidget(text: "No Transaction")
                      : ListView.builder(
                          itemCount:
                              transactionProvider.transactionEntity!.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var item =
                                transactionProvider.transactionEntity![index];
                            dynamic initialAmount;
                            item.amount != null
                                ? initialAmount = item.amount!.toDouble()
                                : initialAmount = double.parse('0.00');
                            var finalAmount =
                                AmountUtil.formatAmount(initialAmount);
                            var created =
                                DateUtil.formatDate(item.created as DateTime);
                            return Card(
                              child: ListTile(
                                title: Text('PhoneNumber: ${item.phoneNumber}'),
                                subtitle: Text(
                                    'Amount: $finalAmount , \n\n Date: $created'),
                                trailing: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: item.type == 'credit'
                                        ? Colors.green
                                        : Colors.red),
                                isThreeLine: true,
                              ),
                            );
                          },
                        );
        }),
      ),
    );
  }
}
