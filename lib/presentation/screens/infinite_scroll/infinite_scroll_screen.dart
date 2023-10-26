import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;


  @override
  void initState() {
    super.initState();

    //? Determinando que se encuentre al final del scroll
    scrollController.addListener(() { 

      if ( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent ) {
        //? Cargar más imágenes
        loadNextPage();
      }
    });
  }

  //? Limpiando controlador
  @override
  void dispose() {
    scrollController.dispose();

    //? Cuando el componente será destruido
    isMounted = false;
    super.dispose();
  }


  //? Scroll
  Future loadNextPage() async {
    
    if ( isLoading ) return;
    isLoading = true;
    setState(() {});

    //? Esperando 2 segundos para llamar la función para cargar imagenes
    await Future.delayed( const Duration( seconds: 2 ));
    
    addFiveImages();
    isLoading = false;

    //? Verificando si está montado el widget
    if ( !isMounted ) return;

    setState(() {});

    //? Mover scroll
    moveScrollToBottom();

  }


  //? Pull to refresh
  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    // Demore 3 segundos
    await Future.delayed( const Duration( seconds: 3 ));

    if ( !isMounted ) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear(); // Eliminado valores del arreglo 
    imagesIds.add( lastId + 1);
    addFiveImages();

    setState(() {});
  }


  //? Mover el scroll para indicar que cargaron las imagenes
  void moveScrollToBottom() {

    //? Para saber si se encuentra cerca del final
    if ( scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent ) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120, // Posicion a la cual se quiere mover
      duration: const Duration( milliseconds: 300 ), 
      curve: Curves.fastOutSlowIn
    );
  }


  //? Agregando 5 imagenes al arreglo 
  void addFiveImages() {
    // ultimo valor
    final lastId = imagesIds.last;
  
    // insertando nuevos valores
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //? Para abarcar hasta el tope de la barra de notificaciones
      body: MediaQuery.removePadding(
        context: context,
        //? Removiendo la parte de arriba y abajo
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh, //? Pull to refresh
          child: ListView.builder(
            controller: scrollController, //? Controlador del scroll
            itemCount: imagesIds.length,
            itemBuilder: ( context, index ) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            }
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading 
          //? Spin de carga
          ? FadeInRight(
            child: SpinPerfect(
                infinite: true,
                child: const Icon( Icons.refresh_rounded )
              ),
          )
          //? Flecha para salir de la vista
          : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)) 
        ),
    );
  }
}