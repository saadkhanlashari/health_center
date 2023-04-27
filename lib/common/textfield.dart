import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTextField extends StatelessWidget {
  final bool? enabled;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? labelText, hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  const CustomTextField(
      {required this.controller,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = false,
      this.padding,
      this.validator,
      this.keyboardType,
      Key? key,
      this.maxLines,
      this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsetsDirectional.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // title
          if (labelText != null) ...[
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                labelText!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: primaryColor),
              ),
            ),
            const SizedBox(height: 5),
          ],
          TextFormField(
            enabled: enabled,
            maxLines: maxLines,
            keyboardType: keyboardType,
            validator: validator,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black45)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black45)),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: prefixIcon,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: primaryColor),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: primaryColor),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                contentPadding: const EdgeInsets.all(15),
                suffixIcon: suffixIcon),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final String? Function(String?)? validator;
  final Function(dynamic) onChanged;
  final String? labelText, hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;
  const CustomDropDown(
      {required this.items,
      required this.onChanged,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.padding,
      Key? key,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // title
          if (labelText != null) ...[
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                labelText!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: primaryColor),
              ),
            ),
            const SizedBox(height: 5),
          ],
          DropdownButtonFormField(
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: hintText,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).hintColor),
                enabledBorder: border(context),
                focusedBorder: border(context, color: primaryColor),
                errorBorder:
                    border(context, color: Theme.of(context).colorScheme.error),
                focusedErrorBorder: border(context),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                contentPadding: const EdgeInsets.all(15),
                suffixIcon: suffixIcon),
            style: Theme.of(context).textTheme.bodyLarge,
            items: items,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  InputBorder border(BuildContext context, {Color? color}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color ?? Theme.of(context).cardColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      );
}
