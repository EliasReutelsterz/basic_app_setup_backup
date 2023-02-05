import 'package:flutter/material.dart';

class LoginRegisterButton extends StatelessWidget {
  final String buttonText;
  final Function callback;
  const LoginRegisterButton(
      {Key? key, required this.buttonText, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 120),
      child: Container(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: themeData.colorScheme.primary, width: 3),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  themeData.colorScheme.onPrimary),
              elevation: MaterialStateProperty.all<double>(0.0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
          onPressed: () => callback(),
          child: Container(
            child: Center(
              child: Text(
                this.buttonText,
                style: themeData.textTheme.bodyText1!.copyWith(
                  color: themeData.colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
