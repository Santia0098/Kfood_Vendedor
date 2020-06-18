import 'package:flutter/material.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/AjustesPage/ajustes.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/ComidaPage/comidas.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/GuisosPage/guisos.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/PlatilloPage/platillos.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/PedidosPage/pedidos.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FoodNavigationBar(),
      body: SafeArea(
        child: Text("Inicio"),
      ),
    );
  }
}


/*navegador */
class FoodNavigationBar extends StatefulWidget {
  FoodNavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<FoodNavigationBar> {

  int pageindex = 0;

  Widget _showPage = new Pedidos();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
      pageindex=0;
        return Pedidos();
        break;
      case 1:
      pageindex=1;
        return ComidasScreen();
        break;
      case 2:
      pageindex=2;
        return GuisosScreen();
        break;
      case 3:
      pageindex=3;
        return PlatillosScreen();
        break;
        case 4:
      pageindex=4;
        return Mas();
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text("No page Found"),
          ),
        );
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       bottomNavigationBar: BottomNavigationBar(
         key: _bottomNavigationKey,
          currentIndex: pageindex,
          unselectedItemColor: Colors.black38,
          selectedItemColor: Color.fromRGBO(248, 64, 0, 1),
         items: 
         [
           BottomNavigationBarItem(
             icon: Icon(Icons.shopping_basket),
             title: new Text("Pedidos", style: TextStyle(
               color: Colors.black38
             ),)
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.fastfood, ),
             title: new Text("Comida", style: TextStyle(
               color: Colors.black38
             ),)
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.room_service),
             title: new Text("Guisos", style: TextStyle(
               color: Colors.black38
             ),)
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.restaurant),
             title: new Text("Platillo", style: TextStyle(
               color: Colors.black38
             ),)
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.more_vert),
             title: new Text("Más", style: TextStyle(
               color: Colors.black38
             ),)
           )
         ],
       onTap: (int tappindex) {
            setState(() {
              _showPage = _pageChooser(tappindex);
            });
          },
       ),
       body: Scaffold(
          body: SafeArea(
            child: _showPage,
          ),
        ));
  }
}