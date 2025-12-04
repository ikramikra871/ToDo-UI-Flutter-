import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/todo.dart';
import '../widgets/todo_card.dart';
import 'todo_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<Todo> todos;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    todos = [
      Todo(
          id: '1',
          title: 'analysis',
          description: 'read chapter 3 and solve serie 01 and 2.',
          date: DateTime.now().add(const Duration(hours: 2)),
          priority: 3),
      Todo(
          id: '2',
          title: 'operating systeme',
          description:
              'try to understand symaphores and mutual ex .',
          date: DateTime.now().add(const Duration(hours: 4)),
          priority: 2),
      Todo(
          id: '3',
          title: 'poo',
          description: 'prepare the TP.',
          date: DateTime.now().add(const Duration(days: 1)),
          priority: 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('My Todos')),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false, titleCentered: true)),
            const SizedBox(height: 18),
            Text('Tasks', style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),
            ListView.builder(
                itemCount: todos.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final t = todos[index];
                  return TodoCard(
                      todo: t,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => TodoDetailPage(todo: t)));
                      });
                }),
            const SizedBox(height: 40),
          ])),
    );
  }
}




