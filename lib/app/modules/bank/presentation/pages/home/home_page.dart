import 'package:banco_amigo/app/common/app_images.dart';
import 'package:banco_amigo/app/modules/bank/presentation/pages/home/home_controller.dart';
import 'package:banco_amigo/app/modules/bank/presentation/pages/home/widgets/operations.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_text.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hidevalue = false;
  getMoment() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk').format(now);
    print(formattedDate);
    if (int.parse(formattedDate) >= 01 && int.parse(formattedDate) < 13) {
      return 'Bom dia';
    } else if (int.parse(formattedDate) >= 13 &&
        int.parse(formattedDate) < 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }

  @override
  void initState() {
    getMoment();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: AppColors.secondary,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {}),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: IconButton(
                icon: const Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.white,
        child: Image.asset(AppImages.pix),
      ),
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery.height * .05,
              ),
              Center(
                child: SizedBox(
                  width: mediaQuery.width * .98,
                  height: mediaQuery.height * .3,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                        data: getMoment(),
                                        align: TextAlign.left,
                                        color: AppColors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: TextWidget(
                                        data: widget.controller.userStore.value
                                                ?.name
                                                .toString() ??
                                            'Usuário',
                                        align: TextAlign.left,
                                        color: AppColors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    mediaQuery.width * .34, 15, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: AppColors.background,
                                          backgroundImage: AssetImage(
                                            AppImages.splash,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuery.height * .015,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.build_circle_rounded,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: mediaQuery.width * .015,
                                    ),
                                    const TextWidget(
                                      data: 'Conta Corrente',
                                      align: TextAlign.left,
                                      color: AppColors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: ValueListenableBuilder(
                                          valueListenable:
                                              widget.controller.userStore,
                                          builder: (context, value, _) {
                                            return Visibility(
                                              visible: hidevalue,
                                              replacement: Container(
                                                height: 50,
                                                width: 150,
                                                color: Colors.grey[400],
                                              ),
                                              child: TextWidget(
                                                data: value?.formattedBalance ??
                                                    'R\$ 1000,00',
                                                align: TextAlign.left,
                                                color: AppColors.blue,
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          }),
                                    ),
                                    IconButton(
                                      onPressed: () => setState(() {
                                        hidevalue = !hidevalue;
                                      }),
                                      icon: Icon(
                                        hidevalue == true
                                            ? Iconsax.eye4
                                            : Iconsax.eye_slash5,
                                        size: 30,
                                      ),
                                      splashRadius: 25,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * .015,
              ),
              SizedBox(
                height: mediaQuery.height * .15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Operations(
                      color: Colors.green[700],
                      iconData: Iconsax.money_recive,
                      text: 'Sacar',
                      onTap: widget.controller.openWithdraw,
                    ),
                    Operations(
                      color: Colors.red[700],
                      iconData: Iconsax.money_send,
                      text: 'Depositar',
                      onTap: widget.controller.openDeposit,
                    ),
                    Operations(
                      color: Colors.blue[700],
                      iconData: Iconsax.arrow_swap_horizontal,
                      text: 'Transferência',
                      onTap: widget.controller.openTransfer,
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
