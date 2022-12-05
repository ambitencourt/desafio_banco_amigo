import 'package:flutter/material.dart';

import '../../../../../../common/app_colors.dart';

class WithdrawDialogWidget extends StatelessWidget {
  final Function(String) onFinish;
  final txtController = TextEditingController();

  WithdrawDialogWidget({
    super.key,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Realizando saque'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Valor do saque'),
          TextField(
            controller: txtController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Valor',
              hintStyle: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('CANCELAR'),
            ),
            ElevatedButton(
              onPressed: () {
                onFinish(txtController.text);
                Navigator.of(context).pop();
              },
              child: const Text('SACAR'),
            ),
          ],
        ),
      ],
    );
  }
}
