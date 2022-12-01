import 'package:bloc_state_management/cubit/counter_cubit.dart';
import 'package:bloc_state_management/cubit/counter_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final CounterCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = CounterCubit();
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    print("Rendering...");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: StreamBuilder<CounterState>(
          stream: cubit.stream,
          builder: (context, snapshot) {
            print(snapshot.data?.count);

            return Column(
              children: [
                Text("${snapshot.data?.count ?? 0}"),
                TextButton(
                  onPressed: () {
                    cubit.increment();
                  },
                  child: const Text("Increment"),
                ),
                TextButton(
                  onPressed: () {
                    cubit.decrement();
                  },
                  child: const Text("Decrement"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
