import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicator'),
      ),
      body: const _ProgressView()
    );
  }
}


class _ProgressView extends StatelessWidget {  
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox( height: 30 ),
          Text('Circular Progress Indicator'),
          SizedBox( height: 20 ),
          //? Barra de progreso
          CircularProgressIndicator( strokeWidth: 3, backgroundColor: Colors.black12 , ),

          SizedBox( height: 20 ),
          Text('Circular y Linear controlado'),
          SizedBox( height: 10 ),
          _ControlledProgressIndicator()



        ],
      ),
    );
  }
}



class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic( const Duration( milliseconds: 300), ( value) {
        return (value * 2)/100;

        //? Condición para detener la emisión (stream) hasta que sea menor a 100
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        //? Retornando widget
        return Padding(
          padding: const EdgeInsets.symmetric( horizontal: 20 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //? el value va de 0.0 a 1
              CircularProgressIndicator( value: progressValue, strokeWidth: 4, backgroundColor: Colors.black12 ),
              const SizedBox( width: 20 ), 
              //? Toma todo el espacio que el padre da 
              Expanded(
                child: LinearProgressIndicator( value: progressValue )
              )
            ],
          ),
        );
      },
    );
  }
}