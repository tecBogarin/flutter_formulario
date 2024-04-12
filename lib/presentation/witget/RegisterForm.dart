import 'package:flutter/material.dart';
import 'package:uso_de_formularios/presentation/witget/input/custom_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const CustomTextFormField(),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('Guardar información')),
      ],
    ));
  }
}
