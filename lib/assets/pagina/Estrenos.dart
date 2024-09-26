import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Estrenos extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Estrenos'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(129, 66, 255, 1),
          titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
        ),
        body: Container(
          color: Color.fromRGBO(61, 152, 255, 1),
          padding: EdgeInsets.all(16.0),
          child: ListView(children: [
            Card( elevation: 4, color: Color.fromRGBO(255, 255, 255, 1),
              child: Padding( padding: EdgeInsets.all(16.0),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Imagen de la película
                        Container(width: 100, height: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image:
                                  NetworkImage('https://iili.io/dnhQhs1.png'), fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Título de la película
                              Text('Alien: Romulus', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                              SizedBox(height: 8),
                              // Género de la película
                              Row(
                                children: [
                                  Text('Género: ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('Acción, Suspenso, Ciencia ficción',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Clasificación de edad de la película
                              Row(
                                children: [
                                  Text('Clasificacion: ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('TBC',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Fecha de estreno de la película
                              Row(
                                children: [
                                  Text('Fecha de Estreno: ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('15/08/2024',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Sinopsis de la película
                              Text('Sinopsis: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('Mientras rebuscan en las profundidades de una estación espacial abandonada, un grupo de jóvenes colonizadores del espacio se encuentra cara a cara con la forma de vida más aterradora del universo. Nueva película de la saga Alien.',
                                style: TextStyle(fontSize: 14),softWrap: true,),
                              ElevatedButton(child: const Text("Ver Trailer"), onPressed: () {const url = 'https://www.youtube.com/watch?v=THjwI5pKNZU'; launch(url);},),
                              SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text('Cines en Tegucigalpa',style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    Text('Cinepolis \nMegamall',style: TextStyle(fontSize: 14),),
                    SizedBox(height: 16), // Espaciado entre elementos
                  ],
                ),
              ),
            ),SizedBox(height: 16),

            Card( elevation: 4, color: Color.fromRGBO(255, 255, 255, 1),
              child: Padding( padding: EdgeInsets.all(16.0),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Imagen de la película
                        Container(width: 100, height: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image:
                                  NetworkImage('https://iili.io/dnhZv4e.png'), fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Título de la película
                              Text('Borderlands', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                              SizedBox(height: 8),
                              // Género de la película
                              Row(
                                children: [
                                  Text('Género: ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('Acción, Comedia, Ciencia ficción',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Clasificación de edad de la película
                              Row(
                                children: [
                                  Text('Clasificacion: ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('TBC',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Fecha de estreno de la película
                              Row(
                                children: [
                                  Text('Fecha de Estreno: ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('08/08/2024',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Sinopsis de la película
                              Text('Sinopsis: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('Lilith (Cate Blanchett), una infame cazatesoros con un misterioso pasado, regresa a su planeta natal de Pandora para encontrar a la hija desaparecida del poderoso Atlas (Edgar Ramirez). Para ello forma una alianza inesperada con un heterogéneo equipo de inadaptados: Roland (Kevin Hart), un antiguo mercenario de élite ahora desesperado por la redención; Tiny Tina (Arianna Greenblatt), una demolicionista salvaje preadolescente; Krieg (Florian Munteanu), el musculoso protector de Tina; la científica Tannis (Jamie-Lee Curtis); y Claptrap (Jack Black), un robot muy peculiar. Estos extraños héroes deberán luchar contra monstruos alienígenas y peligrosos bandidos para buscar y proteger a la niña desaparecida, que puede tener la clave de un poder inimaginable. El destino del universo podría estar en sus manos, pero lucharán por algo más: el uno por el otro.',
                                style: TextStyle(fontSize: 14),softWrap: true,),
                              ElevatedButton(child: const Text("Ver Trailer"), onPressed: () {const url = 'https://www.youtube.com/watch?v=Zusyjsct4WA'; launch(url);},),
                              SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text('Cines en Tegucigalpa',style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    Text('Cinepolis \nMegamall',style: TextStyle(fontSize: 14),),
                    SizedBox(height: 16), // Espaciado entre elementos
                  ],
                ),
              ),
            ),SizedBox(height: 16),

            Card( elevation: 4, color: Color.fromRGBO(255, 255, 255, 1),
              child: Padding( padding: EdgeInsets.all(16.0),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Imagen de la película
                        Container(width: 100, height: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image:
                                  NetworkImage('https://iili.io/dnhZiZB.png'), fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Título de la película
                              Text('Carnada', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                              SizedBox(height: 8),
                              // Género de la película
                              Row(
                                children: [
                                  Text('Género: ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('Suspenso, Thriller',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Clasificación de edad de la película
                              Row(
                                children: [
                                  Text('Clasificacion: ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('TBC',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Fecha de estreno de la película
                              Row(
                                children: [
                                  Text('Fecha de Estreno: ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('22/08/2024',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Sinopsis de la película
                              Text('Sinopsis: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('Sigue a un grupo de cinco novias que deben luchar por sus vidas en aguas abiertas después de que una boda de ensueño se transforme en una pesadilla.',
                                style: TextStyle(fontSize: 14),softWrap: true,),
                              ElevatedButton(child: const Text("Ver Trailer"), onPressed: () {const url = 'https://www.youtube.com/watch?v=sp_sDi-3dIs'; launch(url);},),
                              SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text('Cines en Tegucigalpa',style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    Text('Cinepolis \nMegamall',style: TextStyle(fontSize: 14),),
                    SizedBox(height: 16), // Espaciado entre elementos
                  ],
                ),
              ),
            ),SizedBox(height: 16),

            Card( elevation: 4, color: Color.fromRGBO(255, 255, 255, 1),
              child: Padding( padding: EdgeInsets.all(16.0),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Imagen de la película
                        Container(width: 100, height: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image:
                                  NetworkImage('https://iili.io/dnhQZ7f.png'), fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Título de la película
                              Text('Coraline 15 Aniversario', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                              SizedBox(height: 8),
                              // Género de la película
                              Row(
                                children: [
                                  Text('Género: ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('Animado',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Clasificación de edad de la película
                              Row(
                                children: [
                                  Text('Clasificacion: ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('TBC',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Fecha de estreno de la película
                              Row(
                                children: [
                                  Text('Fecha de Estreno: ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('15/08/2024',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Sinopsis de la película
                              Text('Sinopsis: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('Este agosto, celebra el 15 aniversario de la aclamada épica en stop-motion que ha encantado a fans de todo el mundo desde su estreno en 2009. Combinando las imaginaciones visionarias del célebre autor Neil Gaiman (Sandman) y el innovador estudio de cine LAIKA (Kubo y las dos cuerdas, ParaNorman, la próxima Wildwood), Coraline es una aventura maravillosa y emocionante, divertida y suspense para jóvenes y adultos por igual. Una joven atraviesa una puerta secreta en su nuevo hogar y descubre una versión alterna de su vida. En la superficie, esta realidad paralela es sorprendentemente similar a su vida real, pero mucho mejor. Sin embargo, cuando esta maravillosa y extraña aventura se vuelve peligrosa y sus padres falsos intentan retenerla para siempre, Coraline debe contar con su ingenio, determinación y valentía para salvar a su familia y regresar a casa',
                                style: TextStyle(fontSize: 14),softWrap: true,),
                              ElevatedButton(child: const Text("Ver Trailer"), onPressed: () {const url = 'https://www.youtube.com/watch?v=KL39jdkmNF4'; launch(url);},),
                              SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text('Cines en Tegucigalpa',style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    Text('Cinepolis \nMegamall',style: TextStyle(fontSize: 14),),
                    SizedBox(height: 16), // Espaciado entre elementos
                  ],
                ),
              ),
            ),SizedBox(height: 16),

            Card( elevation: 4, color: Color.fromRGBO(255, 255, 255, 1),
              child: Padding( padding: EdgeInsets.all(16.0),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Imagen de la película
                        Container(width: 100, height: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image:
                                  NetworkImage('https://iili.io/dnhZxB1.png'), fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Título de la película
                              Text('Criaturas Asombrosas', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                              SizedBox(height: 8),
                              // Género de la película
                              Row(
                                children: [
                                  Text('Género: ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Clasificación de edad de la película
                              Row(
                                children: [
                                  Text('Clasificacion: ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('+13',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Fecha de estreno de la película
                              Row(
                                children: [
                                  Text('Fecha de Estreno: ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  Text('01/08/2024',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Sinopsis de la película
                              Text('Sinopsis: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('En un mundo azotado por una ola de mutaciones que transforman gradualmente a algunos humanos en animales, François hace todo lo posible por salvar a su esposa, afectada por esta misteriosa enfermedad. Mientras la sociedad se ve abocada a un nuevo orden, iniciará junto a Émile, su hijo de 16 años, una búsqueda que los cambiará para siempre.',
                                style: TextStyle(fontSize: 14),softWrap: true,),
                              ElevatedButton(child: const Text("Ver Trailer"), onPressed: () {const url = 'https://www.youtube.com/watch?v=YpXMGFoy3v8'; launch(url);},),
                              SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text('Cines en Tegucigalpa',style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    Text('Cinepolis \nMegamall',style: TextStyle(fontSize: 14),),
                    SizedBox(height: 16), // Espaciado entre elementos
                  ],
                ),
              ),
            ),SizedBox(height: 16),
          ]),
        ),
      );
}