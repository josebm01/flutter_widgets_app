import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ButtonsScreen extends StatelessWidget {
  
  static const String name = 'buttons_screen';
  
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen')        
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){
          //? Salir de la vista
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

  final colors = Theme.of( context ).colorScheme;
    
    return SizedBox( 
      //? Toma toda la dimensión del padre
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 20 ),
        //? Similar a las columnas pero la mantiene hacia abajo si el espacio termina
        child: Wrap(
          //? Centrando widgets
          alignment: WrapAlignment.center,
          //? Espacio entre los botones
          spacing: 10,
          children: [ 
            //? Botón
            ElevatedButton(onPressed: (){}, child: const Text('Elevated buttton')),
            //? Botón inhabilitado
            const ElevatedButton(onPressed: null, child: Text('Disabled buttton')),
    
            //? Botón con ícono
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon( Icons.access_alarm_rounded ), 
              label: const Text('Elevated icon') 
            ),

            //? Botón con color relleno
            FilledButton(onPressed: (){}, child: const Text('filled')),
            
            //? Botón relleno con ícono
            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon( Icons.accessibility_new_rounded),
              label: const Text('filled icon')
            ),

            //? Botón con borde
            OutlinedButton(onPressed: (){}, child: const Text('Outline') ),

            //? Botón con borde e ícono
            OutlinedButton.icon(
              onPressed: (){}, 
              icon: const Icon( Icons.abc_sharp ),
              label: const Text('Outline icon')
            ),

            //? Botones de solo texto
            TextButton(onPressed: (){}, child: const Text('Text') ),

            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon( Icons.ad_units ),
              label: const Text('Text Icon')
            ),

            //? Botón ícono
            IconButton(onPressed: (){}, icon: const Icon( Icons.wifi_outlined )),

            //? Personalizando color de botón e ícono
            IconButton(
              onPressed: (){}, 
              icon: const Icon( Icons.wifi_outlined ),
              style: ButtonStyle(
                //? Color de botón
                backgroundColor: MaterialStatePropertyAll( colors.primary ),
                //? Color de ícono
                iconColor: const MaterialStatePropertyAll( Colors.white )
              )
              
            ),

          ],
        ),
      ),
    );
  }
}