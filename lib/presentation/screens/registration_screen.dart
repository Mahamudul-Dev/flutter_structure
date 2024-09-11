import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/bloc/auth_bloc.dart';
import 'package:flutter_structure/cubit/registration_from_cubit.dart';
import 'package:flutter_structure/models/registration_form_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_pages.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state){
          if(state is Failed){
            Fluttertoast.showToast(msg: state.message);
          }

          if(state is Success){
            Fluttertoast.showToast(msg: state.message);
            context.goNamed(AppRoutes.HOME.name);
          }

        },
        builder: (context, state){
        if(state is Loading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: context.read<AuthBloc>().nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              const Gap(10),
              TextFormField(
                controller: context.read<AuthBloc>().emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const Gap(10),
              TextFormField(
                controller: context.read<AuthBloc>().passwordController,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const Gap(10),
              ListTile(
                leading:
                    BlocBuilder<RegistrationFromCubit, RegistrationFromState>(
                        builder: (context, state) => Radio<String>(
                            value: 'user',
                            groupValue: context.read<RegistrationFromCubit>().defaultRole,
                            onChanged: (value) {
                              context
                                  .read<RegistrationFromCubit>()
                                  .roleSelection(value);
                            })),
                title: const Text('User'),
              ),
              ListTile(
                leading:
                    BlocBuilder<RegistrationFromCubit, RegistrationFromState>(
                        builder: (context, state) => Radio<String>(
                            value: 'admin',
                            groupValue: context.read<RegistrationFromCubit>().defaultRole,
                            onChanged: (value) {
                              context
                                  .read<RegistrationFromCubit>()
                                  .roleSelection(value);
                            })),
                title: const Text("Admin"),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(Registration(RegistrationFormModel(context.read<AuthBloc>().nameController.text, context.read<AuthBloc>().emailController.text, context.read<AuthBloc>().passwordController.text, context.read<RegistrationFromCubit>().defaultRole)));
                },
                child: const Text("Create Account"),
              ),
              const Gap(10),
              Row(
                children: [
                  const Text("Already have an account?"),
                  const Gap(5),
                  TextButton(
                      onPressed: () {
                        context.goNamed(AppRoutes.LOGIN.name);
                      },
                      child: const Text("Login"))
                ],
              )
            ],
          ),
        ),
      );
      })
    );
  }
}


// Bloc Builder => State rebuild
// Bloc Listener => UI overlay, Navigation
// Bloc Consumer => BlocBuilder+BlocListener; 