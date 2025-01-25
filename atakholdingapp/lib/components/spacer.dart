import 'package:atakholdingapp/utility/size_config.dart';
import 'package:flutter/material.dart';

SizedBox spacer({double? height, double? width}) => SizedBox(
      height: screenHeight * (height ?? .025),
      width: screenWidth * (width ?? .025),
    );
