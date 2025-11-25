import 'package:newGetxCLI/utils/strings.dart';

String? requiredValidation(val) {
  if (val == null || val.isEmpty) {
    return Strings.errorMsgRequired;
  }
  return null;
}

String? loginMobileNumberValidator(val) {
  if (val == "") {
    return Strings.errorMsgRequired;
  } else if (val!.length != 10) {
    return Strings.errorMsgLength10;
  }
  return null;
}

String? otpValidation(val) {
  if (val == "") {
    return Strings.errorMsgRequired;
  } else if (val!.length != 4) {
    return Strings.errorMsgLength4;
  }
  return null;
}
