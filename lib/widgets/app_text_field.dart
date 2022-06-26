import 'package:auth_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.icon,
    required this.hText,
    required this.enableBorder,
    this.showSuffixIcon = false,
    this.icons = false,
    this.showPrefixIcon = false,
    this.validator,
    this.iconColor,
    this.enabled = true,
    this.onValueChanged,
    this.obscure = false,
    required this.maxLines,
    this.isPassword = false,
    required this.height,
    this.controller,
    this.keyboardType,
    this.inputFormatters = const [],
  }) : super(key: key);
  final String hText;
  final bool showSuffixIcon;
  final bool icons;
  final bool enabled;
  final Color? iconColor;
  final bool showPrefixIcon;
  final bool obscure;
  final int maxLines;
  final double height;
  final bool isPassword;
  final Function(String v)? onValueChanged;
  final String? Function(String?)? validator;
  final bool enableBorder;
  final TextEditingController? controller;
  final IconData icon;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType? keyboardType;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();
  // use to detect if user has input value
  bool _hasValue = false;
  bool _isObscured = true;
  changeHasValue(bool newHasValue) {
    setState(() {
      _hasValue = newHasValue;
    });
  }

  // bool hasFocus=
  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      maxLines: widget.maxLines,
      inputFormatters: widget.inputFormatters,
      onChanged: (value) {
        if (_hasValue && value.isEmpty) {
          changeHasValue(false);
        } else if (!_hasValue && value.isNotEmpty) {
          changeHasValue(true);
        }
        if (widget.onValueChanged != null) {
          widget.onValueChanged!(value);
        }
      },
      obscureText: (widget.isPassword ? (_isObscured) : false),
      validator: widget.validator,
      style: const TextStyle(
        color: Color.fromARGB(255, 83, 71, 71),
      ),
      onFieldSubmitted: (v) => FocusScope.of(context).unfocus(),
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        // prefixIcon: SizedBox():

        suffixIcon: !widget.isPassword
            ? const SizedBox.shrink()
            : IconButton(
                onPressed: _toggle,
                icon:
                    Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
              ),
        contentPadding: const EdgeInsets.all(10),
        isDense: true,
        fillColor: _hasValue ? Colors.white : const Color(0xffF7F7F7),
        filled: true,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 2,
            style: BorderStyle.solid,
            color: kPrimaryColor,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            width: 2,
            color: Color(0xffF7F7F7),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            width: 2,
            color: Color(0xffF7F7F7),
          ),
        ),

        hintText: widget.hText,
        hintStyle: GoogleFonts.sarabun(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xffBDBDBD),
        ),

        prefixIconConstraints:
            // widget.showPrefixIcon
            // ?
            const BoxConstraints(maxWidth: 60, minWidth: 15),
        // : const BoxConstraints(maxWidth: 4, minWidth: 3),
        prefixIcon: widget.showPrefixIcon
            ? AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(
                  right: 10,
                  top: 1.3,
                  left: 1,
                  bottom: 1.3,
                ),
                height: widget.height,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: _focusNode.hasFocus
                      ? kPrimaryColor
                      : _hasValue
                          ? Colors.grey.shade200
                          : const Color(0xffE0E0E0),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.iconColor != null && !_focusNode.hasFocus
                      ? widget.iconColor
                      : Colors.white,
                ),
              )
            : SizedBox(
                height: widget.height,
                width: 0,
              ),
      ),
    );
  }

  _toggle() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
}
