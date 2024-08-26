import 'package:bloc_darsi/bloc/todo_bloc.dart';
import 'package:bloc_darsi/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: const MaterialApp(
        title: 'To-Do List',
        home: TodoPage(),
      ),
    );
  }
}
