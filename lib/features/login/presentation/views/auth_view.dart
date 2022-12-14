import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xedu/features/home/presentation/views/home_admin_view.dart';
import 'package:xedu/features/login/presentation/bloc/auth_bloc.dart';
import 'package:xedu/features/login/presentation/views/login_view.dart';
import 'package:xedu/features/navigation_bar/views/navigation_bar_view.dart';
import 'package:xedu/injection_container.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>()..add(CheckAuthEvent()),
      child: AuthPage(),
    );
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if(state is Authorized){
          if(state.user.data.email == null){
            return HomeAdminView();
          } else {
            return NavigationBarView();
          }
        } else if(state is Unauthorized){
          return LoginView();
        } else {
          return Container();
        }
      },
    );
  }
}
