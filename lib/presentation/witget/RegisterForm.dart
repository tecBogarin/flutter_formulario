import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uso_de_formularios/presentation/helper/validadores.dart';
import 'package:uso_de_formularios/presentation/register/register_cubit.dart';
import 'package:uso_de_formularios/presentation/witget/input/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  /// Es un formulario customizado [ Form ] que extiende de un widget de tipo [ StatefulWidget ]
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with Validadores {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  String userName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.watch<RegisterCubit>();
    return Form(
        key: _fromKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
              onChanged: (value) => userNameOnChange(value, registerCubit),
              validador: userNameValidator,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Correo Electrónico',
              onChanged: (value) => emailOnChange(value, registerCubit),
              validador: emailValidator,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: (value) => passwordOnChange(value, registerCubit),
              validador: passwordValidator,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
                onPressed: () {
                  final isValid = _fromKey.currentState!.validate();
                  if (!isValid) return;
                  registerCubit.onSubmit();
                },
                icon: const Icon(Icons.save),
                label: const Text('Guardar información')),
          ],
        ));
  }

  userNameOnChange(String value, RegisterCubit registerCubit) {
    registerCubit.userNameChanged(value);
    _fromKey.currentState?.validate();
  }

  emailOnChange(String value, RegisterCubit registerCubit) {
    registerCubit.emailChanged(value);
    _fromKey.currentState?.validate();
  }

  passwordOnChange(String value, RegisterCubit registerCubit) {
    registerCubit.passwordChanged(value);
    _fromKey.currentState?.validate();
  }
}
