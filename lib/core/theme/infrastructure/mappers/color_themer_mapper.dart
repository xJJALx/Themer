import 'package:flutter/material.dart';
import 'package:themer/core/theme/domain/entities/color_themer.dart';
import 'package:themer/core/theme/domain/entities/color_type.dart';

class ColorThemerMapper {
  static ColorThemer fromJson(Map<String, dynamic> json) {
    return ColorThemer(
      title: json['title'],
      value: Color(json['value']),
      type: ColorType.values[json['type']],
      image: json['image'],
    );
  }

  static Map<String, dynamic> toJson(ColorThemer colorThemer) {
    return {
      'title': colorThemer.title,
      'value': colorThemer.value.value,
      'type': colorThemer.type.index,
      'image': colorThemer.image,
    };
  }
}
