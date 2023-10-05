import 'package:flutter/material.dart';


const cards = <Map<String, dynamic>>[
  { 'elevation': 0.0, 'label': 'Elevation 0' },
  { 'elevation': 1.0, 'label': 'Elevation 1' },
  { 'elevation': 2.0, 'label': 'Elevation 2' },
  { 'elevation': 3.0, 'label': 'Elevation 3' },
  { 'elevation': 4.0, 'label': 'Elevation 4' },
  { 'elevation': 5.0, 'label': 'Elevation 5' },
];

class CardScreen extends StatelessWidget {

  static const String name = 'card _screen';

  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Screen')        
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //? Scroll
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map( (card) => _CardType1( elevation: card['elevation'], label: card['label']) ),
          ...cards.map( (card) => _CardType2( elevation: card['elevation'], label: card['label']) ),
          ...cards.map( (card) => _CardType3( elevation: card['elevation'], label: card['label']) ),
          ...cards.map( (card) => _CardType4( elevation: card['elevation'], label: card['label']) ),
          //? Espacio al final de las tarjetas
          const SizedBox( height: 50 )
        ],
      ),
    );
  }
}



class _CardType1 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType1({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              //? Alinear a la izquierda 
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon( Icons.more_horiz_outlined ),
                onPressed: (){}, 
              )
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text( label ),
            )
          ],
        ),
      )
    );
  }
}

class _CardType2 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType2({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of( context ).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        //? Border redondeados
        borderRadius: const BorderRadius.all( Radius.circular(12) ),
        //? Borde
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              //? Alinear a la izquierda 
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon( Icons.more_horiz_outlined ),
                onPressed: (){}, 
              )
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text( '$label - outline' ),
            )
          ],
        ),
      )
    );
  }
}

class _CardType3 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType3({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of( context ).colorScheme;

    return Card(
      //? surfaceVariant - Color más intenso
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              //? Alinear a la izquierda 
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon( Icons.more_horiz_outlined ),
                onPressed: (){}, 
              )
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text( '$label - filled' ),
            )
          ],
        ),
      )
    );
  }
}

class _CardType4 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType4({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      //? Evita que los hijos se salgan del contenido del padre
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [

          Image.network(
            'https://picsum.photos/id/${ elevation.toInt() }/600/350',
            height: 350,
            //? Forma en que se adapta la imagen en el espacio
            fit: BoxFit.cover,
          ),

          Align(
            //? Alinear a la izquierda 
            alignment: Alignment.topRight,
            child: Container(
              //? Widget a lado de la imagen
              decoration: const BoxDecoration(
                color: Colors.white,
                //? Borde redondeado en la parte inferior del botón
                borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20) )
              ),
              child: IconButton(
                icon: const Icon( Icons.more_horiz_outlined ),
                onPressed: (){}, 
              ),
            )
          ),
        ],
      )
    );
  }
}

