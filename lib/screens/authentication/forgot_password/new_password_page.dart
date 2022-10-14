import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/widgets/input_field.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: ((context) => NewPasswordPage()),
      );

  final ValueNotifier<bool> rememberMe = ValueNotifier(false);

  Future<bool> _showCongratsDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: Theme.of(context).cardColor,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: SvgPicture.asset(kCompleted),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  Text(
                    "Congratulations!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: defaultPadding * 0.5),
                  Text(
                    "Your account is ready to use",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Text("Go to Homepage"),
                    ),
                  ),
                ],
              ),
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create New Password",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultPadding * 2),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: SvgPicture.asset(kNewPassword),
                  ),
                ),
                const Text("Create Your New Password"),
                const SizedBox(height: defaultPadding * 2),
                InputField(
                  hint: "New Password",
                  controller: TextEditingController(),
                  prefixWidget: const Icon(
                    Icons.lock_rounded,
                    size: 20,
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility_off_rounded,
                    size: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 1.25,
                    horizontal: defaultPadding * 1.5,
                  ),
                ),
                const SizedBox(height: defaultPadding),
                InputField(
                  hint: "Confirm New Password",
                  controller: TextEditingController(),
                  prefixWidget: const Icon(
                    Icons.lock_rounded,
                    size: 20,
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility_off_rounded,
                    size: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 1.25,
                    horizontal: defaultPadding * 1.5,
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 0.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: rememberMe,
                        builder: (context, remember, _) {
                          return Checkbox(
                            value: remember,
                            activeColor: AppColors.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            side: const BorderSide(
                              color: AppColors.secondary,
                              width: 2,
                            ),
                            onChanged: (val) {
                              rememberMe.value = val!;
                            },
                          );
                        },
                      ),
                      // const SizedBox(width: defaultPadding * 0.5),
                      const Text("Remember me"),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    // todo: show congrats dialog

                    if (await _showCongratsDialog(context)) {
                      //Navigator.push(context, HomeScreen.route());

                      print("Poped");
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text("Continue"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
