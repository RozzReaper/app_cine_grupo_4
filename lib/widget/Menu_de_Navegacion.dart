import 'package:cine_app_grupo_4/assets/pagina/Boletos.dart';
import 'package:cine_app_grupo_4/assets/pagina/Cartelera.dart';
import 'package:cine_app_grupo_4/assets/pagina/Dulceria.dart';
import 'package:cine_app_grupo_4/assets/pagina/Estrenos.dart';
import 'package:cine_app_grupo_4/assets/pagina/Notificaciones.dart';
import 'package:cine_app_grupo_4/assets/pagina/Usuarios.dart';
import 'package:cine_app_grupo_4/assets/pagina/login.dart';
import 'package:flutter/material.dart';
 
/*import 'package:cine_app/screen/Dulceria.dart'; // Importar la página de Dulcería
import 'package:cine_app/screen/Boletos.dart'; // Importar la página de Boletos
import 'package:cine_app/screen/Usuarios.dart'; // Importar la página de Usuarios
import 'package:cine_app/screen/Cartelera.dart'; // Importar la página de Cartelera
import 'package:cine_app/screen/Notificaciones.dart'; // Importar la página de Notificaciones*/

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(horizontal: 20);
    final logo = 'https://iili.io/dnhg3dB.png'; // URL de la imagen del encabezado
    
    return Drawer(
      child: Material(
        color: Color.fromRGBO(129, 66, 255, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
              logo: logo,
              urlImage: 'https://iili.io/dqmQpDP.jpg', // URL de ejemplo para la imagen de avatar
              name: 'John Doe',
              email: 'john.doe@example.com',
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Cartelera',
                    icon: Icons.movie,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Taquilla',
                    icon: Icons.local_activity,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Usuario',
                    icon: Icons.account_circle,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Estrenos',
                    icon: Icons.new_releases,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Dulcería',
                    icon: Icons.local_cafe,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Notificaciones',
                    icon: Icons.notifications,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'LoginPage',
                    icon: Icons.login,
                    onClicked: () => selectedItem(context, 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required String logo,
  }) =>
      InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(logo),
              ),
              SizedBox(height: 12),
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(urlImage),
              ),
              SizedBox(height: 12),
              Text(
                name,
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                email,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Cartelera(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Taquilla(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Usuarios(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Estrenos(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dulceria(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Notificaciones(),
        ));
        break;
      case 6:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
    }
  }
}