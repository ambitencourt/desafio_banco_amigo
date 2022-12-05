import 'package:banco_amigo/app/common/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_text.dart';
import '../../../../domain/entities/user_entity.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;

  const LoginPage({
    super.key,
    required this.controller,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery.height * .05,
              ),
              SizedBox(
                height: mediaQuery.height * .11,
                width: mediaQuery.width * .99,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Image.asset(
                        AppImages.login,
                        //width: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * .15,
              ),
              Center(
                child: Column(
                  children: [
                    const TextWidgetNerko(
                      data: 'Acesse sua conta',
                      align: TextAlign.center,
                      color: AppColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: mediaQuery.height * .015,
                    ),
                    SizedBox(
                      width: mediaQuery.width * .975,
                      height: mediaQuery.height * .43,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: mediaQuery.height * .12,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 12, 8, 0),
                                  child: TextField(
                                    autofocus: false,
                                    controller: emailController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      hintText: 'EMAIL:',
                                      hintStyle: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: mediaQuery.height * .08,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: TextField(
                                    autofocus: false,
                                    controller: passwordController,
                                    obscureText: true,
                                    keyboardType: TextInputType.text,
                                    onSubmitted: (v) {
                                      widget.controller.login(UserEntity(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ));
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'SENHA:',
                                      hintStyle: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: mediaQuery.height * .01,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  widget.controller.login(UserEntity(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ));
                                  //TODO Criar tratamento de erros e redirecionamento
                                  Modular.to.pushReplacementNamed('/bank/home');
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(200, 45),
                                  backgroundColor: Colors.blue[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const TextWidget(
                                  data: 'Entrar',
                                  align: TextAlign.center,
                                  color: AppColors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: mediaQuery.height * .03,
                              ),
                              const TextWidget(
                                data: 'Ainda não tem uma conta?',
                                align: TextAlign.center,
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              InkWell(
                                onTap: (() {
                                  Modular.to.pushNamed('register');
                                }),
                                child: const TextWidget(
                                  data: 'Criar conta grátis',
                                  align: TextAlign.left,
                                  color: AppColors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
