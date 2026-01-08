import 'package:flutter/material.dart';

import 'hex_color.dart';

//This class is used for app colors
class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100:  Color(0xFFF8DEC3),
    200:  Color(0xFFF3C89C),
    300:  Color(0xFFEEB274),
    400:  Color(0xFFEAA256),
    500:  Color(0xFFE69138),
    600:  Color(0xFFE38932),
    700:  Color(0xFFDF7E2B),
    800:  Color(0xFFDB7424),
    900:  Color(0xFFD56217)
  };

  static MaterialColor materialColorPrimary = const MaterialColor(0xFFE69138, orange);

  //App Colors
  static  Color colorPrimary = HexColor("#FFFFFF");
  static Color colorPrimaryDark = HexColor("#FFFFFF");
  static  Color colorAccent = HexColor("#999999");
//custom colors
  static  Color colorBackground = HexColor("#F5F6F8");
  static  Color colorText = HexColor("#515C6F");
  static  Color colorTextActiveTab = HexColor("#C104B3");
  static  Color colorTextDeActiveTab = HexColor("#141619");
  static  Color colorWhite = HexColor("#FFFFFF");
//App color
  static  Color colorBorder = HexColor("#666666");
  static  Color colorGrayLight2 = HexColor("#979797");
//rgba(17,17,17,0.45) 45% opacity for colorBlack
  static  Color colorBlack = HexColor("#111111");
  static  Color colorPurple = HexColor("#C104B3");
  static  Color colorDarkGray = HexColor("#777777");
  static  Color colorLightGreen = HexColor("#00E4B2");
  static  Color colorLightOrange = HexColor("#FF8D27");
  static  Color colorTextBlack = HexColor("#141619");
  static  Color colorLightBlack = HexColor("#252D34");
  static  Color colorOrange = HexColor("#ED732E");
  static  Color colorBg = HexColor("#FEFEFE");
  static  Color colorChatDescription = HexColor("#4B4B4B");
  static  Color colorTextBlack2 = HexColor("#1D1D1B");
  static  Color colorGray = HexColor("#888888");
  static  Color colorShadow = HexColor("#00000017");
  static  Color colorHintGray = HexColor("#A1A1A1");
  static  Color colorBlogHintSearchGray = HexColor("#044122");
  static  Color colorGrayLight = HexColor("#999999");
  static  Color colorGrayLight4 = HexColor("#DEE1E6");
  static  Color colorBlackTransparent = HexColor("#252d34");
  static  Color colorWhite2 = HexColor("#F1F1F1");
  static  Color colorBgProfile = HexColor("#F8FCFF");
  static  Color colorGrayLight3 = HexColor("#D8D8D8");
  static  Color colorRed = HexColor("#D41F1F");
  static  Color colorChatBorderGreen = HexColor("#044122");
  static  Color colorZBlack = HexColor("#333333");
  static  Color colorCardBorder = HexColor("#d7ede2");
  static  Color colorButBackground = HexColor("#31EB97");
  static  Color editProfileBackground = HexColor('#F8FCFF');
  static  Color colorLoginBoder = HexColor("#ABD6F3");
  static  Color colorLoginText = HexColor('#044122');
  static  Color colorStepText = HexColor('#2D8357');
  static  Color colorPickDoc = HexColor('#EFF6FC');


  static  Color colorGradiantCardStart = HexColor('#000804A1');
  static  Color colorGradiantCardCenter = HexColor('#000804');
  static  Color colorGradiantCardEnd = HexColor('#000904');
  static  Color colorChip = HexColor('#363C39');
  static  Color colorButtonTextBlack = HexColor('#044122');
}
