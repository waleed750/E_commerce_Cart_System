import '../../core_export.dart';
import 'toast_type.dart';

class ToastificationWidget {
  static show({
    BuildContext? context,
    String? title,
    required String message,
    required ToastType toastType,
  }) {
    toastification.show(
        title: Text(title ?? ''),
        description: Text(message),
        autoCloseDuration: const Duration(seconds: 5),
        type: _contentType(toastType: toastType),
        style: ToastificationStyle.fillColored
        // backgroundColor: toastColors[toastType],
        );
  }

  static ToastificationType _contentType({required ToastType toastType}) {
    return switch (toastType) {
      ToastType.SUCCESS => ToastificationType.success,
      ToastType.ERROR => ToastificationType.error,
      ToastType.INFO => ToastificationType.info,
      ToastType.WARNING => ToastificationType.warning,
    };
  }

  //? I will create a color for the toast
  static final Map<ToastType, Color> toastColors = {
    ToastType.SUCCESS: Colors.green,
    ToastType.ERROR: Colors.red,
    ToastType.INFO: Colors.blue,
    ToastType.WARNING: Colors.yellow,
  };
}
