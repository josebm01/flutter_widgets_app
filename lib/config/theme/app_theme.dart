import 'package:flutter/material.dart';

//? Lista de colores
const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {

  //? Propiedades
  final int selectedColor;
  final bool isDarkMode;

  //? Constructor
  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false
  }): 
    //? Validaciones para el color selecionado
    assert( selectedColor >= 0, 'Selected color must be greater than 0' ),
    assert( selectedColor < colorList.length, 'Selected color must be less or equal than ${ colorList.length } - 1' );


  //? Métodos
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    //? Modo oscuro 
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    //? Color elegido
    colorSchemeSeed: colorList[ selectedColor ],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

}