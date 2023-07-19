import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novalabtask/cubit/savedcat_state.dart';
import 'package:novalabtask/widgets/loading.dart';

class SavedCatPage extends StatefulWidget {
  const SavedCatPage({super.key});

  @override
  State<SavedCatPage> createState() => _SavedCatPageState();
}

class _SavedCatPageState extends State<SavedCatPage> {
  @override
  void initState() {
    context.read<SavedCatCubit>().getAllCats();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCatCubit, SavedCatState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text("Cat random"),
        ),
        body: Builder(builder: (context) {
          if (state is SavedCatLoadingState) {
            return const Center(
              child: NovalabLoadingWidget(),
            );
          } else if (state is SavedCatErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is SavedCatCompleteState) {
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: SingleChildScrollView(
                    child: Text(state.model[index].text.toString())),
                subtitle: Text(state.model[index].createdAt.toString()),
              );
            },itemCount: state.model.length,);
          } else {
            return const SizedBox.shrink();
          }
        }),
      ),
    );
  }
}
