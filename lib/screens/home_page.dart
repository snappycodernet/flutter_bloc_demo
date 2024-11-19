import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Demo"),
      ),
      body: const SafeArea(child: UserProfile()),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          switch (state) {
            case UserLoading():
              return const Center(child: CircularProgressIndicator());
            case UserLoaded():
              return Center(
                child: Column(
                  children: [
                    Text('${state.user.email}', style: const TextStyle(fontSize: 16, color: Colors.white)),
                    Text('${state.user.name}', style: const TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
              );
            case UserError():
              return const Text('Something went wrong!');
          }
        }),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            context.read<UserBloc>().add(GetUser());
          },
          child: const Text('Get Random User')
        )
      ],
    );
  }
}