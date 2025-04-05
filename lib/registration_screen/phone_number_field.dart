import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneNumberField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (_) {
        final phone = controller.text.trim();
        if (phone.isEmpty || phone.length < 10) {
          return 'Invalid phone number';
        }
        if (!RegExp(r'^\d+$').hasMatch(phone)) {
          return 'Only digits are allowed';
        }
        return null;
      },
      builder: (state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Phone Number", style: TextStyle(fontSize: 10, color: Colors.grey[400])),
          SizedBox(height: 5),
          IntlPhoneField(
            controller: controller,
            initialCountryCode: 'IN',
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            ),
            onChanged: (phone) {
              controller.text = phone.number;
              state.didChange(phone.number);
            },
          ),
          if (state.hasError)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(state.errorText!, style: TextStyle(color: Colors.red, fontSize: 12)),
            ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
