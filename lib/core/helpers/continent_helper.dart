import 'package:flutter/material.dart';
import 'package:map_navigation/designsystem/colors.dart';
import 'package:map_navigation/domain/entities/continent_entity.dart';

Color getContinentColor(EContinent continent) {
  switch (continent) {
    case EContinent.africa:
      return Palette.green100;
    case EContinent.america:
      return Palette.yellow100;
    case EContinent.asia:
      return Palette.blue100;
    case EContinent.oceania:
      return Palette.charcoal100;
    case EContinent.europe:
      return Palette.pink100;
    default:
      return Palette.charcoal100;
  }
}
