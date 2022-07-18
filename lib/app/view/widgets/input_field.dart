import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/constant/constant.dart';
import 'package:gap/gap.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.controller,
    required this.placeholder,
    required this.label,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.additionalNote,
    this.onChanged,
    this.formatter,
    this.maxLines = 1,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = true,
    this.suffix = false,
    this.onTap,
    this.prefix,
    this.validationColor = Colors.transparent,
    this.height = 64,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String? validationMessage;
  final Function? enterPressed;
  final bool smallVersion;
  final FocusNode? fieldFocusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String? additionalNote;
  final Function? onTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? formatter;
  final int maxLines;
  final bool suffix;
  final Widget? prefix;
  final Color validationColor;
  final String label;
  final double height;

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  late bool isPassword;
  double fieldHeight = 64;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
              color: Color(0xffBABABA),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: AppFont.montserrat,
              fontStyle: FontStyle.normal),
        ),
        const Gap(16),
        TextFormField(
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'poppins',
              height: 1.3),
          decoration: kinputdecorationStyle.copyWith(
            hintText: widget.placeholder,
            suffix: widget.suffix
                ? GestureDetector(
                    onTap: () => setState(() {
                      isPassword = !isPassword;
                    }),
                    child: widget.password
                        ? Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            child: Icon(
                              isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.black,
                              size: 25,
                            ),
                          )
                        : Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                          ),
                  )
                : const Text(''),
          ),
          controller: widget.controller,
          keyboardType: widget.textInputType,
          focusNode: widget.fieldFocusNode,
          cursorColor: AppColors.primaryColor,
          onChanged: widget.onChanged,
          inputFormatters: widget.formatter ?? [],
          onEditingComplete: () {
            if (widget.enterPressed != null) {
              FocusScope.of(context).requestFocus(FocusNode());
              widget.enterPressed!();
            }
          },
          obscureText: isPassword,
        ),
        const Gap(5),
        if (widget.validationMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: NoteText(
              widget.validationMessage!,
              color: Colors.red,
            ),
          )
        else
          const SizedBox(),
        if (widget.additionalNote != null) const Gap(1) else const SizedBox(),
        if (widget.additionalNote != null)
          NoteText(widget.additionalNote!)
        else
          const SizedBox(),
      ],
    );
  }
}
