import 'package:clean_arch_project/core/color_const.dart';
import 'package:clean_arch_project/features/application/blocs/post_bloc/post_bloc.dart';
import 'package:clean_arch_project/features/application/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean Arch Pro',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: mainGreen,
          ),
          useMaterial3: false,
        ),
        home: const PostPage(),
      ),
    );
  }
}
