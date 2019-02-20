import 'package:flutter/material.dart';
import './home/home_screen.dart';
import './home/contacts_page.dart' show AppColors;
void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.AppBarColor),
    cardColor: Color(AppColors.AppBarColor)
  ),
  home: HomeScreen(),
  ));

