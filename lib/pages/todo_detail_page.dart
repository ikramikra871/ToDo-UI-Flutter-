import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoDetailPage extends StatelessWidget {
  final Todo todo;
  const TodoDetailPage({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Todo details')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(todo.title,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(children: [
            Chip(label: Text('Priority ${todo.priority}')),
            const SizedBox(width: 12),
            Text("${todo.date.toLocal()}".split(' ')[0])
          ]),
          const SizedBox(height: 20),
          Text('Description', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(todo.description, style: theme.textTheme.bodyMedium)),
          const Spacer(),
          Row(children: [
            Expanded(
                child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Marked as done')));
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('done'))),
            const SizedBox(width: 12),
            OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back')),
          ])
        ]),
      ),
    );
  }
}
