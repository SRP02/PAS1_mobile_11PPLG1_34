import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_34/helpers/auth_helpers.dart';
import 'package:pas1_mobile_11pplg1_34/Controller/AuthController.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthHelpers.buildTextField(
                controller: _usernameController,
                labelText: 'Username',
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter username' : null,
              ),
              const SizedBox(height: 16),
              AuthHelpers.buildTextField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter password' : null,
              ),
              const SizedBox(height: 24),
              Obx(() {
                return AuthHelpers.buildSubmitButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authController.login(
                        _usernameController.text,
                        _passwordController.text,
                      );
                    }
                  },
                  text: 'Login',
                  isLoading: authController.isLoading.value,
                );
              }),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Get.offNamed('/register');
                },
                child: const Text('Don\'t have an account? Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
