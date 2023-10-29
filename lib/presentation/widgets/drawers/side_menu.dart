import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  //? Se necesita recibir la key del scaffold
  final GlobalKey<ScaffoldState> scaffoldKey;
    
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  //? Para saber que opcion se tiene seleccionada del menú
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    //? Revisando notch del dispositivo - Android o iOS para saber la distancia en el top
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      //? Asociando el index de la opción seleccionada
      onDestinationSelected: (value) {
        //? Actualizando el state con el nuevo valor del index
        setState(() {
          navDrawerIndex = value;
        });

        //? Opcion seleccionada
        final menuItem = appMenuItems[value];

        //? Navegando a la opción seleccionada del drawer
        context.push( menuItem.link );

        //? Cierra el drawer cuando se seleccione la opción específica
        //? Se espefica con widget porque es una propiedad del stataful
        widget.scaffoldKey.currentState?.closeDrawer();

      },
      children:  [

        //? Título
        Padding(
          // left, top, right, bottom
          padding: EdgeInsets.fromLTRB( 28, hasNotch ? 10 : 20, 16, 10 ),
          child: const Text('Main'),
        ),

        //? Opciones del menú - recorriendo las opciones definidas en 
        ...appMenuItems
          .sublist(0, 3) //? Sublista para mostrar definidas un número
          .map( (item) => NavigationDrawerDestination(
              icon: Icon( item.icon ), 
              label: Text(item.title)
          )),

        //? Segunto título de las otras opciones
        const Padding(
          // left, top, right, bottom
          padding: EdgeInsets.fromLTRB( 28, 20, 16, 10 ),
          child: Text('More Options'),          
        ),

          //? Linea divisoria
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),                      
          ),


        ...appMenuItems
          .sublist(3) //? Mostrando el resto de las opciones después de la 3ra
          .map( (item) => NavigationDrawerDestination(
              icon: Icon( item.icon ), 
              label: Text(item.title)
          )),



      ]
    );
  }
}