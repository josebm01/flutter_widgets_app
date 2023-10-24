import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl); 
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Ad do cupidatat aute eiusmod dolore culpa ut elit.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Fugiat officia sit duis deserunt.', 'assets/images/2.png'),
  SlideInfo('Disfrutas la comida', 'Commodo qui qui ut velit fugiat fugiat dolor officia tempor ex dolore.', 'assets/images/3.png'),
];


class AppTutorialScreen extends StatefulWidget {
  
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  late final PageController pageViewController = PageController();
  bool endReached = false; //? Usada para indicar cuando se encuentra al final del scroll

  //? Listener 
  @override
  void initState() {
    super.initState();

    //? Esperando que llegue al final del scroll, obtiene los valores de cada scroll
    pageViewController.addListener(() { 

      final page = pageViewController.page ?? 0;

      //? Si no llega al final y se encuentra en la página menor
      if ( !endReached && page >= (slides.length - 1.5) ) {
        //? Cambiando el valor del estado 
        setState(() {
          endReached = true;
        });
      }

    }); 
  }


  //? Llamar dispose para limpiar los listener
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            //? Controlador para saber lo que sucede en el scroll
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              //? Mostrando vista de acuerdo al widget
              ( slideData ) => _Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageUrl: slideData.imageUrl,
              )
            ).toList(), //? Espera una lista de widget 
          ),

          //? Botón en la esquina superior derecha para salir
          Positioned(
            right: 10,
            top: 30,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            )
          ),

          endReached ? 
            Positioned(
              bottom: 30,
              right: 30,
              //? Animación
              child: FadeInRight(
                from: 15,
                delay: const Duration( seconds: 1 ),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Comenzar')
                ),
              )
            ) : const SizedBox() //? Muestra un widget de 0 pixeles
        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {
  
  final String title;
  final String caption;
  final String imageUrl;
  
  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge; 
    final captionStyle = Theme.of(context).textTheme.bodySmall; 

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 30 ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image( image: AssetImage( imageUrl ) ),
            const SizedBox( height: 20 ),
            Text( title, style: titleStyle ),
            const SizedBox( height: 10 ),
            Text( caption, style: captionStyle, ),
          ],
        ),
      ),
    );
  }
}