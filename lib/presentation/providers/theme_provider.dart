import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//? Tema de la aplicación
final isDarkProvider = StateProvider<bool>((ref) => false);

//? Listado de colores inmutable
final colorListProvider = Provider( (ref) => colorList );


//? Simple int 
final selectedColorProvider = StateProvider((ref) => 0);