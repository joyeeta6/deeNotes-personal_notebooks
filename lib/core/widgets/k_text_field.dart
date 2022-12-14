import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class KTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final bool isPassword;
  final bool isDisabled;
  final bool isRequired;
  final bool isBold;
  final bool hasBorder;
  final bool hasBottomMargin;
  final bool smallPadding;
  final Color? fillColor;
  final Function(String)? onChanged;

  const KTextField({
    Key? key,
    this.controller,
    required this.labelText,
    this.isPassword = false,
    this.isDisabled = false,
    this.isRequired = false,
    this.isBold = false,
    this.hasBorder = false,
    this.hasBottomMargin = true,
    this.smallPadding = false,
    this.fillColor,
    this.onChanged,
  }) : super(key: key);

  @override
  State<KTextField> createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: widget.hasBottomMargin ? 15.h : 0.h,
      ),
      child: TextField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        obscureText: widget.isPassword && isVisible,
        style: widget.isBold
            ? TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              )
            : TextStyle(
                color: widget.isDisabled == true
                    ? Colors.grey
                    : Colors.grey.shade900,
              ),
        decoration: widget.hasBorder == false
            ? InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.smallPadding ? 10.r : 15.r),
                  ),
                ),
                hintText: widget.labelText,
                filled: true,
                fillColor: widget.fillColor ?? Colors.grey.shade100,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: widget.smallPadding ? 8.w : 15.h,
                ),
              )
            : InputDecoration(
                hintText: widget.labelText,
                enabled: widget.isDisabled == true ? false : true,
                fillColor: widget.isDisabled == true
                    ? Colors.grey.shade200
                    : Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius:
                      BorderRadius.circular(widget.smallPadding ? 10.r : 15.r),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius:
                      BorderRadius.circular(widget.smallPadding ? 10.r : 15.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: KColors.primary,
                    width: 2.w,
                  ),
                  borderRadius:
                      BorderRadius.circular(widget.smallPadding ? 10.r : 15.r),
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey.shade400,
                        ),
                      )
                    : null,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: widget.smallPadding ? 8.w : 15.h,
                ),
              ),
      ),
    );
  }
}
