import '../../../../../common/adapters/custom_alerts/dialog_adapter.dart';

import '../../../../../common/stores/user_store.dart';
import '../../../domain/usecases/deposit_usecases.dart';
import '../../../domain/usecases/transfer_usecases.dart';
import '../../../domain/usecases/withdraw_usecases.dart';
import 'widgets/deposit_dialog_widget.dart';
import 'widgets/transfer_dialog_widget.dart';
import 'widgets/withdraw_dialog_widget.dart';

class HomeController {
  final UserStore userStore;

  final IDialogAdapter dialog;
  final WithdrawUsecase withdraw;
  final TransferUsecase transfer;
  final DepositUsecase deposit;

  HomeController({
    required this.userStore,
    required this.dialog,
    required this.withdraw,
    required this.transfer,
    required this.deposit,
  });

  _onTransfer(String value, String accountDestiny) async {
    final withdrawValue = double.tryParse(value) ?? 0;
    await transfer(
      account: userStore.value!.accountNumber,
      accountDestiny: accountDestiny,
      value: withdrawValue,
    );

    userStore.removeBalance(withdrawValue);
  }

  _onWithdraw(String value) async {
    final withdrawValue = double.tryParse(value) ?? 0;

    await withdraw(
      account: userStore.value!.accountNumber,
      value: withdrawValue,
    );

    userStore.removeBalance(withdrawValue);
  }

  _onDeposit(String value) async {
    final depositValue = double.tryParse(value) ?? 0;
    await deposit(
      account: userStore.value!.accountNumber,
      value: depositValue,
    );
    userStore.addBalance(depositValue);
  }

  openWithdraw() {
    dialog.showDialog(WithdrawDialogWidget(
      onFinish: _onWithdraw,
    ));
  }

  openDeposit() {
    dialog.showDialog(DepositDialogWidget(
      onFinish: _onDeposit,
    ));
  }

  openTransfer() {
    dialog.showDialog(TransferDialogWidget(
      onFinish: _onTransfer,
    ));
  }
}
