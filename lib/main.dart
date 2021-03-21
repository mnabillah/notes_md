import 'package:flutter/material.dart';
import 'package:notes_md/screen/home_screen.dart';
import 'package:notes_md/viewmodel/notes_provider.dart';
import 'package:notes_md/viewmodel/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NotesProvider()),
            ChangeNotifierProvider(create: (_) => ThemeProvider())
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, provider, child) => MaterialApp(
              title: 'Flutter Demo',
              theme: provider.getTheme(),
              home: HomeScreen(title: 'Notes.MD'),
              debugShowCheckedModeBanner: false,
            ),
          ));
}
