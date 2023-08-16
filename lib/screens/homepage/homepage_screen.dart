import 'package:cocoon_kids_flutter/bloc/entry_points_cubit.dart';
import 'package:cocoon_kids_flutter/screens/app_scaffold.dart';
import 'package:cocoon_kids_flutter/screens/homepage/entry_points_view.dart';
import 'package:cocoon_kids_flutter/screens/homepage/urgent_options_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.title,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            const Text(
              'Cocoon Kids Big Hug is a therapeutic service for children and young people',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            UrgentOptionsView(),
            const SizedBox(height: 16),
            Expanded(
              child: BlocProvider(
                create: (_) => EntryPointsCubit(),
                child: const Align(
                    alignment: Alignment.center,
                    child: EntryPointsWidget()
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
