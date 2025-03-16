import 'constats.dart';
import 'enums.dart';

class Validator {
  static String? validate(String? text, ValidationState state) {
    if (text == null || text.trim().isEmpty) {
      return _requiredFieldMessage(state);
    }

    switch (state) {
      case ValidationState.email:
        return _validateEmail(text);
      case ValidationState.phoneNumber:
        return _validatePhoneNumber(text);
      case ValidationState.password:
        return _validatePassword(text);
      case ValidationState.price:
        return _validatePrice(text);
      case ValidationState.normal:
      default:
        return null;
    }
  }

  static String? _validateEmail(String text) {
    const emailPattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    final emailRegex = RegExp(emailPattern);

    if (!emailRegex.hasMatch(text)) {
      return lang == 'en'
          ? "Invalid email format"
          : "تنسيق البريد الإلكتروني غير صالح";
    }
    return null;
  }

  static String? _validatePhoneNumber(String text) {
    const phonePattern = r'^(\+|\d{1,2})?\s?\(?\d{3}\)?[-\s]\d{3}-\d{4}$';
    final phoneRegex = RegExp(phonePattern);

    if (!phoneRegex.hasMatch(text)) {
      return lang == 'en'
          ? "Invalid phone number format"
          : "تنسيق رقم الهاتف غير صالح";
    }
    return null;
  }

  static String? _validatePassword(String text) {
    if (text.length < 8) {
      return lang == 'en'
          ? "Password must be at least 8 characters long"
          : "يجب أن تتكون كلمة المرور من 8 أحرف على الأقل";
    }
    return null;
  }

  static String? _validatePrice(String text) {
    final price = double.tryParse(text);

    if (price == null) {
      return lang == 'en'
          ? "Please enter a valid number"
          : "الرجاء إدخال رقم صحيح";
    } else if (price <= 0) {
      return lang == 'en'
          ? "Price must be greater than zero"
          : "الرقم يجب أن يكون أكبر من الصفر";
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? confirmPassword, String? originalPassword) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return lang == 'en'
          ? "Please confirm your password"
          : "يرجى تأكيد كلمة المرور";
    }
    if (confirmPassword != originalPassword) {
      return lang == 'en'
          ? "Passwords do not match"
          : "كلمات المرور غير متطابقة";
    }
    return null;
  }

  static String? _requiredFieldMessage(ValidationState state) {
    if (state == ValidationState.price) {
      return lang == 'en' ? "This field is required" : "هذا الحقل مطلوب";
    }
    return lang == 'en' ? "This field is required" : "هذا الحقل مطلوب";
  }
}
