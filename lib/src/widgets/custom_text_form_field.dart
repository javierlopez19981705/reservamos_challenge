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
    this.suffix,
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
  final Widget? suffix;

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
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
          icon: Icon(icon),
          suffix: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(.1),
            radius: 18,
            child: IconButton(
              color: Theme.of(context).primaryColor,
              onPressed: onTapEnd,
              icon: const Icon(Icons.clear),
              iconSize: 18,
            ),
          ),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
