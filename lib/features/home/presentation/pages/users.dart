import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/features.dart';
import 'package:fundzy/injections.dart';
import 'package:provider/provider.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      allUsersActivity();
    });
  }

  Future<void> allUsersActivity() async {
    var loader = sl<AllUsersProvider>().allUsersEntity?.isNotEmpty == true;
    await sl<AllUsersProvider>().alluserHandler(context, loader);
  }

  Future<void> refreshList() async {
    Future.delayed(Duration.zero, () async {
      var loader = sl<AllUsersProvider>().allUsersEntity?.isNotEmpty == true;
      await sl<AllUsersProvider>().alluserHandler(context, loader);
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
            'Users',
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
          child: Consumer<AllUsersProvider>(
              builder: (context, allUsersProvider, child) {
            return allUsersProvider.isComplete == false
                ? const Text('')
                : allUsersProvider.allUsersEntity!.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Align(
                            child: NoDataWidget(
                                text: 'Error occurred. Try again!'),
                          )
                        ],
                      )
                    : allUsersProvider.allUsersEntity!.isEmpty
                        ? const NoDataWidget(text: "No Users")
                        : ListView.builder(
                            itemCount: allUsersProvider.allUsersEntity!.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              var item =
                                  allUsersProvider.allUsersEntity![index];
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
                                  title:
                                      Text('PhoneNumber: ${item.phoneNumber}'),
                                  subtitle: Text(
                                      'Balance: $finalAmount , \n\n Date: $created'),
                                  isThreeLine: true,
                                ),
                              );
                            },
                          );
          }),
        ));
  }
}
