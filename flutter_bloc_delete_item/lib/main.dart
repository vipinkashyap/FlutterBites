import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_delete_item/posts_bloc_observer.dart';

import 'app.dart';

void main() {
  EquatableConfig.stringify = true;
  BlocOverrides.runZoned(() => runApp(const App()),
      blocObserver: PostsBlocObserver());
}
