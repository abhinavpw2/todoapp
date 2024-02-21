import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final OnDeleteItem;

  const ToDoItem(this.todo, this.onToDoChanged, this.OnDeleteItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onTap: () {
          onToDoChanged(todo);
        },
        title: Text(
          todo.todoText!,
          style: TextStyle(
            color: tdBlack,
            fontSize: 16,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
              onPressed: () {
                OnDeleteItem(todo.id);
              },
              icon: const Icon(
                Icons.delete,
                size: 18,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
