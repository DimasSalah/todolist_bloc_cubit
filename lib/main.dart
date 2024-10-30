import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist_bloc_cubit/models/task.dart';
import 'cubits/task_cubit.dart';
import 'repositories /task_repository.dart';
import 'screen/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TaskRepository(),
      child: BlocProvider(
        create: (context) => TaskCubit(
          RepositoryProvider.of<TaskRepository>(context),
        )..loadTasks(),
        child: MaterialApp(
          title: 'Task Management',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}