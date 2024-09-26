import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Page', // Título de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema principal de la aplicación
      ),
      home: Notificaciones(), // Página principal de la aplicación
    );
  }
}

// Página de notificaciones de películas
class Notificaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Próximos Estrenos'), // Título de la barra de navegación
        centerTitle: true, // Centrar el título en la barra de navegación
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0), // Espaciado alrededor de la lista
        children: [
          // Widget para mostrar una notificación de película
          MovieNotification(
            title: 'El especialista.', // Título de la película
            releaseDate: 'Fecha de estreno: 15 de mayo de 2024', // Fecha de estreno
            cinemas:
                'Cines: Multicinema Metro Mall, Cinemark Mall Multiplaza, Cinépolis Cascadas Mall', // Cines donde se proyecta
            cities: 'Ciudades:  Tegucigalpa, Ceiba, San pedro sula', // Ciudades donde se proyecta
            summary:
                'Sinopsis: Thriller de acción inspirado en la serie de televisión de los años 80 creada por Glen A. Larson. Después de dejar de lado su trabajo como doble de acción a causa de un accidente que casi acaba con su carrera, Colt Seavers (Ryan Gosling), decide centrarse en su salud física y mental. Pero Colt volverá a la andadas cuando le propongan participar en la nueva película que dirige su ex, Jody Moreno (Emily Blunt), que ruedan en un estricto secreto porque su protagonista, la estrella Tom Ryder (Aaron Taylor-Johnson), ha desaparecido', // Sinopsis de la película
            imageUrl:
                'https://http2.mlstatic.com/D_NQ_NP_901844-MLM44093932131_112020-O.webp', // URL de la imagen
          ),
          SizedBox(height: 16.0), // Espacio entre notificaciones
          // Widget para mostrar otra notificación de película
          MovieNotification(
            title: 'Misión hostil.', // Título de la película
            releaseDate: 'Fecha de estreno: 19 de abril de 2024', // Fecha de estreno
            cinemas:
                'Cines: Multicinema Metro Mall, Cinemark Mall Multiplaza, Cinépolis Cascadas Mall', // Cines donde se proyecta
            cities: 'Ciudades: Copan, Gacias Adios, Lempira', // Ciudades donde se proyecta
            summary:
                'Sinopsis: Cuando un equipo de los Delta Force (Destacamento de Fuerzas Especiales estadounidense) cae en una emboscada en territorio enemigo, el joven oficial Kinney (Liam Hemsworth) se niega a abandonarlos. Su única esperanza es un piloto de drones de las Fuerzas Aéreas al que llaman Reaper (Russell Crowe)', // Sinopsis de la película
            imageUrl:
                'https://image.tmdb.org/t/p/original/5RdqiHubsLtJizOw6FYGSba8hnJ.jpg', // URL de la imagen
          ),
          // Agrega más notificaciones de películas según sea necesario 
        ],
      ),
    );
  }
}

// Widget para mostrar una notificación de película
class MovieNotification extends StatelessWidget {
  final String title; // Título de la película
  final String releaseDate; // Fecha de estreno
  final String cinemas; // Cines donde se proyecta
  final String cities; // Ciudades donde se proyecta
  final String summary; // Sinopsis de la película
  final String imageUrl; // URL de la imagen

  const MovieNotification({
    required this.title,
    required this.releaseDate,
    required this.cinemas,
    required this.cities,
    required this.summary,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // Elevación de la tarjeta
      margin: EdgeInsets.symmetric(vertical: 10), // Margen vertical de la tarjeta
      child: Padding(
        padding: EdgeInsets.all(12.0), // Espaciado interno de la tarjeta
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la película
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5), // Espacio vertical
            // Fecha de estreno
            Text(
              releaseDate,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 5), // Espacio vertical
            // Cines donde se proyecta
            Text(
              cinemas,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 5), // Espacio vertical
            // Ciudades donde se proyecta
            Text(
              cities,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10), // Espacio vertical
            // Imagen de la película
            Image.network(
              imageUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10), // Espacio vertical
            // Sinopsis de la película
            Text(
              summary,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
