import '../../../../../common/adapters/custom_alerts/dialog_adapter.dart';
import '../../../../../common/stores/home_store.dart';
import '../../../../../common/stores/user_store.dart';
import '../../../domain/usecases/deposit_usecases.dart';
import '../../../domain/usecases/transfer_usecases.dart';
import '../../../domain/usecases/withdraw_usecases.dart';
import 'widgets/deposit_dialog_widget.dart';
import 'widgets/transfer_dialog_widget.dart';
import 'widgets/withdraw_dialog_widget.dart';

class HomeController {
  final UserStore userStore;
  final HomeStore homeStore;
  final IDialogAdapter dialog;
  final WithdrawUsecase withdraw;
  final TransferUsecase transfer;
  final DepositUsecase deposit;

  HomeController({
    required this.userStore,
    required this.homeStore,
    required this.dialog,
    required this.withdraw,
    required this.transfer,
    required this.deposit,
  });

  _onTransfer(String value, String accountDestiny) async {
    final withdrawValue = double.tryParse(value) ?? 0;
    await transfer(
      account: userStore.value?.accountNumber ?? '',
      accountDestiny: accountDestiny,
      value: withdrawValue,
    );
    userStore.removeBalance(withdrawValue);
  }

  _onWithdraw(String value) async {
    final withdrawValue = double.tryParse(value) ?? 0;

    userStore.removeBalance(withdrawValue);
    await withdraw(
      id: userStore.value?.id ?? '',
      value: userStore.value?.balance ?? 0,
    );
  }

  _onDeposit(String value) async {
    final depositValue = double.tryParse(value) ?? 0;
    userStore.addBalance(depositValue);
    await deposit(
      id: userStore.value?.id ?? '',
      value: userStore.value?.balance ?? 0,
    );
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

  getMoment() {
    DateTime now = DateTime.now();
    int horaAtual = now.hour;

    if (horaAtual >= 01 && horaAtual < 13) {
      homeStore.setMoment('Bom dia');
    } else if (horaAtual >= 13 && horaAtual < 18) {
      homeStore.setMoment('Boa tarde');
    } else {
      homeStore.setMoment('Boa noite');
    }
  }
}
