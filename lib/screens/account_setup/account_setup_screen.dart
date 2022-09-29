import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';

class AccountSetupScreen extends StatelessWidget {
  const AccountSetupScreen({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: ((context) => const AccountSetupScreen()),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: defaultPadding,
          horizontal: defaultPadding * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tell Us About Yourself',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge!.color,
                        ),
                  ),
                  const SizedBox(height: defaultPadding),
                  Text(
                    'To give you a better experience and results\nwe need to know your gender.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: Text(
                  'Continue',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
