import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/home/home.dart';
import 'package:fundzy/injections.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      allAccountActivity();
    });
  }

  Future<void> allAccountActivity() async {
    var loader = sl<AllAccountProvider>().allAccountEntity?.isNotEmpty == true;
    await sl<AllAccountProvider>().allaccountsHandler(context, loader);
  }

  Future<void> refreshList() async {
    Future.delayed(Duration.zero, () async {
      var loader =
          sl<AllAccountProvider>().allAccountEntity?.isNotEmpty == true;
      await sl<AllAccountProvider>().allaccountsHandler(context, loader);
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
          'Accounts',
          style: TextStyle(
            fontFamily: AppFont.montserratBold,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 12, 8, 8),
            fontSize: 20,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => refreshList(),
        color: AppColors.primaryColor,
        child: Consumer<AllAccountProvider>(
            builder: (context, allAccountProvider, child) {
          return allAccountProvider.isComplete == false
              ? const Text('')
              : allAccountProvider.allAccountEntity!.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Align(
                          child:
                              NoDataWidget(text: 'Error occurred. Try again!'),
                        )
                      ],
                    )
                  : allAccountProvider.allAccountEntity!.isEmpty
                      ? const NoDataWidget(text: "No Transaction")
                      : ListView.builder(
                          itemCount:
                              allAccountProvider.allAccountEntity!.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var item =
                                allAccountProvider.allAccountEntity![index];
                            dynamic initialAmount;
                            item.balance != null
                                ? initialAmount = item.balance!.toDouble()
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
