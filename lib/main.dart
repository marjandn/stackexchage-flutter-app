import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackexchange_app/src/app/bases/connection_status.dart';
import 'package:stackexchange_app/src/app/extensions/theme_extenesion.dart';
import 'package:stackexchange_app/src/di/di.dart';
import 'package:stackexchange_app/src/presentation/pages/questions_list/bloc/questions_list_bloc.dart';

import 'src/app/resources/themes/bloc/theme_bloc.dart';
import 'src/presentation/pages/questions_list/questions_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();
  await ConnectionStatus.startMonitoring();

  runApp(BlocProvider(
    create: (context) => injector<ThemeBloc>(),
    child: const StackExchangeApp(),
  ));
}

class StackExchangeApp extends StatelessWidget {
  const StackExchangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.theme,
      home: BlocProvider(
        create: (context) => injector<QuestionsListBloc>(),
        child: const QuestionsListPage(),
      ),
    );
  }
}
