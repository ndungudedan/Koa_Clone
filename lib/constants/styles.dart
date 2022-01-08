import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kLightTeal=Color(0xffe2f5f7);
const kTransaparentTeal=Color(0xeee2f5f7);
const kBlueColor = Color(0xff4f83f1);
final kLightGreyColor = Colors.grey[350];
final kDarkGreyColor = Colors.grey[900];
const backroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xfffdfafa), Color(0xffe2f5f7), Color(0xfffdfafa)],
          stops: <double>[0.3, 0.6, 1.0],
);
const kMinimumPadding = 20.0;
const poppinsLight = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none);

const poppinsLightItalic = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.italic);

const poppinsRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none);

const poppinsRegularItalic = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.italic);

const poppinsMedium = TextStyle(
  fontFamily: 'Poppins',
  decoration: TextDecoration.none,
  fontWeight: FontWeight.w500,
);

const poppinsMediumItalic = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    decoration: TextDecoration.none);

const poppinsSemiBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none);

const poppinsSemiBoldItalic = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.italic);

const poppinsBold = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
  decoration: TextDecoration.none,
);

const poppinsBoldItalic = TextStyle(
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic);
