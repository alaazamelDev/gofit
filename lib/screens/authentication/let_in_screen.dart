import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/screens/authentication/components/labeled_action_button.dart';
import 'package:gofit/screens/authentication/components/labeled_divider.dart';
import 'package:gofit/screens/authentication/components/page_title.dart';
import 'package:gofit/screens/authentication/components/social_media_button.dart';
import 'package:gofit/screens/authentication/sign_in_screen.dart';
import 'package:gofit/screens/authentication/sign_up_screen.dart';

class LetInScreen extends StatelessWidget {
  const LetInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PageTitle(
              title: "Let's You in",
              align: Alignment.center,
            ),
            SocialMeidaLoginButton(
              onPressed: () {},
              label: "Continue with Facebook",
              iconAsset: kFacebookSvg,
            ),
            const SizedBox(height: defaultPadding),
            SocialMeidaLoginButton(
              onPressed: () {},
              label: "Continue with Google",
              iconAsset: kGoogleSvg,
            ),
            const SizedBox(height: defaultPadding),
            SocialMeidaLoginButton(
              onPressed: () {},
              label: "Continue with Apple",
              iconAsset: kAppleSvg,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            const LabeledDivider(label: "OR"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, SignInScreen.route());
              },
              child: const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Text("Sign in with password"),
              ),
            ),
            const Spacer(),
            LabeledActionButton(
              queryText: "Don't have an account?",
              actionText: "Sign Up",
              onAction: () {
                Navigator.push(context, SignUpScreen.route());
              },
            )
          ],
        ),
      ),
    );
  }
}
