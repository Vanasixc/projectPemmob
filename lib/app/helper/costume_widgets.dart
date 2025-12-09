import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CusTextField extends StatelessWidget {
  /*
  Untuk widget password, perlu di wrap dengan Obx => tambahkan isHidden dengan 
  variable RxBool dari controller, onToggleVisibility => 
  controller.(variable RxBool).toogle()
  */
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool isAngka;
  final bool isHidden;
  final VoidCallback? onToggleVisibility;
  final bool usePrefixIcon;
  final Icon prefixIcon;

  const CusTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon = const Icon(Icons.add),
    this.usePrefixIcon = false,
    this.isPassword = false,
    this.isAngka = false,
    this.isHidden = false,
    this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? isHidden : false,
        inputFormatters: isAngka
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: usePrefixIcon ? prefixIcon : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: onToggleVisibility,
                )
              : null,
        ),
      ),
    );
  }
}

class CusDropDown<T> extends StatelessWidget {
  final String label;
  final String hint;
  final bool isExpanded;
  final T? selectedValue;
  final List<T> items;
  final ValueChanged<T?> onChanged;

  const CusDropDown({
    super.key,
    required this.label,
    required this.hint,
    this.isExpanded = true,
    this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: DropdownButton<T>(
          isExpanded: isExpanded,
          hint: Text(hint),
          value: selectedValue,
          items: items.map((T nilai) {
            return DropdownMenuItem(
              value: nilai,
              child: Text(nilai.toString()),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
