import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/task.dart';
import '../repositories /task_repository.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  const TaskState({
    this.tasks = const [],
  });

  @override
  List<Object> get props => [tasks];
}

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository _taskRepository;

  TaskCubit(this._taskRepository) : super(const TaskState());

  Future<void> loadTasks() async {
    final tasks = await _taskRepository.getAllTasks();
    emit(TaskState(tasks: tasks));
  }

  Future<void> addTask(Task task) async {
    await _taskRepository.addTask(task);
    loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await _taskRepository.updateTask(task);
    loadTasks();
  }

  Future<void> deleteTask(String taskId) async {
    await _taskRepository.deleteTask(taskId);
    loadTasks();
  }
}