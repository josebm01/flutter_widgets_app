import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});


  //! Snackbar
  void showCustomSnackbar( BuildContext context ) {

    //? Limpiando snackbars anteriores para mostrar
    ScaffoldMessenger.of( context ).clearSnackBars();
    
    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      //? Mensajes que se muestran en el snackbar
      action: SnackBarAction(label: 'OK', onPressed: (){}),
      //? Duración en la que se mostrará el snackbar
      duration: const Duration( seconds: 2 ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }


  //! Diálogo (modal)
  void openDialog( BuildContext context ) {
    showDialog(
      context: context, 
      //? Inhabilitando que al dar clic fuera del diálogo se cierre
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Ad non consectetur tempor pariatur magna in.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancelar')
          ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
          )
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          //? Botón centrado horizontal y vertical
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //? Primer botón
            FilledButton.tonal(
              onPressed: (){
                //? Muestra las licencias usadas
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Elit ad adipisicing elit sint aliqua culpa minim eu in labore. Dolore nulla sit laborum mollit veniam. Non sint pariatur est sunt irure pariatur officia Lorem irure. Ut culpa commodo duis aliqua duis laboris. Dolore nisi duis excepteur duis ea nulla fugiat sit cillum est labore eiusmod dolor. Tempor incididunt aliquip proident qui duis. Ullamco sunt adipisicing enim veniam magna deserunt veniam nisi dolor et officia. Est velit fugiat ex aliqua adipisicing excepteur proident nostrud dolore ex consectetur sint esse tempor.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),

            //? Segundo botón
            FilledButton.tonal(
              onPressed: () => openDialog( context ), 
              child: const Text('Mostrar diálogo')
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon( Icons.remove_red_eye_outlined ),
        onPressed: () => showCustomSnackbar(context), 
      ),
    );
  }
}