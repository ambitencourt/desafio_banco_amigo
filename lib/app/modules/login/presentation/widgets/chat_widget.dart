import 'package:flutter/material.dart';

import 'package:banco_amigo/app/common/app_text.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_images.dart';

class ChatWidget extends StatelessWidget {
  final String data;
  const ChatWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          width: 55,
          height: 55,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.background,
            backgroundImage: AssetImage(
              AppImages.splash,
            ),
          ),
        ),
        SizedBox(
          width: mediaQuery.width * .65,
          height: mediaQuery.height * .13,
          child: Card(
            color: Colors.orange[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextWidget(
                  data: data,
                  align: TextAlign.center,
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
