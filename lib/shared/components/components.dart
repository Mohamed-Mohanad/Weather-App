import 'package:flutter/material.dart';

Widget defaultFormField({
  bool isPassword = false,
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) {
  return TextFormField(
    enabled: isClickable,
    obscureText: isPassword,
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: (s) {
      if(onSubmit != null)
        onSubmit(s);
    },
    onChanged: (s) {
      if(onChange != null)
        onChange(s);
    },
    onTap: () {
      if(onTap != null)
        onTap();
    },
    validator: (ss) {
      validate(ss);
    },
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        prefix,
      ),
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: () {
                suffixPressed!();
              },
              icon: Icon(
                suffix,
              ),
            )
          : null,
      border: OutlineInputBorder(),
    ),
  );
}

Widget defaultButton({
  required String text,
  required Function function,
  double radius = 20.0,
  Color color = Colors.blue,
}) =>
    Container(
      height: 50.0,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => widget),
);
