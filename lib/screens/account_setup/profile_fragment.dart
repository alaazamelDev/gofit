import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/screens/authentication/let_in_screen.dart';
import 'package:gofit/widgets/input_field.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: ((context) => const ProfileFragment()),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: defaultPadding,
              horizontal: defaultPadding * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Fill Your Profile',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
                      ),
                      const SizedBox(height: defaultPadding),
                      Text(
                        'Don\'t worry, you can always change it later, or you can skip it for now.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage(kProfileImage),
                            ),
                            Positioned(
                              right: 8,
                              bottom: 8,
                              child: GestureDetector(
                                onTap: () {
                                  // todo: on edit button clicked
                                },
                                child: const SquaredButton(
                                  icon: Icons.edit,
                                ),
                              ),
                            )
                          ],
                        ),
                        InputField(
                          hint: "Full Name",
                          controller: TextEditingController(),
                        ),
                        InputField(
                          hint: "Nickname",
                          controller: TextEditingController(),
                        ),
                        InputField(
                          hint: "Email",
                          controller: TextEditingController(),
                        ),
                        InputField(
                          hint: "Phone Number",
                          controller: TextEditingController(),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // todo: on skip button pressed
                            Navigator.pushAndRemoveUntil(
                              context,
                              LetInScreen.route(),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.textFaded),
                          child: const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: defaultPadding),
                            child: Text(
                              'Skip',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // todo: on continue button pressed
                            Navigator.pushAndRemoveUntil(
                              context,
                              LetInScreen.route(),
                              (route) => false,
                            );
                          },
                          child: const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: defaultPadding),
                            child: Text(
                              'Start',
                            ),
                          ),
                        ),
                      )
                    ],
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

class SquaredButton extends StatelessWidget {
  const SquaredButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding * 0.25),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
