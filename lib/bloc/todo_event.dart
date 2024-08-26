class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String todo;
  AddTodoEvent(this.todo);
}

class RemoveTodoEvent extends TodoEvent {
  final String todo;
  RemoveTodoEvent(this.todo);
}
