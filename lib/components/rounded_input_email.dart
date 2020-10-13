import 'text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedInputEmail extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String> validator;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputEmail({
    Key key,
    this.hintText,
    this.icon = Icons.alternate_email,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: this.hintText,
          border: InputBorder.none,
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
