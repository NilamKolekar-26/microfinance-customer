import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:newGetxCLI/app.dart';
import 'package:newGetxCLI/utils/api/app_envirments.dart';
import 'package:newGetxCLI/utils/common_widget/app_enums.dart';

class AppColors {
  static const Color subtitle = Color(0xFF667085);
  static const Color primaryLight = Color(0xFFA5F0BA);
  static const Color green = Color(0xFF618264);
  static const Color greenButton = Color(0xFF39A657);
  static const Color darkGrey = Color(0xFFE697D95);
  static const Color faintGrey = Color(0xFFF2F4F7);
  static const Color white = Color(0xFFFFFFFF);
  static const Color pinkishGrey = Color(0xFF00E7DA);
  static const Color error = Color(0xFFF04438);
  static const Color status = Color(0xFFF79009);
  static const Color black = Color(0xFF27272B);
  static const Color blackFaint = Color(0xFF666666);
  static const Color grey = Color(0xFFEAECF0);
  static const Color greyLight = Color(0xFFF5F5F5);
  static const Color warning = Colors.yellow;
  static const Color linearGradientPrimary = Color(0xFF66BB6A);
  static const Color linearGradientSecondary = Color(0xFF1B5F20);

  static const Color headerBackground = Color(0xFFE1F2CB);
  static const Color headerText = Color(0xFF1E2A44);
  static const Color headerSubText = Color(0xFF4A90E2);
  static const Color textFieldBorder = Color(0xFFD0D5DD);
  static const Color textFieldLabel = Color(0xFF667085);
  static const Color darkBlack = Color(0xFF101828);
  static const Color gray200 = Color(0xFFEAECF0);
  static const Color gray500 = Color(0xFFEAECF0);
  static const Color baseWhite = Color(0xFFFFFFFF);
  static const Color gray800 = Color(0xFF1D2939);
  static const Color dashboardItemType = Color(0xFF344054);
  static const Color dashboardItemPickTime = Color(0xFF1570EF);
  static const Color lightGrey = Color(0xFFECECEC);
  static const Color divider = Color(0xFF707070);
  static const Color iconArrow = Color(0xFF8A94A4);

  static Color get primary {
    switch (App.instance.baseURLType) {
      case AtomURLType.LOCAL:
        return const Color(0xFF165C3B);
      case AtomURLType.DEV:
        return const Color(0xFFDDEEFF);
      case AtomURLType.PROD:
        return const Color(0xFF165C3B);
    }
    return const Color(0xFF165C3B);
  }

  static Color get secondary {
    switch (App.instance.baseURLType) {
      case AtomURLType.LOCAL:
        return const Color(0xFF33596E);
      case AtomURLType.DEV:
        return const Color(0xFFFF0000);
      case AtomURLType.PROD:
        return const Color(0xFF33596E);
    }
    return const Color(0xFF33596E);
  }

  static Color get ternary {
    switch (App.instance.baseURLType) {
      case AtomURLType.LOCAL:
        return const Color(0xFF4E7D96);
      case AtomURLType.DEV:
        return const Color(0xFFFF0000);
      case AtomURLType.PROD:
        return const Color(0xFF4E7D96);
    }
    return const Color(0xFF4E7D96);
  }

  static Color get greetingColor {
    switch (App.instance.baseURLType) {
      case AtomURLType.LOCAL:
        return const Color(0xFFA30024);
      case AtomURLType.DEV:
        return const Color(0xFFFF0000);
      case AtomURLType.PROD:
        return const Color(0xFFA30024);
    }
    return const Color(0xFFA30024);
  }


  static MaterialColor get primarySwatch {
    return const MaterialColor(
      0xFFA30024,
      <int, Color>{
        50: Color(0xFFFFE5E5),
        100: Color(0xFFFFB8B8),
        200: Color(0xFFFF8A8A),
        300: Color(0xFFFF5C5C),
        400: Color(0xFFFF2E2E),
        500: Color(0xFFA30024), 
        600: Color(0xFF8B001D),
        700: Color(0xFF730016),
        800: Color(0xFF5B0010),
        900: Color(0xFF430009),
      },
    );
  }

  static Color get random =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  static Color getMasterUserColorByStatus(String status) {
    switch (status) {
      case UserStatus.ACTIVE:
        return Colors.green;
      case UserStatus.PENDINGAPPROVAL:
        return Colors.redAccent;
      case UserStatus.INPROCESS:
        return Colors.orange;
      case UserStatus.INACTIVE:
        return Colors.red;
      default:
        return primary;
    }
  }

  static Color getColorByIndex(int index) {
    switch (index) {
      case 0:
        return primary;
      case 1:
        return Colors.redAccent;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.greenAccent;
      case 4:
        return Colors.green;
      case 5:
        return Colors.deepPurple;
      case 6:
        return Colors.indigo;
      default:
        return primary;
    }
  }
}
