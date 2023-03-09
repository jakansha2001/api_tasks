import 'package:api_tasks/animation.dart';
import 'package:api_tasks/animation_basic.dart';
import 'package:api_tasks/task_3/bloc/image_bloc.dart';
import 'package:api_tasks/task_3/image_bloc_page.dart';
import 'package:api_tasks/task_3/image_page.dart';
import 'package:api_tasks/task_5/post_api_future.dart';
import 'package:api_tasks/task_5/post_future_page.dart';
import 'package:api_tasks/task_6/bloc/api_bloc_bloc.dart';
import 'package:api_tasks/task_6/task_6_ui.dart';
import 'package:api_tasks/textfield_bloc/bloc/textfield_bloc.dart';
import 'package:api_tasks/textfield_bloc/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Tasks',
      // home: ImagePage(),
      home: BlocProvider(
        create: (context) => ImageBloc(),
        child: const ImageBlocPage(), // to whom the BLoC needs to be provided
      ),
    );
  }
}
