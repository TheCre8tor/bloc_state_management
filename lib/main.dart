import 'package:bloc_state_management/cubit/names_cubit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final NamesCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = NamesCubit();
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: cubit.stream,
        builder: (context, snapshot) {
          final button = TextButton(
            onPressed: cubit.pickRandomName,
            child: const Text("Pick a Ramdom Name"),
          );

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return button;
            case ConnectionState.waiting:
              return button;
            case ConnectionState.active:
              return Column(
                children: [
                  Text(snapshot.data ?? ""),
                  const SizedBox(height: 25),
                  button,
                ],
              );
            case ConnectionState.done:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
