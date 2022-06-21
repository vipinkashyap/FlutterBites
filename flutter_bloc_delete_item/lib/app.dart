import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'screens/screens.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc()..add(PostsFetched()),
      child: const MaterialApp(
        title: 'Flutter Delete Demo',
        debugShowCheckedModeBanner: false,
        home: PostsScreen(),
      ),
    );
  }
}
