import 'package:flutter/material.dart';
import 'package:gofit/screens/account_setup/pages/account_pages.dart';

class AccountSetupScreen extends StatelessWidget {
   AccountSetupScreen({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: ((context) =>  AccountSetupScreen()),
      );

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: accountPages.length,
        itemBuilder: (context, index) {
          return accountPages.elementAt(index);
        },
      ),
    );
  }
}
