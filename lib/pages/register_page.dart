import 'package:chat/widgets/btn_blue.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_label.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          maintainBottomViewPadding: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(
                    message: 'Register',
                  ),
                  _Form(),
                  CustomLabel(
                      titleOne: '¿Ya tienes cuenta?',
                      titleTwo: '¡Ingresa ahora!',
                      ruta: 'login'),
                  Text('Términos y condiciones de uso',
                      style: TextStyle(fontWeight: FontWeight.w200))
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
          icon: Icons.perm_identity,
          placeholder: 'Name',
          keyboardType: TextInputType.text,
          textController: nameCtrl,
        ),
        CustomInput(
          icon: Icons.mail_outline,
          placeholder: 'Email',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),
        CustomInput(
          icon: Icons.lock_outline,
          placeholder: 'Contraseña',
          keyboardType: TextInputType.text,
          textController: passwordCtrl,
          isPassword: true,
        ),
        BtnBlue(
          title: 'Ingresar',
          onPressed: () {
            print(emailCtrl.text);
            print(passwordCtrl.text);
          },
        )
      ]),
    );
  }
}
