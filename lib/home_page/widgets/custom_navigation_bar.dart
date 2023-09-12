import 'package:flutter/material.dart';
import '../../extension.dart';

class CustombottomNavigationBar extends StatelessWidget {
  const CustombottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 1,
          child: (context.wOpsai.loading)
              ? const LinearProgressIndicator()
              : const Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            left: 10,
            right: 10,
            top: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    controller: context.rOpsai.controller,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "chat with luffy",
                      hintStyle: TextStyle(fontWeight: FontWeight.normal),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  await context.rOpsai.submit();
                },
                elevation: 0,
                child: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
