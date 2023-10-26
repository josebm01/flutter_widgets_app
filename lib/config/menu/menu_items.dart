//? Importando solo lo que se necesita del paquete
// import 'package:flutter/material.dart' show IconData;
import 'package:flutter/material.dart';

class MenuItem {

  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });

}



  const appMenuItems = <MenuItem>[
  
    MenuItem(
      title: 'Botones', 
      subTitle: 'Más botones', 
      link: '/buttons', 
      icon: Icons.smart_button_outlined
      ),

    MenuItem(
      title: 'Tarjetas', 
      subTitle: 'Contenedor estilizado', 
      link: '/cards', 
      icon: Icons.credit_card
    ),

    MenuItem(
      title: 'ProgressIndicators', 
      subTitle: 'Generales y controlados', 
      link: '/progress', 
      icon: Icons.refresh_rounded
    ),

    MenuItem(
      title: 'Snackbars y diálogos', 
      subTitle: 'Indicadores en pantalla', 
      link: '/snackbars', 
      icon: Icons.refresh_rounded
    ),

    MenuItem(
      title: 'Animated container', 
      subTitle: 'Stateful widget animado', 
      link: '/animated', 
      icon: Icons.check_box_outline_blank_rounded
    ),
    MenuItem(
      title: 'UI Controls + Tiles', 
      subTitle: 'Una serie de controles de flutter', 
      link: '/ui-controls', 
      icon: Icons.car_rental_outlined
    ),
    MenuItem(
      title: 'Introducción a la aplicación', 
      subTitle: 'Pequeño tutorial introductorio', 
      link: '/tutorial', 
      icon: Icons.accessible_forward_outlined
    ),
    MenuItem(
      title: 'InfiniteScroll y Pull to Refresh', 
      subTitle: 'Listas infinitas y pull to refresh', 
      link: '/infinite', 
      icon: Icons.list_alt_rounded
    ),

  ];
