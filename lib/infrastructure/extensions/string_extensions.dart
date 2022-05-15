extension StringValidation on String {

  bool isBlank() {
    return this.trim().length == 0;
  }

  bool isSpecialCharacter() {
    // const regex = /[!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]/g;
    return RegExp(r'[^\w\s]+').hasMatch(this);
  }

}