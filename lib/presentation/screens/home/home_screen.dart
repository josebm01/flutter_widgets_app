import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/drawers/side_menu.dart';


class HomeScreen extends StatelessWidget {

  //? static para no generar instancias con esa propiedad
  static const String name = 'home_screen';
  
  const HomeScreen({super.key});
    

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      //? referencia para el scaffold de la vista 
      key:scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      //? Vista privada de Home
      body: _HomeView(),
      //? Definiendo el drawer
      // drawer: Placeholder(),
      drawer: SideMenu( scaffoldKey: scaffoldKey ), //? Pasando la key 
    );
  }
}

class _HomeView extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //? Rango hasta donde alcanzará 
      itemCount: appMenuItems.length,
      //? Opciones que se construyen
      itemBuilder: ( context, index ) {
      
        //? Recorriendo opciones dinámicamente
        final menuItem = appMenuItems[index];

        //? Mostrando la lista de opciones con el Widget ListTile
        return _CustomListTile(menuItem: menuItem);
      }
    );
  }
}



//! Widget personalizado de opciones 
class _CustomListTile extends StatelessWidget {

  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    
    //? Paleta de colores
    final colors = Theme.of( context ).colorScheme;
  

    return ListTile( 
      //? Icono antes del widget 
      leading: Icon( menuItem.icon, color: colors.primary ),
      //? Widget para colocar la final
      trailing: Icon( Icons.arrow_forward_ios_rounded, color: colors.primary ),
      title: Text( menuItem.title ),
      subtitle: Text( menuItem.subTitle ),
      //? Evento para el click
      onTap: () {
        //? Navegación a otra pantalla 
        // push - agrega una vista al stack
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => const ButtonsScreen(),
          //   ),
          // );

          //? Navigation - Definiendo navegación por los nombres de las vistas
          // Navigator.pushNamed(context, menuItem.link);

          //? Go router - push para ir a la ruta 
          context.push( menuItem.link );

          //? Push named para el nombre de la screen
          // context.pushNamed( CardScreen.name );

      },
    );
  }
}