import 'package:flutter/material.dart';
import 'package:study_group_flutter/common/widgets/custom_button.dart';
import 'package:study_group_flutter/common/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text(
                'Register',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Create your account for Happy Shopping',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color(0xFF707070),
                    ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Full Name',
                icon: const Icon(
                  Icons.person_2_outlined,
                  color: Color(0xFF344E41),
                ),
                textInputType: TextInputType.emailAddress,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Email',
                icon: const Icon(
                  Icons.email_outlined,
                  color: Color(0xFF344E41),
                ),
                textInputType: TextInputType.emailAddress,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Password',
                icon: const Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFF344E41),
                ),
                isPassword: true,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Confirm Password',
                icon: const Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFF344E41),
                ),
                isPassword: true,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Register',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/',
                      );
                    },
                    child: const Text(
                      'Login',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
