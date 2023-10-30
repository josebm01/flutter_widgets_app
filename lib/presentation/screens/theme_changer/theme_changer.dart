import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final isDarkMode = ref.watch( isDarkProvider );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            icon: Icon( isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_outlined ),
            onPressed: (){
              //? Valor del tema
              ref.read( isDarkProvider.notifier ).update((state) => !state);
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
    final int selectedColor = ref.watch( selectedColorProvider );

    final bool isDarkMode = ref.watch( isDarkProvider );
  

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
            ref.read( selectedColorProvider.notifier ).state = index;
          } 
        );
      },
    );
  }
}