import 'package:flutter/material.dart';

class Cartelera extends StatefulWidget {
  @override
  _BillboardPageState createState() => _BillboardPageState();
}

class _BillboardPageState extends State<Cartelera> {
  String _selectedCine = 'Cines'; // Variable para almacenar el cine seleccionado en el dropdown

  final List<String> cines = [ // Lista de opciones de cines para el dropdown
    'Cines',
    'Multicinema Metro Mall',
    'Cinemark Mall Multiplaza',
    'Cinépolis Cascadas Mall',
    'Metrocinemas El Progreso',
    'Cine Premier',
  ]; 

  // Método para obtener las películas filtradas según el cine seleccionado
  List<Pelicula> getPeliculasFiltradas() {
    if (_selectedCine == 'Cines') {
      return peliculas;
    }
    return peliculas
        .where((pelicula) => pelicula.cines.contains(_selectedCine))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cartelera de Películas'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 61, 61, 1),
      ),
      body: Container(
        color: Color.fromRGBO(129, 66, 255, 1),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedCine,
              hint: Text('Selecciona un cine'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCine = newValue!;
                });
              },
              items: cines.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getPeliculasFiltradas().length,
                itemBuilder: (context, index) {
                  return PeliculaItem(pelicula: getPeliculasFiltradas()[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Clase que representa una película
class Pelicula {
  final String nombre; // Nombre de la película
  final String sinopsis; // Sinopsis de la película
  final Map<String, List<String>> horarios; // Horarios de la película
  final String genero; // Género de la película
  final String clasificacion; // Clasificación de la película
  final String imagenUrl; // URL de la imagen de la película
  final String idioma; // Idioma de la película
  final List<String> cines; // Cines donde se proyecta la película

  // Constructor de la película
  Pelicula({
    required this.nombre,
    required this.sinopsis,
    required this.horarios,
    required this.genero,
    required this.clasificacion,
    required this.imagenUrl,
    required this.idioma,
    required this.cines,
  });
}

// Widget que muestra los detalles de una película
class PeliculaItem extends StatelessWidget {
  final Pelicula pelicula; // Película a mostrar

  const PeliculaItem({required this.pelicula});

@override
  Widget build(BuildContext context) {
  return Card(
    margin: EdgeInsets.only(bottom: 16.0),
    child: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FullScreenImage(imageUrl: pelicula.imagenUrl)),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                bottomLeft: Radius.circular(4.0),
              ),
              child: AspectRatio(
                aspectRatio: 2 / 3, // Proporción típica de un póster de película
                child: Image.network(
                  pelicula.imagenUrl,
                  fit: BoxFit.cover,
                  width: 100, // Ancho fijo para la imagen
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pelicula.nombre,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(pelicula.sinopsis, maxLines: 2, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 4),
                  Text('Idioma: ${pelicula.idioma}'),
                  SizedBox(height: 4),
                  Text('Género: ${pelicula.genero}'),
                  SizedBox(height: 4),
                  Text('Clasificación: ${pelicula.clasificacion}'),
                  // ... Puedes agregar más detalles aquí si lo deseas
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}

// Widget que muestra una imagen en pantalla completa
class FullScreenImage extends StatelessWidget {
  final String imageUrl; // URL de la imagen

  const FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            imageUrl, // URL de la imagen
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
// Lista de peliculas las cuales agregaras mas
final List<Pelicula> peliculas = [
  Pelicula(
    nombre: 'Mi villano favorito 4 Dob',
    sinopsis:
        'Gru, Lucy, Margo, Edith y Agnes dan la bienvenida a un nuevo miembro a la familia, Gru Jr., que tiene la intención de atormentar a su padre. Gru se enfrenta a un nuevo enemigo: Maxime Le Mal y su novia Valentina, y la familia se ve obligada a huir.',
    horarios: {
      "Lunes": ["10:00", "12:00", "16:00", "19:00"],
      "Martes": ["11:00", "13:00", "17:00", "20:00"],
      "Miércoles": ["10:30", "14:30", "18:30", "21:30"],
      "Jueves": ["09:00", "12:30", "15:30", "19:30"],
      "Viernes": ["10:45", "13:45", "17:45", "20:45"],
      "Sábado": ["08:30", "11:30", "14:30", "18:30"],
      "Domingo": ["09:45", "12:45", "15:45", "19:45"]
    },
    genero: 'Comedia, Animado, Aventura',
    clasificacion: 'Todo Público',
    imagenUrl:
        'https://assets.biggerpicture.ai/assets/HO-1600/eventmaster/631_4.png',
    idioma: 'Español',
    cines: [
      'Multicinema Metro Mall',
      'Cinépolis Cascadas Mall',
      'Cinemark'
    ],
  ),
  Pelicula(
    nombre: 'Intensa Mente 2',
    sinopsis:
        'Secuela de ‘Intensa mente (Inside Out)’ (2015), presentará nuevas emociones y seguirá a Riley siendo ya una adolescente.',
    horarios: {
      "Lunes": ["09:00", "11:00", "13:00", "15:00"],
      "Martes": ["10:00", "12:00", "14:00", "16:00"],
      "Miércoles": ["11:30", "13:30", "15:30", "17:30"],
      "Jueves": ["10:30", "12:30", "14:30", "16:30"],
      "Viernes": ["09:45", "11:45", "13:45", "15:45"],
      "Sábado": ["10:15", "12:15", "14:15", "16:15"],
      "Domingo": ["11:00", "13:00", "15:00", "17:00"]
    },
    genero: 'Comedia, Niños, Animado',
    clasificacion: 'Todo Público',
    imagenUrl:
        'https://assets.biggerpicture.ai/assets/HO-1600/eventmaster/577_4.png',
    idioma: 'Inglés',
    cines: [
      'Multicinema Metro Mall',
      'Cinemark',
      'Cinemark Mall Multiplaza',
      'Cinépolis Cascadas Mall'
    ],
  ),
  Pelicula(
    nombre: 'Deadpool & Wolverine',
    sinopsis:
        'Tercera entrega de la saga «Deadpool», ahora integrada en el Universo Cinematográfico de Marvel (MCU) pero manteniendo su enfoque para adultos, con calificación R. En septiembre de 2022 se confirmó la aparición de Hugh Jackman como Wolverine, por primera vez desde «Logan».',
    horarios: {
      "Lunes": ["08:30", "10:30", "12:30", "14:30"],
      "Martes": ["09:30", "11:30", "13:30", "15:30"],
      "Miércoles": ["08:45", "10:45", "12:45", "14:45"],
      "Jueves": ["09:45", "11:45", "13:45", "15:45"],
      "Viernes": ["08:15", "10:15", "12:15", "14:15"],
      "Sábado": ["09:15", "11:15", "13:15", "15:15"],
      "Domingo": ["08:45", "10:45", "12:45", "14:45"]
    },
    genero: 'Acción, Comedia',
    clasificacion: 'Adultos',
    imagenUrl:
        'https://assets.biggerpicture.ai/assets/HO-1600/eventmaster/690_4.png',
    idioma: 'Español',
    cines: [
      'Multicinema Metro Mall',
      'Cinépolis Cascadas Mall'
    ],
  ),
  Pelicula(
    nombre: 'Un lugar en silencio: Día uno',
    sinopsis:
        'Ambientada en Nueva York, en el primer día de la invasión alienígena, una mujer debe abrirse camino a través de una ciudad dominada por el miedo con la ayuda de un grupo desigual de supervivientes.',
    horarios: {
      "Lunes": ["08:00", "10:00", "12:00", "14:00"],
      "Martes": ["09:00", "11:00", "13:00", "15:00"],
      "Miércoles": ["08:30", "10:30", "12:30", "14:30"],
      "Jueves": ["09:30", "11:30", "13:30", "15:30"],
      "Viernes": ["08:15", "10:15", "12:15", "14:15"],
      "Sábado": ["09:15", "11:15", "13:15", "15:15"],
      "Domingo": ["08:45", "10:45", "12:45", "14:45"]
    },
    genero: 'Drama, Suspenso, Thriller',
    clasificacion: 'Mayores de 13 años',
    imagenUrl:
        'https://assets.biggerpicture.ai/assets/HO-1600/eventmaster/641_4.png',
    idioma: 'Español',
    cines: [
      'Multicinema Metro Mall',
      'Cinépolis Cascadas Mall',
      'Cinemark'
    ],
  ),
    Pelicula(
    nombre: 'Blue Lock: Episodio Nagi',
    sinopsis:
        '«Qué fastidio». Esa era la frase favorita de Nagi Seishiro, estudiante de segundo año de preparatoria, en su día a día. Eso fue hasta que Mikage Reo, un compañero que soñaba con ganar la Copa del Mundo, descubrió la habilidad oculta de Nagi y lo animó a jugar fútbol y a compartir su extraordinario talento. Un día recibe una invitación para el misterioso Proyecto BLUE LOCK. Allí se encuentra con los mejores delanteros del país. El sueño de Nagi de convertirse en el mejor junto a Reo, llevará a este prodigio a un mundo que jamás conoció. Un prodigio sólo puede forjarse cuando alguien lo descubre…. ahora, el increíble talento y la personalidad del delantero Nagi Seishiro harán arder el mundo del fútbol.',
    horarios: {
      "Lunes": ["08:00", "10:00", "12:00", "14:00"],
      "Martes": ["09:00", "11:00", "13:00", "15:00"],
      "Miércoles": ["08:30", "10:30", "12:30", "14:30"],
      "Jueves": ["09:30", "11:30", "13:30", "15:30"],
      "Viernes": ["08:15", "10:15", "12:15", "14:15"],
      "Sábado": ["09:15", "11:15", "13:15", "15:15"],
      "Domingo": ["08:45", "10:45", "12:45", "14:45"]
    },
    genero: 'Animado',
    clasificacion: 'Mayores de 7 años',
    imagenUrl:
        'https://assets.biggerpicture.ai/assets/HO-1600/eventmaster/694_4.png',
    idioma: 'Español',
    cines: [
      'Multicinema Metro Mall',
      'Cinépolis Cascadas Mall',
      'Cinemark'
    ],
  ),
      Pelicula(
    nombre: 'Tornados',
    sinopsis:
        'Edgar-Jones interpreta a Kate Cooper, una ex cazadora de tormentas perseguida por un devastador encuentro con un tornado durante sus años universitarios, que ahora estudio los patrones de tormentas en las pantallas de forma segura en la ciudad de Nueva York. Su amigo Javi la atrae de regreso a las llanuras abiertas para probar un nuevo e innovador sistema de seguimiento. Allí, se cruza con Tyler Owens (Powell), la encantadora e imprudente superestrella de las redes sociales que disfruta publicando sus aventuras, persiguiendo tormentas su estridente equipo, cuanto más peligroso, mejor. ',
    horarios: {
      "Lunes": ["08:00", "10:00", "12:00", "14:00"],
      "Martes": ["09:00", "11:00", "13:00", "15:00"],
      "Miércoles": ["08:30", "10:30", "12:30", "14:30"],
      "Jueves": ["09:30", "11:30", "13:30", "15:30"],
      "Viernes": ["08:15", "10:15", "12:15", "14:15"],
      "Sábado": ["09:15", "11:15", "13:15", "15:15"],
      "Domingo": ["08:45", "10:45", "12:45", "14:45"]
    },
    genero: 'Drama, Aventura, Thriller',
    clasificacion: 'Mayores de 10 años',
    imagenUrl:
        'https://assets.biggerpicture.ai/assets/HO-1600/eventmaster/669_4.png',
    idioma: 'Español',
    cines: [
      'Multicinema Metro Mall',
      'Cinépolis Cascadas Mall',
      'Cinemark'
    ],
  ),
];

void main() {
  runApp(MaterialApp(
    home: Cartelera(),
  ));
}