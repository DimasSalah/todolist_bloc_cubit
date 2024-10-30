import 'package:hive/hive.dart';
import '../models/task.dart';

class TaskRepository {
  static const String _boxName = 'tasks';

  Future<void> addTask(Task task) async {
    final box = await Hive.openBox<Task>(_boxName);
    await box.put(task.id, task);
  }

  Future<void> updateTask(Task task) async {
    final box = await Hive.openBox<Task>(_boxName);
    await box.put(task.id, task);
  }

  Future<void> deleteTask(String taskId) async {
    final box = await Hive.openBox<Task>(_boxName);
    await box.delete(taskId);
  }

  Future<List<Task>> getAllTasks() async {
    final box = await Hive.openBox<Task>(_boxName);
    return box.values.toList();
  }
}