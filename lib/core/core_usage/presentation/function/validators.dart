String? textValidator(String val) {
  if (val.isEmpty) {
    return "This is Empty";
  } else {
    return null;
  }
}

String? mobileNumberValidator(
  String? val,
) {
  if (val!.isEmpty) {
    return "Please input a number";
  } else if (val.isNotEmpty) {
    if (val.length < 10 || val.length > 14) {
      return "The number is not correct";
    } else {
      return null;
    }
  } else {
    return null;
  }
}

String? contactTimesValidator(
  String? val,
) {
  var number = int.parse(val!);
  if (number < 0) {
    return "not an actual number";
  } else {
    return null;
  }
}
