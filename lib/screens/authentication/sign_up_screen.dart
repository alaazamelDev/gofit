import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/screens/authentication/components/labeled_action_button.dart';
import 'package:gofit/screens/authentication/components/labeled_divider.dart';
import 'package:gofit/screens/authentication/components/page_title.dart';
import 'package:gofit/screens/authentication/components/squared_social_button.dart';
import 'package:gofit/screens/authentication/sign_in_screen.dart';
import 'package:gofit/screens/main_screen/main_screen.dart';
import 'package:gofit/widgets/input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: ((context) => SignUpScreen()),
      );

  final ValueNotifier<bool> rememberMe = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const PageTitle(
                  title: "Create your\nAccount",
                ),
                InputField(
                  prefixWidget: const Icon(
                    Icons.email_rounded,
                    color: AppColors.textFaded,
                  ),
                  hint: "Email",
                  controller: TextEditingController(),
                ),
                const SizedBox(height: defaultPadding * 1.5),
                InputField(
                  prefixWidget: const Icon(
                    Icons.lock_rounded,
                    color: AppColors.textFaded,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    splashRadius: 20,
                    splashColor: AppColors.textFaded,
                    icon: const Icon(
                      Icons.visibility_off_rounded,
                      color: AppColors.textFaded,
                    ),
                  ),
                  hint: "Password",
                  controller: TextEditingController(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
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
                      Text(
                        "Remember me",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MainScreen.route(),
                      (route) => false,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textLight,
                          ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                const LabeledDivider(label: "or continue with"),
                const SizedBox(height: defaultPadding * 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquaredSocialButton(
                      iconAsset: kFacebookSvg,
                      onPressed: () {},
                    ),
                    SquaredSocialButton(
                      iconAsset: kGoogleSvg,
                      onPressed: () {},
                    ),
                    SquaredSocialButton(
                      iconAsset: kAppleSvg,
                      onPressed: () {},
                    ),
                  ],
                ),
                const Spacer(),
                LabeledActionButton(
                  queryText: "Already have an account?",
                  actionText: "Sign in",
                  onAction: () {
                    Navigator.pushReplacement(context, SignInScreen.route());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
