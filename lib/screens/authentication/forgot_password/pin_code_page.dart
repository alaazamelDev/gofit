import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodePage extends StatelessWidget {
  PinCodePage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: ((context) => PinCodePage()),
      );

  final ValueNotifier<bool> pinCompleted = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding * 2),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Code has been sent to +1 (267) **** *87",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: defaultPadding * 3),
                  PinCodeTextField(
                    appContext: context,
                    cursorColor: Colors.transparent,
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      inactiveColor: AppColors.textFaded.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      activeColor: AppColors.textFaded.withOpacity(0.5),
                      selectedColor: AppColors.secondary,
                      borderWidth: 0.5,
                      fieldHeight: 50,
                      fieldWidth: MediaQuery.of(context).size.width * 0.18,
                      inactiveFillColor: Theme.of(context).cardColor,
                      activeFillColor: Theme.of(context).cardColor,
                      selectedFillColor: AppColors.secondary.withOpacity(0.15),
                    ),
                    length: 4,
                    onChanged: (code) {
                      if (code.trim().length == 4) {
                        pinCompleted.value = true;
                      } else {
                        pinCompleted.value = false;
                      }
                    },
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Resend code in "),
                      Text(
                        "55",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Text(" s"),
                    ],
                  ),
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: pinCompleted,
              builder: (context, completed, child) {
                if (completed) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: defaultPadding),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Text("Verify"),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
