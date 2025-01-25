import 'package:flutter/material.dart';

double screenWidth = 0;
double screenHeight = 0;
double borderRadius = 16;
void sizeConfig(BuildContext context) {
  screenWidth = MediaQuery.of(context).size.width;
  screenHeight = MediaQuery.of(context).size.height;
}
