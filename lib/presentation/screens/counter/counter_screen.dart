import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_providers.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//? ConsumerWidget - Referencia de un provider
class CounterScreen extends ConsumerWidget {

  static const name = 'counter';

  const CounterScreen({super.key});

  @override
  //? WidgetRef - referencia 
  Widget build(BuildContext context, WidgetRef ref) {
  
    //? Se mantiene pendiente del counterProvider cada que tenga un cambio
    final int clickCounter = ref.watch( counterProvider );
    final bool isDarkMode = ref.watch( isDarkProvider );
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),            
        actions: [
          IconButton(
            onPressed: (){
              //? Cambiando el valor del tema al valor contrario
              ref.read( isDarkProvider.notifier )
                .update((state) => !state );
            }, 
            //? validación de íconos de acuerdo al valor del tema
            icon: isDarkMode ? const Icon( Icons.dark_mode_rounded) : const Icon( Icons.light_mode_outlined)
          )
        ], 
      ),  
      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //? Forma 1 - Leyendo el valor del estado por medio de read() y obteniendo el valor del state y aumentando su valor
          // Se puede hacer de 2 formas
          ref.read( counterProvider.notifier ).state++;

          //? Forma 2 - Se obtiene el valor del state y hace el aumento
          // ref.read( counterProvider.notifier ).update((state) => state + 1 );
        },
        child: const Icon( Icons.add),
      ),
    );
  }
}