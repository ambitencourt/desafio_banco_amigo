import 'package:asuka/asuka.dart';
import 'package:banco_amigo/app/common/app_images.dart';
import 'package:banco_amigo/app/common/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../common/app_colors.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../widgets/chat_widget.dart';
import 'register_controller.dart';

enum StepsEnum {
  initial,
  name,
  email,
  password,
  document,
  bitrthday,
  finish,
  passwordConfirm,
  done;
}

class RegisterPage extends StatefulWidget {
  final RegisterController controller;
  const RegisterPage({super.key, required this.controller});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController messageController = TextEditingController();
  bool unhide = false;
  String email = '';
  String name = '';
  String password = '';
  String document = '';
  String birthday = '';
  String passwordConfirm = '';

  StepsEnum step = StepsEnum.initial;
  pass1() {
    return const Align(
      alignment: Alignment.centerRight,
      child: ChatWidget(
        data:
            'Siga o passo a passo para criar sua conta gratuita no Banco Amigo!',
      ),
    );
  }

  pass2() {
    return const Align(
      alignment: Alignment.centerRight,
      child: ChatWidget(data: 'Por favor informe seu nome completo.'),
    );
  }

  pass3() {
    return const Align(
      alignment: Alignment.centerRight,
      child: ChatWidget(data: 'Agora, me informe seu email'),
    );
  }

  pass4() {
    return const Align(
      alignment: Alignment.centerRight,
      child: ChatWidget(data: 'Qual o seu CPF(somente números)'),
    );
  }

  pass5() {
    return const Align(
      alignment: Alignment.centerRight,
      child: ChatWidget(data: 'Qual a sua data de nascimento(somente números)'),
    );
  }

  pass6() {
    return const Align(
      alignment: Alignment.centerRight,
      child: ChatWidget(data: 'Agora crie uma senha de 6 dígitos no mínimo'),
    );
  }

  pass7() {
    return const Align(
      alignment: Alignment.centerRight,
      child: ChatWidget(data: 'Digite a senha novamente'),
    );
  }

  pass8() {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const ChatWidget(
              data:
                  'Verifique se seus dados estão corretos e toque no botão enviar dados'),
          Card(
            color: Colors.green[900],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextWidget(
                    data:
                        'Nome: $name \nEmail: $email\nCPF: $document\nNascimento: $birthday',
                    align: TextAlign.left,
                    color: AppColors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
                      IconButton(
                        iconSize: 48,
                        onPressed: () => Modular.to.pop(),
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.white,
                        ),
                      ),
                      Image.asset(
                        AppImages.login,
                        //width: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: mediaQuery.width * .98,
                height: mediaQuery.height * .7,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  children: [
                    Visibility(
                      visible: step == StepsEnum.initial,
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: ChatWidget(
                          data:
                              'Siga o passo a passo para criar a sua conta gratuita no Banco Amigo',
                        ),
                      ),
                    ),
                    Visibility(
                      visible: step == StepsEnum.initial,
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: ChatWidget(
                          data: 'Toque no botão criar conta',
                        ),
                      ),
                    ),
                    Visibility(
                      visible: step == StepsEnum.initial,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 130,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  step = StepsEnum.name;
                                  unhide = true;
                                });
                              },
                              child: const TextWidget(
                                  data: 'Criar conta',
                                  align: TextAlign.center,
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: step == StepsEnum.name,
                      child: pass2(),
                    ),
                    Visibility(
                      visible: step == StepsEnum.email,
                      child: pass3(),
                    ),
                    Visibility(
                      visible: step == StepsEnum.document,
                      child: pass4(),
                    ),
                    Visibility(
                      visible: step == StepsEnum.bitrthday,
                      child: pass5(),
                    ),
                    Visibility(
                      visible: step == StepsEnum.password,
                      child: pass6(),
                    ),
                    Visibility(
                      visible: step == StepsEnum.passwordConfirm,
                      child: pass7(),
                    ),
                    Visibility(
                      visible: step == StepsEnum.finish,
                      child: pass8(),
                    ),
                    Visibility(
                      visible: step == StepsEnum.finish,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 130,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  fillInformation();
                                });
                              },
                              child: const TextWidget(
                                  data: 'Enviar dados',
                                  align: TextAlign.center,
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: unhide,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
                  child: Card(
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      textAlignVertical: TextAlignVertical.center,
                      controller: messageController,
                      onFieldSubmitted: (value) {
                        fillInformation();
                      },
                      decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: () {
                            fillInformation();
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                          child: const Text(
                            'Enviar',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            fillInformation();
                          },
                          child: const Icon(
                            Icons.send,
                            color: AppColors.blue,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(left: 8),
                        hintText: 'Digite aqui:',
                        hintStyle: const TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  fillInformation() async {
    switch (step) {
      case StepsEnum.initial:
        setState(() {
          step = StepsEnum.name;
        });
        break;
      case StepsEnum.done:
        break;
      case StepsEnum.name:
        setState(() {
          name = messageController.text;
          step = StepsEnum.email;
        });
        break;
      case StepsEnum.email:
        setState(() {
          email = messageController.text;
          step = StepsEnum.document;
        });
        break;
      case StepsEnum.document:
        setState(() {
          document = messageController.text;
          step = StepsEnum.bitrthday;
        });
        break;
      case StepsEnum.bitrthday:
        setState(() {
          birthday = messageController.text;
          step = StepsEnum.password;
        });
        break;
      case StepsEnum.password:
        setState(() {
          if (messageController.text.length < 6) {
            Asuka.showSnackBar(
              const SnackBar(
                content: Text("A senha deve ter no mínimo 6 caracteres!"),
              ),
            );
          } else {
            password = messageController.text;
            step = StepsEnum.passwordConfirm;
          }
        });
        break;
      case StepsEnum.passwordConfirm:
        setState(() {
          if (messageController.text != password) {
            Asuka.showSnackBar(
              const SnackBar(
                content: Text("Senha não confere, tente novamente!"),
              ),
            );
          } else {
            passwordConfirm = messageController.text;
            step = StepsEnum.finish;
          }
        });
        break;
      case StepsEnum.finish:
        await widget.controller.signUp(
          UserEntity(
            document: document,
            email: email,
            name: name,
            password: password,
          ),
        );
        setState(() {
          Asuka.showSnackBar(
            const SnackBar(
              content: Text("Cadastro realizado com sucesso"),
            ),
          );
          Modular.to.pushReplacementNamed('/bank/home');
          step = StepsEnum.done;
        });
        break;
    }
    messageController.clear();
  }
}
