extension StringValidation on String {

  bool isBlank() {
    return trim().isEmpty;
  }

  bool isSpecialCharacter() {
    return RegExp(r'[^\w\s]+').hasMatch(this);
  }

}