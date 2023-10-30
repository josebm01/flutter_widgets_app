import 'package:flutter_riverpod/flutter_riverpod.dart';

//? StateProvider es un proveedor de estado, pequeña pieza de información de estado de la aplicación
final counterProvider = StateProvider<int>((ref) => 15);