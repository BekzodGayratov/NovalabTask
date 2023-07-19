import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novalabtask/core/router.dart';
import 'package:novalabtask/cubit/cat_state.dart';
import 'package:novalabtask/cubit/savedcat_state.dart';
import 'package:novalabtask/db/cat_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  CatDB().registerBoxAdapters();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => CatCubit()),
    BlocProvider(create: (context) => SavedCatCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.router.onGenerate,
    );
  }
}
