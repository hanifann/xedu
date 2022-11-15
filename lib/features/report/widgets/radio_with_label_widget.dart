
import 'package:flutter/material.dart';
import 'package:xedu/widgets/text_widget.dart';

class RadioWithLabelWidget extends StatelessWidget {
  const RadioWithLabelWidget({
    super.key, 
    required this.value, 
    required this.label, 
    required this.groupValue, 
    this.onTap,
  });

  final String value;
  final String label;
  final String groupValue;
  final void Function(String?)? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: CustomTextWidget(
          text: label,
          weight: FontWeight.w500,
          size: 15,
        ),
        visualDensity: VisualDensity.compact,
        leading: Radio(
          value: value, 
          groupValue: groupValue, 
          onChanged: onTap,
        ),
      ),
    );
  }
}