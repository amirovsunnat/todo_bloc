// States
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<String> tasks;
  TodoLoaded(this.tasks);

  
}
