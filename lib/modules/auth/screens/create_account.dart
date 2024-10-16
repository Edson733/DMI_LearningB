import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../kernel/widgets/custom_text_field_password.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confimPasswordController = TextEditingController();

  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Registro'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('cohete.png', width: 200, height: 200),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Correo Electronico',
                          label: Text('Correo Electronico'),
                          hintStyle: TextStyle(fontSize: 16, color: Colors.white38),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFieldPassword(controller: _passwordController),
                      const SizedBox(height: 16),
                      CustomTextFieldPassword(controller: _confimPasswordController, hintText: 'Confirmar Contraseña', labelText: 'Confirmar Contraseña'),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              print('Datos: ${_emailController.text} - ${_passwordController.text} - ${_confimPasswordController.text}');
                              try {
                                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text
                                );
                                print('Credenciales: $credential');
                              } on FirebaseAuthException catch (err) {
                                if (err.code == 'weak-password') {
                                  print('La contraseña proporcionada es demasiado débil.');
                                } else if (err.code == 'email-already-in-use') {
                                  print('La cuenta ya existe para ese correo electrónico.');
                                }
                              } catch (err) {
                                print(err);
                              }
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                          ),
                          child: const Text('Crear cuenta')
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/login'),
                        child: const Text(
                          'Iniciar Sesión', 
                          style: TextStyle(
                            color: Colors.blue, 
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue
                          )
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}