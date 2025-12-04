class Todo {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final bool done;
  final int priority;
  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.done = false,
    this.priority = 2,
  });
}



