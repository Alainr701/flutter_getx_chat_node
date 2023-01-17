import 'package:app_chat/src/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Nombre'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingrese un nombre';
                        }
                        return null;
                      },
                      onSaved: (value) => controller.name = value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Apellido'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingrese un apellido';
                        }
                        return null;
                      },
                      onSaved: (value) => controller.lastName = value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Celular'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingrese un celular';
                        }
                        return null;
                      },
                      onSaved: (value) => controller.cellphone = value!,
                    ),
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
                              // Use "visibility" icon when obscureText is true,
                              // "visibility_off" icon when obscureText is false
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
                      obscureText: controller.obsPassword,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirmar Contraseña',
                        suffixIcon: IconButton(
                            icon: Icon(
                              controller.obsConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed:
                                controller.updateConfirmPasswordVisibility),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingrese una contraseña';
                        }
                        RegExp pattern = RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');

                        if (!pattern.hasMatch(value)) {
                          return ("Confirmar constraseña no es segura");
                        }

                        return null;
                      },
                      onSaved: (value) => controller.password = value!,
                      obscureText: controller.obsConfirmPassword,
                    ),
                    ElevatedButton(
                      onPressed: controller.submit,
                      child: const Text('Entrar'),
                    ),
                    TextButton(
                      onPressed: () => Get.offNamed('/login'),
                      child: const Text('Volver a Login'),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
