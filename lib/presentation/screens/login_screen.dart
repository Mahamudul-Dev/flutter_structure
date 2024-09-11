import 'package:flutter/material.dart';
import 'package:flutter_structure/routes/app_pages.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),

      ),

      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email'
                ),
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              
              const Gap(20),

              ElevatedButton(onPressed: (){
                
              }, child: const Text("Login"),),

              const Gap(10),

              Row(
                children: [
                  const Text("Don't have any account?" ),
                  const Gap(5),
                  TextButton(onPressed: (){
                    context.pushNamed(AppRoutes.REGISTRATION.name);
                  }, child: const Text("Registration"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


// home -> about -> reg -> 