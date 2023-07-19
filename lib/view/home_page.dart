import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novalabtask/cubit/cat_state.dart';
import 'package:novalabtask/widgets/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text("Cat random"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'saved');
                },
                icon: const Icon(Icons.save_rounded))
          ],
        ),
        body: Builder(builder: (context) {
          if (state is CatLoadingState) {
            return const Center(
              child: NovalabLoadingWidget(),
            );
          } else if (state is CatErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is CatCompleteState) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage("https://cataas.com/cat"),
              ),
              title: SingleChildScrollView(
                  child: Text(state.model.text.toString())),
              subtitle: Text(state.model.createdAt.toString()),
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
        floatingActionButton: state is CatCompleteState
            ? FloatingActionButton.extended(
                onPressed: () {
                  context.read<CatCubit>().getRandomCats();
                },
                label: const Text("Another fact"))
            : null,
      ),
    );
  }
}
