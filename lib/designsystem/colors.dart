import 'package:flutter/material.dart';

extension Palette on Color {
  // pink
  static const Color pink110 = Color(0xffe5438c);
  static const Color pink100 = Color(0xffff4b9c);
  static const Color pink80 = Color(0xffff6fb0);
  static const Color pink60 = Color(0xffff93c4);
  static const Color pink40 = Color(0xffffb7d7);
  static const Color pink20 = Color(0xffffdbeb);
  static const Color pink10 = Color(0xfffef6fb);

  // blue
  static const Color blue110 = Color(0xff378ed6);
  static const Color blue100 = Color(0xff509fef);
  static const Color blue80 = Color(0xff73b2f2);
  static const Color blue60 = Color(0xff96c5f5);
  static const Color blue40 = Color(0xffb9d9f9);
  static const Color blue20 = Color(0xffdcecfc);
  static const Color blue10 = Color(0xffedf5fd);

  // yellow
  static const Color yellow110 = Color(0xffe5bc23);
  static const Color yellow100 = Color(0xffffd228);
  static const Color yellow80 = Color(0xffffdb53);
  static const Color yellow60 = Color(0xffffe47e);
  static const Color yellow40 = Color(0xffffeda9);
  static const Color yellow20 = Color(0xfffff6d4);
  static const Color yellow10 = Color(0xfffffbe9);

  // green
  static const Color green110 = Color(0xff08b3a1);
  static const Color green100 = Color(0xff0ac8b4);
  static const Color green80 = Color(0xff3bdbc3);
  static const Color green60 = Color(0xff6cded2);
  static const Color green40 = Color(0xff9de9e1);
  static const Color green20 = Color(0xffcef4f0);
  static const Color green10 = Color(0xffe7f9f7);

  static const Color darkGreen100 = Color(0xff005249);

  // charcoal
  static const Color charcoal110 = Color(0xff33343a);
  static const Color charcoal100 = Color(0xff393b41);
  static const Color charcoal80 = Color(0xff616267);
  static const Color charcoal60 = Color(0xff88898d);
  static const Color charcoal40 = Color(0xffb0b1b3);
  static const Color charcoal20 = Color(0xffd7d8d9);
  static const Color charcoal10 = Color(0xffebebec);

  // purple
  static const Color purple110 = Color(0xff794BF9);
  static const Color purple100 = Color(0xff855BFA);
  static const Color purple80 = Color(0xff9E7CFB);
  static const Color purple60 = Color(0xffB69DFC);
  static const Color purple40 = Color(0xffCEBEFD);
  static const Color purple20 = Color(0xffE7DEFE);
  static const Color purple10 = Color(0xffF3EFFE);
  static const Color purpleBg = Color(0xffE8E3F6);

  //golden
  static const Color golden10 = Color(0xffF6F3ED);

  // covid
  static const Color covidBase = Color(0xfffff3ea);
  static const Color covidBorder = Color(0xffFFC9A1);
  static const Color covidLightestest = Color(0xffFFEBDC);
  static const Color covidDark = Color(0xffE66600);
  static const Color covidDarkest = Color(0xffB74A00);
  static const Color covidMenuBorder = Color(0xffB0B1B2);

  // gray
  static const Color grayBase = Color(0xff97999c);
  static const Color grayLight = Color(0xfff6f9fe);
  static const Color grayLightBg = Color(0xffE5E5E5);
  static const Color grayAlt = Color(0xffFAFAFA);

  // red
  static const Color redBase = Color(0xfff44444);
  static const Color redWarning = Color(0xffff4b63);

  // orange
  static const Color orangeBase = Color(0xffff9c28);
  static const Color orangeWarning = Color(0xffFFB028);

  // whites
  static const Color white = Color(0xffFFFFFF);
  //background 50% opacity
  static const Color white50 = Color.fromRGBO(255, 255, 255, 0.5);

  // black
  static const Color black = Color(0xFF000000);

  // tabbar shadow blue 20% with opacity
  static const Color tabShadow = Color.fromRGBO(80, 159, 239, 0.12);

  // button tab shadow
  static const Color boxShadow = Color.fromRGBO(0, 0, 0, 0.1);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
