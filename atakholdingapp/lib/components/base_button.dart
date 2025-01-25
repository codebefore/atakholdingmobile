import 'package:atakholdingapp/utility/size_config.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.bgColor,
    this.textColor,
    this.isInScrollView,
    this.style,
    this.border,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);
  final Color? bgColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final String text;
  final Function onTap;
  final bool? isInScrollView;
  final BoxBorder? border;
  final TextStyle? style;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  @override
  Widget build(BuildContext context) {
    TextStyle currentTextStyles = const TextStyle(); //TODO: create base text

    if (style != null) {
      currentTextStyles = currentTextStyles.merge(style);
    }

    currentTextStyles = currentTextStyles
        .merge(TextStyle(color: Theme.of(context).colorScheme.background));

    if (textColor != null) {
      TextStyle newTextStyles = TextStyle(color: textColor);
      currentTextStyles = currentTextStyles.merge(newTextStyles);
    }

    return Material(
      color: bgColor ?? Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: Container(
          width: width ?? screenWidth * .2,
          height: height ?? screenHeight * .04,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              border: border),
          child: prefixIcon == null && suffixIcon == null
              ? Text(text,
                  textAlign: TextAlign.center, style: currentTextStyles)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      prefixIcon ?? Container(),
                      Text(text,
                          textAlign: TextAlign.center,
                          style: currentTextStyles),
                      suffixIcon ?? Container(),
                    ],
                  ),
                ),
        ),
        onTap: () {
          onTap.call();
        },
      ),
    );
  }
}
