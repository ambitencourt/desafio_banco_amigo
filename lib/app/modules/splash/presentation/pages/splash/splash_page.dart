import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) => Modular.to.pushReplacementNamed('/login/loginpage'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: mediaQuery.height * .25,
            ),
            Center(
              child: SizedBox(
                width: mediaQuery.width * .7,
                child: Image.asset(AppImages.splash),
              ),
            ),
            const TextWidgetNerko(
              data: 'Banco Amigo',
              align: TextAlign.center,
              color: AppColors.white,
              fontSize: 48,
              fontWeight: FontWeight.normal,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, mediaQuery.width * .15, 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
