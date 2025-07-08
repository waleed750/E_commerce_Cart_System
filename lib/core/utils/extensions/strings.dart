
extension StringExtension on String? {
  String capitalizeFirstLetter() {
    try {
      if (this == null) return '';
      if (this!.length > 1) {
        return "${this![0].toUpperCase()}${this!.substring(1)}";
      }
      return this!.toUpperCase();
    } catch (e) {
      return this ?? '';
    }
  }
  String capitalizeAllFirstLetter() {
    try {
      if (this == null) return '';
      return this!.split(' ').map((word) => word.capitalizeFirstLetter()).join(' ');
    } catch (e) {
      return this ?? '';
    }
  }

  bool get isNullOrEmpty {
    return (null == this ||
        this == "null" ||
        this!.isEmpty ||
        this!.trim().isEmpty
    );
  }

  bool equalIgnoreCase(String secondString) {
    return (this?.trim().toLowerCase() == secondString.trim().toLowerCase());
  }

  String getFirstWord() {
    String tmp = this ?? '';
    return tmp.split(' ').first;
  }

  String removeFirstWord() {
    String tmp = this ?? '';
    String firstWord = getFirstWord();
    return tmp.substring(firstWord.length);
  }

  bool isContainsUpperChar() {
    if (isNullOrEmpty) return false;
    String pattern = r'(?=.*[A-Z])';
    RegExp regExp = RegExp(pattern);
    return (this ?? '').contains(regExp, 0);
  }

  bool isContainsLowerChar() {
    if (isNullOrEmpty) return false;
    String pattern = r'(?=.*[a-z])';
    RegExp regExp = RegExp(pattern);
    return (this ?? '').contains(regExp, 0);
  }

  bool isContainsSpecialChar() {
    if (isNullOrEmpty) return false;
    String pattern = r'(?=.*?[!@#\$&*~])';
    RegExp regExp = RegExp(pattern);
    return (this ?? '').contains(regExp, 0);
  }

  bool isMatchLength(int minLength, int maxLength) {
    if (this == null) return false;
    String value = this!;
    if (value.length >= minLength && value.length <= maxLength) {
      return true;
    }
    return false;
  }

  bool isContainsDigit() {
    if (isNullOrEmpty) return false;
    String value = this ?? '';
    String pattern = (r'[\d]');
    RegExp regExp = RegExp(pattern);
    return (value).contains(regExp, 0);
  }
}
