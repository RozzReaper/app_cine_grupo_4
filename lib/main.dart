import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cine_app_grupo_4/widget/button_widget.dart'; // Importar el widget de botón personalizado
import 'package:cine_app_grupo_4/widget/Menu_de_Navegacion.dart'; // Importar el widget de cajón de navegación

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Pagina De Navegacion';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(), // Agregar el cajón de navegación lateral
        // endDrawer: Pagina De Navegacion (), // Este es un comentario que parece que se intentó agregar un cajón de navegación en el extremo derecho, pero está comentado
        appBar: AppBar(
          title: Text(MyApp.title), // Título de la barra de aplicación
        ),
        body: Builder(
          builder: (context) => Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: ButtonWidget(
              icon: Icons.open_in_new, // Icono del botón
              text: 'Abrir', // Texto del botón
              onClicked: () {
                Scaffold.of(context).openDrawer(); // Abrir el cajón de navegación lateral al hacer clic en el botón
                // Scaffold.of(context).openEndDrawer(); // Este es un comentario que parece que se intentó abrir un cajón de navegación en el extremo derecho, pero está comentado
              },
            ),
          ),
        ),
      );
}
