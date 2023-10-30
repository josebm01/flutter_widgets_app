import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


void main() {
  runApp(
    //? Riverpod - sabrá los privider para manejar información de las vistas
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    //? Obteniendo el valor del provider del tema
    final isDarkMode = ref.watch( isDarkProvider );
    final selectedColor = ref.watch( selectedColorProvider );
    

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme( 
        //? Color seleccionado de los widgets
        selectedColor: selectedColor, 
        //? Color seleccionado para el tema dark/light
        isDarkMode: isDarkMode 
      ).getTheme(), 
    );
  }
}
