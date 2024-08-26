import 'package:bloc_darsi/bloc/todo_bloc.dart';
import 'package:bloc_darsi/bloc/todo_event.dart';
import 'package:bloc_darsi/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add a new task',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final task = _controller.text;
              if (task.isNotEmpty) {
                context.read<TodoBloc>().add(AddTodoEvent(task));
                _controller.clear();
              }
            },
            child: const Text('Add Task'),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoLoaded) {
                  return ListView(
                    children: state.tasks.map((task) {
                      return ListTile(
                        title: Text(task),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<TodoBloc>().add(RemoveTodoEvent(task));
                          },
                        ),
                      );
                    }).toList(),
                  );
                }
                return const Center(child: Text('No tasks yet.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
