import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.icon,
    required this.textEnd,
    required this.label,
    this.onlyRead = false,
    this.onChanged,
    this.onTap,
    this.onTapEnd,
    this.autofocus = false,
    this.controller,
    this.enabled = true,
  });

  final IconData icon;
  final String textEnd;
  final String label;
  final bool onlyRead;
  final ValueChanged<String>? onChanged;
  final Function()? onTap;
  final Function()? onTapEnd;
  final bool autofocus;
  final TextEditingController? controller;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(2, 2),
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: TextField(
        controller: controller,
        readOnly: onlyRead,
        autofocus: autofocus,
        onTap: onTap,
        enabled: enabled,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
          icon: Icon(icon),
          suffix: GestureDetector(
            onTap: onTapEnd,
            child: Text(
              textEnd,
              // style: styleDescriptionBold.copyWith(
              //   color: Theme.of(context).primaryColor,
              //   fontSize: 16,
              // ),
            ),
          ),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
