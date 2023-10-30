import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    // final isDarkMode = ref.watch( isDarkProvider );
    //? stateNotifier
    final isDarkMode = ref.watch( themeNotifierProvider ).isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            icon: Icon( isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_outlined ),
            onPressed: (){
              //? Valor del tema por medio del provider
              // ref.read( isDarkProvider.notifier ).update((state) => !state);

              //? stateNotifier - ya no se el pasa el valor, porque el provider ya lo hace 
              ref.read( themeNotifierProvider.notifier ).toggleDarkMode();
            }, 
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}



class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    //? Accediendo al provider de los colores
    final List<Color> colors = ref.watch( colorListProvider );

    //? Valor del provider para seleccionar el color 
    // final int selectedColor = ref.watch( selectedColorProvider );

    //? stateNotifier
    final selectedColor = ref.watch( themeNotifierProvider ).selectedColor;

  
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {

        //? Color seleccionado
        final color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle( color: color )),
          subtitle: Text('${color.value}'), // codigo del color
          activeColor: color, // color del botón seleccionado
          value: index, // valor del indice 
          groupValue: selectedColor,  // valor seleccionado
          // valor nuevo
          onChanged: (value) {
            //? Asignando al provider el valor del index que se selecciona 
            // ref.read( selectedColorProvider.notifier ).state = index;

            //? stateNotifier - ya no se el pasa el valor, porque el provider ya lo hace 
            ref.read( themeNotifierProvider.notifier ).changeColorIndex( index );
          } 
        );
      },
    );
  }
}