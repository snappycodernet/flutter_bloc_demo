import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_crud_app/bloc/post_bloc.dart';
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
        const SizedBox(height: 20),
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
        BlocListener<UserBloc, UserState>(
          listenWhen: (prevState, currState) {
            return currState is UserLoaded;
          },
          listener: (_, state) {
            var user = (state as UserLoaded).user;
            context.read<PostBloc>().add(GetUserPosts(userId: user.id!));
          },
          child: Container(),
        ),
        BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          switch (state) {
            case PostsLoading():
              return const Column(
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(height: 20),
                  Text("Loading User Posts")
                ],
              );
            case PostsLoaded():
              final posts = state.posts;

              return posts.isEmpty ?
                const Text("No posts for user.") :
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, idx) {
                      return ListTile(
                        title: Text(posts[idx].title ?? "No title"),
                      );
                    },
                    itemCount: posts.length,
                    shrinkWrap: true,
                ),
              );
            case PostError():
              return const Text("Unable to load posts...");
          }
        }),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            context.read<UserBloc>().add(GetUser());
          },
          child: const Text('Get Random User')
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}