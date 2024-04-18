import 'package:flutter/material.dart';
import 'package:uso_de_formularios/presentation/witget/input/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  /// Es un formulario customizado [ Form ] que extiende de un widget de tipo [ StatefulWidget ]
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  String userName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _fromKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
              onChanged: (value) => userName = value,
              validador: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Campo requerido';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Correo Electrónico',
              onChanged: (value) => email = value,
              validador: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Campo requerido';
                }
                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );
                if (!emailRegExp.hasMatch(value)) {
                  return 'No tiene el formato requerido';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: (value) => password = value,
              validador: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Campo requerido';
                }
                if (value.length < 6) return 'Más de 6 letras';
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
                onPressed: () {
                  final isValid = _fromKey.currentState!.validate();
                  if (!isValid) return;
                  print('$userName,  $email,  $password');
                },
                icon: const Icon(Icons.save),
                label: const Text('Guardar información')),
          ],
        ));
  }
}
