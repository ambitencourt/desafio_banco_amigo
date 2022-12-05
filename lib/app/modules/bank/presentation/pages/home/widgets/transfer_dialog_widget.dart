import 'package:flutter/material.dart';

import '../../../../../../common/app_colors.dart';

class TransferDialogWidget extends StatelessWidget {
  final Function(String, String) onFinish;
  final txtController = TextEditingController();
  final txtAccount = TextEditingController();

  TransferDialogWidget({
    super.key,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Realizando Tranferência'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Valor da Tranferência'),
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
          const SizedBox(
            height: 10,
          ),
          const Text('Conta Destino'),
          TextField(
            controller: txtAccount,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Conta Destino',
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
                onFinish(txtController.text, txtAccount.text);
                Navigator.of(context).pop();
              },
              child: const Text('TRANSFERIR'),
            ),
          ],
        ),
      ],
    );
  }
}
