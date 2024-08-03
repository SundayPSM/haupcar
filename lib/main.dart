import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar_assignment/blocs/category/category_bloc.dart';
import 'package:haupcar_assignment/blocs/lang_bloc/lang_bloc.dart';
import 'package:haupcar_assignment/screens/categories_screen.dart';
import 'package:haupcar_assignment/services/api_services.dart';
import 'package:haupcar_assignment/utils/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(ApiService())
            ..add(
              InitialCategoryEvent(),
            ),
        ),
        BlocProvider(
          create: (contex) => LangBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangBloc, LangState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Haupcar Assignment',
          theme: Themes.lightTheme,
          debugShowCheckedModeBanner: false,
          home: const Categories(),
          locale: state.lang,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [
            Locale('en'), // English
            Locale('th'), // Thai
          ],
        );
      },
    );
  }
}
