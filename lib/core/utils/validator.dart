class Validator {
  static String? nameValidator(value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك ادخل الاسم';
    }
    return null;
  }

  static String? emailValidator(value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك ادخل البريد الإلكتروني';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
      return 'صيغة البريد الإلكتروني غير صحيحة';
    }
    return null;
  }

  static String? phoneValidator(value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك ادخل رقم الهاتف';
    }

    if (value.length != 11) {
      return 'رقم الهاتف يجب أن يحتوي على 11 رقمًا';
    }

    final phoneRegex = RegExp(r'^(01)[0-9]{9}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'من فضلك أدخل رقم هاتف مصري صحيح';
    }

    return null;
  }

  static String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك ادخل كلمة المرور';
    } else if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أدخل تأكيد كلمة المرور';
    }
    if (value != password) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }
}
