import 'package:app_chat/src/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingrese un email';
                        }
                        const pattern =
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
                        final regExp = RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return 'Por favor ingrese un email valido';
                        }
                        return null;
                      },
                      onSaved: (value) => controller.email = value!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        suffixIcon: IconButton(
                            icon: Icon(
                              controller.obsPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: controller.updatePasswordVisibility),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingrese una contraseña';
                        }
                        RegExp pattern = RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');

                        if (!pattern.hasMatch(value)) {
                          return ("La contraseña no es segura");
                        }

                        return null;
                      },
                      onSaved: (value) => controller.password = value!,
                      obscureText: controller
                          .obsPassword, //the variable to hide or show the password
                    ),
                    ElevatedButton(
                      onPressed: controller.submit,
                      child: const Text('Entrar'),
                    ),
                    TextButton(
                      //get replace the Navigator.push
                      onPressed: () => Get.offNamed('/register'),
                      child: const Text('Registrarse'),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
