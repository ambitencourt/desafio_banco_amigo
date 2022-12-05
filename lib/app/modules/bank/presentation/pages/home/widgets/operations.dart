import 'package:flutter/material.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_text.dart';

class Operations extends StatelessWidget {
  final Color? color;
  final IconData? iconData;
  final String text;
  final Function()? onTap;
  const Operations({
    Key? key,
    required this.color,
    required this.iconData,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                size: 36,
                color: color,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextWidget(
              data: text,
              align: TextAlign.center,
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
      ),
    );
  }
}
