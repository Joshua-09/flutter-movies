import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconInputField1 extends StatefulWidget {
  IconInputField1(
      {this.keyboardType,
      this.validations,
      this.hintText,
      this.onSaved,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.value,
      this.controller,
      this.labelText,
      this.isPassword,
      this.haveIcon,
      this.onTap,
      this.headerTextStyle,
      this.onSubmitted,
      this.focusNode});

  final String labelText;
  final TextInputType keyboardType;
  final Function validations;
  final Function onTap;

  final Icon prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final Function onChanged;
  final Function onSaved;
  final Function onSubmitted;

  final dynamic value;
  final TextEditingController controller;
  bool isPassword = false;
  final bool haveIcon;
  final TextStyle headerTextStyle;
  bool tapped = false;
  FocusNode focusNode;
  @override
  _IconInputField1State createState() => _IconInputField1State();
}

class _IconInputField1State extends State<IconInputField1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget.labelText != null
              ? Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    widget.labelText,
                    style: widget.headerTextStyle,
                  ),
                )
              : SizedBox.shrink(),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey[100],
                  blurRadius: 20,
                  spreadRadius: 3,
                  offset: Offset(0, 20))
            ]),
            child: TextFormField(
              autofocus: true,
              focusNode: widget.focusNode,
              onFieldSubmitted: widget.onSubmitted,
              onTap: widget.onTap,
              style: TextStyle(color: Colors.black),
              obscureText: widget.isPassword ?? false,
              initialValue: widget.value,
              keyboardType: widget.keyboardType,
              validator: widget.validations,
              onChanged: widget.onChanged,
              onSaved: widget.onSaved,
              controller: widget.controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'DM Sans',
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
