import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xff0c8fad);
  static const Color secondary = Color(0xff7bc1b7);
  static const Color accent = Color(0xff0066CC);
  static const Color bright = Color(0xff2ec7ff);

  static const Color success = Color(0xff4CAF50);
  static const Color error = Color(0xffFF3B30);

  static const Color scaffold = Color(0xffF2F6FC);

  static const Color darkText = Color(0xff1C1C1C);

  static const Color lightText = Color(0xffFFFFFF);

  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'مؤكد':
        return Colors.green;
      case 'قيد الانتظار':
        return const Color.fromARGB(255, 204, 167, 33);
      case 'ملغي':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

abstract class Constants {
  static const mainLogo = 'assets/logos/main-logo.png';
  static const lottieSplash = 'assets/lottie/splash_animation.json';
  static const List<String> egyptGovernorates = [
    'القاهرة',
    'الجيزة',
    'الإسكندرية',
    'القليوبية',
    'المنوفية',
    'الغربية',
    'الدقهلية',
    'الشرقية',
    'البحيرة',
    'كفر الشيخ',
    'دمياط',
    'بورسعيد',
    'الإسماعيلية',
    'السويس',
    'شمال سيناء',
    'جنوب سيناء',
    'بني سويف',
    'الفيوم',
    'المنيا',
    'أسيوط',
    'سوهاج',
    'قنا',
    'الأقصر',
    'أسوان',
    'البحر الأحمر',
    'الوادي الجديد',
    'مطروح',
  ];
  static const List<String> doctorSpecializations = [
    'باطنة',
    'قلب',
    'جراحة عامة',
    'عظام',
    'نساء وتوليد',
    'أطفال',
    'جلدية',
    'أنف وأذن وحنجرة',
    'رمد (عيون)',
    'أسنان',
  ];
  static const privacyPolicyViewText =
      'نحن في دكتوري نلتزم بحماية خصوصيتك ونعلم أن المعلومات الشخصية التي تشاركها معنا هي حساسة. نجمع معلوماتك الشخصية، مثل الاسم والبريد الإلكتروني، فقط لتوفير خدمة أفضل، وتحسين تجربتك، والتواصل معك بشأن طلباتك. نحن نستخدم تقنيات أمان متقدمة لحماية بياناتك من الوصول غير المصرح به، ونؤكد لك أن معلوماتك لن تُشارك مع أي طرف ثالث دون إذنك. لديك الحق في الوصول إلى معلوماتك وتحديثها أو طلب حذفها في أي وقت. من خلال استخدامك للتطبيق، فإنك توافق على سياسة الخصوصية هذه، والتي يمكن أن نقوم بتحديثها من وقت لآخر، وسنقوم بإخطارك بأي تغييرات عبر التطبيق.';
}
