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
      title: 'ProgressIndicator', 
      subTitle: 'Generales y controlados', 
      link: '/progress', 
      icon: Icons.refresh_rounded
    ),

  ];
