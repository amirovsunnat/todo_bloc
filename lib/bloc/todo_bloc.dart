// import 'package:bloc_darsi/bloc/todo_event.dart';
// import 'package:bloc_darsi/bloc/todo_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class TodoBloc extends Bloc<TodoEvent, TodoState> {
//   TodoBloc() : super(TodoInitial()) {
//     on<AddTodoEvent>(
//       (event, emit) {
//         final currentState = state;
//         if (currentState is TodoLoaded) {
//           final updatedTasks = List<String>.from(currentState.tasks)
//             ..add(event.todo);
//           emit(TodoLoaded(updatedTasks));
//         } else {
//           emit(TodoLoaded([event.todo]));
//         }
//       },
//     );
//     on<RemoveTodoEvent>(
//       (event, emit) {
//         final currentState = state;
//         if (currentState is TodoLoaded) {
//           final updatedTasks = List<String>.from(currentState.tasks)
//             ..remove(event.todo);
//           emit(TodoLoaded(updatedTasks));
//         }
//       },
//     );
//   }
// }

import 'package:bloc_darsi/bloc/todo_event.dart';
import 'package:bloc_darsi/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTodoEvent>(
      (event, emit) {
        if (state is TodoLoaded) {
          emit(TodoLoaded((state as TodoLoaded).tasks..add(event.todo)));
        } else {
          emit(TodoLoaded([event.todo]));
        }
      },
    );
    on<RemoveTodoEvent>(
      (event, emit) {
        if (state is TodoLoaded) {
          emit(TodoLoaded((state as TodoLoaded).tasks..remove(event.todo)));
        }
      },
    );
  }
  @override
  void onChange(Change<TodoState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }

  @override
  void onEvent(TodoEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onTransition(Transition<TodoEvent, TodoState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
