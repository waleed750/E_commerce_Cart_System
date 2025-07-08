import '../../core_export.dart';
import '../widgets_eport.dart';
import 'toast_type.dart';

class ShowToastMessage {
  static void show({
    BuildContext? context,
    String? title,
    required String message,
    required ToastType toastType,
  }) {
    ToastificationWidget.show(
        context: context, message: message, title: title, toastType: toastType);
  }
}
