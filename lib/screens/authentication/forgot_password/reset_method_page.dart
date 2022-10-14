import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/domain/enums.dart';
import 'package:gofit/screens/authentication/forgot_password/pin_code_page.dart';

class ResetMethodPage extends StatelessWidget {
  ResetMethodPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: ((context) => ResetMethodPage()),
      );

  final ValueNotifier<ResetType> resetType = ValueNotifier(ResetType.sms);

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(
                kResetPassword,
              ),
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                "Select which contact details should we use to reset your password",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: defaultPadding),
            Flexible(
              child: ValueListenableBuilder<ResetType>(
                valueListenable: resetType,
                builder: (context, type, _) {
                  return _ResetOption(
                    isSelected: type == ResetType.sms,
                    icon: Icons.chat_rounded,
                    title: "via SMS",
                    subtitle: "+1 (267) 8000 887",
                    onPressed: () {
                      resetType.value = ResetType.sms;
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: defaultPadding),
            Flexible(
              child: ValueListenableBuilder<ResetType>(
                valueListenable: resetType,
                builder: (context, type, _) {
                  return _ResetOption(
                    isSelected: type == ResetType.email,
                    icon: Icons.email_rounded,
                    title: "via Email",
                    subtitle: "example@mail.com",
                    onPressed: () {
                      resetType.value = ResetType.email;
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: defaultPadding),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, PinCodePage.route());
              },
              child: const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResetOption extends StatelessWidget {
  const _ResetOption({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);
  final bool isSelected;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: isSelected ? AppColors.secondary : Colors.transparent,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondary.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: AppColors.secondary,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: defaultPadding),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey.shade400),
                  ),
                  const SizedBox(height: defaultPadding * 0.5),
                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
