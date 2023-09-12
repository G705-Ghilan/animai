import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/custom_navigation_bar.dart';
import 'widgets/message_widget.dart';
import '../extension.dart';
import '../opsai/opsai.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Luffy chat")),
      bottomNavigationBar: const CustombottomNavigationBar(),
      body: context.wOpsai.conversion.isEmpty
          ? const Center(child: Text("type to start chat."))
          : ListView.builder(
              itemCount: context.watch<OpsAiProvider>().conversion.length,
              itemBuilder: (context, index) => MessageWidget(
                msg: context.rOpsai.conversion[index],
                isUser: index % 2 == 0,
              ),
            ),
    );
  }
}
