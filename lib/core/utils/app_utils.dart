import 'package:dartz/dartz.dart';

import '../core_export.dart';

class AppUtils {
  static ({Failure? failure, Object? data}) mapFailuerOrDone({
    required Either<Failure, Object> either,
  }) {
    Failure? f;
    Object? d;
    either.fold((failure) => f = failure, (data) => d = data);
    return (failure: f, data: d);
  }

  static Object? getArguments(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments;
  }

  // static String? formatDateToString(String? date, {int? addDays}) {
  //   if (date.isNullOrEmpty) return null;
  //   if (addDays != null) {
  //     return DateFormat('yyyy-MM-dd')
  //         .parse(date!)
  //         .add(Duration(days: addDays))
  //         .toString()
  //         .split(' ')
  //         .first;
  //   }
  //   return DateFormat('yyyy-MM-dd').parse(date!).toString().split(' ').first;
  // }

  // static String? formatDateWithTimeToString(String? date) {
  //   if (date.isNullOrEmpty) return null;
  //   final dateTime = DateTime.parse(date!);
  //   return DateFormat('dd MMM yyyy').format(dateTime);
  // }

  static DateTime? formatStringToDateTime(String? date) {
    if (date.isNullOrEmpty) return null;
    final dateTime = DateTime.parse(date!);
    return dateTime;
  }
}
