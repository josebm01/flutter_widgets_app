import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//! Provider - Valores in,utables
//? Listado de colores inmutable
final colorListProvider = Provider( (ref) => colorList );

//! State - para mantener una pieza de estado 
//? Tema de la aplicación
final isDarkProvider = StateProvider<bool>((ref) => false);

//? Simple int 
final selectedColorProvider = StateProvider((ref) => 0);



//! StateNotifierProvider - se mantiene al pendiente de un estado complejo
/* 
  ? Objeto de tipo AppTheme (custom)
  ? Primer valor - Clase encargada para manejar el estado del Notifier será ThemeNotifier
  ? Segundo valor - Instancia de la clase
  
*/
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  //? Regresa la instancia 
  (ref) => ThemeNotifier()
);


//? Definiendo Controller o Notifier - controlando tema 
//? Intenta mentener el estado 
class ThemeNotifier extends StateNotifier<AppTheme> {
  //? Indicando que cree la primera instancia
  //? State = Estado = new AppTheme()
  ThemeNotifier(): super(AppTheme());

  //? Acceso a las propiedades de la clase
  void toggleDarkMode() {
    //? asignando el valor contrario del estado
    state = state.copyWith( isDarkMode: !state.isDarkMode );
  }

  void changeColorIndex( int colorIndex ) {
    state = state.copyWith( selectedColor: colorIndex );
  }

}