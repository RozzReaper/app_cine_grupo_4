
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Taquilla(),
  ));
}

class Taquilla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema Booking',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(233, 68, 131, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color.fromRGBO(61, 239, 245, 1),
        ),
      ),
      home: CinemaHomePage(),
    );
  }
}

class CinemaHomePage extends StatefulWidget {
  @override
  _CinemaHomePageState createState() => _CinemaHomePageState();
}

class _CinemaHomePageState extends State<CinemaHomePage> {
  double totalAmount = 0.0;
  Map<int, List<String>> selectedSeatsByHall = {};
  Map<int, List<bool>> seatConfigByHall = {};
  Map<int, double> priceByHall = {
    1: 90,
    2: 100,
    3: 120,
    4: 85,
    5: 110,
    6: 95,
  };

  void toggleSeat(int hallNumber, String seat) {
    setState(() {
      if (selectedSeatsByHall[hallNumber] == null) {
        selectedSeatsByHall[hallNumber] = [];
      }
      double price = priceByHall[hallNumber] ?? 0;

      if (selectedSeatsByHall[hallNumber]!.contains(seat)) {
        selectedSeatsByHall[hallNumber]!.remove(seat);
        totalAmount -= price;
      } else {
        selectedSeatsByHall[hallNumber]!.add(seat);
        totalAmount += price;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sección compra de Tickets'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Seleccione el asiento',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LegendItem(
                      color: Color.fromRGBO(61, 152, 255, 1),
                      label: 'Asiento disponible'),
                  SizedBox(width: 10),
                  LegendItem(
                      color: Color.fromRGBO(255, 61, 61, 1),
                      label: 'Asiento no disponible'),
                  SizedBox(width: 10),
                  LegendItem(color: Colors.orange, label: 'Su selección'),
                ],
              ),
              SizedBox(height: 20),
              CinemaHall(
                hallNumber: 1,
                movieTitle: 'Mi villano favorito 4 Dob',
                price: priceByHall[1]!,
                duration: 104,
                onSeatToggled: (seat) => toggleSeat(1, seat),
                seatConfig: _getSeatConfig(),
                selectedSeats: selectedSeatsByHall[1] ?? [],
              ),
              CinemaHall(
                hallNumber: 2,
                movieTitle: 'Intensa Mente 2',
                price: priceByHall[2]!,
                duration: 110,
                onSeatToggled: (seat) => toggleSeat(2, seat),
                seatConfig: _getSeatConfig(),
                selectedSeats: selectedSeatsByHall[2] ?? [],
              ),
              CinemaHall(
                hallNumber: 3,
                movieTitle: 'Deadpool & Wolverine',
                price: priceByHall[3]!,
                duration: 115,
                onSeatToggled: (seat) => toggleSeat(3, seat),
                seatConfig: _getSeatConfig(),
                selectedSeats: selectedSeatsByHall[3] ?? [],
              ),
              CinemaHall(
                hallNumber: 4,
                movieTitle: 'Un lugar en silencio: Día uno',
                price: priceByHall[4]!,
                duration: 95,
                onSeatToggled: (seat) => toggleSeat(4, seat),
                seatConfig: _getSeatConfig(),
                selectedSeats: selectedSeatsByHall[4] ?? [],
              ),
              CinemaHall(
                hallNumber: 5,
                movieTitle: 'Blue Lock: Episodio Nagi',
                price: priceByHall[5]!,
                duration: 130,
                onSeatToggled: (seat) => toggleSeat(5, seat),
                seatConfig: _getSeatConfig(),
                selectedSeats: selectedSeatsByHall[5] ?? [],
              ),
              CinemaHall(
                hallNumber: 6,
                movieTitle: 'Tornados',
                price: priceByHall[6]!,
                duration: 105,
                onSeatToggled: (seat) => toggleSeat(6, seat),
                seatConfig: _getSeatConfig(),
                selectedSeats: selectedSeatsByHall[6] ?? [],
              ),
              SizedBox(height: 20),
              Text(
                'Total Amount: L. $totalAmount',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Taquilla(),
                    ),
                  );
                },
                child: Text('Buy Tickets'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  List<List<bool>> _getSeatConfig() {
    return [
      [false, false, false, true, false, false, true, true, true, true],
      [true, true, true, true, true, true, true, true, true, true],
      [true, true, true, false, true, true, true, true, true, true],
      [true, true, true, true, true, false, true, true, true, true],
      [false, false, false, false, false, false, true, false, true, true],
      [false, true, true, false, true, true, false, true, true, true],
      [false, true, true, true, true, true, true, true, true, false],
      [false, true, true, true, true, true, true, true, true, true],
      [false, true, false, true, false, true, true, true, true, false],
    ];
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}

class CinemaHall extends StatelessWidget {
  final int hallNumber;
  final String movieTitle;
  final double price;
  final int duration;
  final Function(String) onSeatToggled;
  final List<List<bool>> seatConfig;
  final List<String> selectedSeats;

  CinemaHall({
    required this.hallNumber,
    required this.movieTitle,
    required this.price,
    required this.duration,
    required this.onSeatToggled,
    required this.seatConfig,
    required this.selectedSeats,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sala $hallNumber: $movieTitle',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('Precio: L. $price'),
        SizedBox(height: 5),
        Text('Duración: $duration min'),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Column(
                children: List.generate(seatConfig.length, (index) {
                  return Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(4.0),
                    child: Center(
                      child: Text(
                        String.fromCharCode(65 + index),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                }),
              ),
              Expanded(
                child: Column(
                  children: seatConfig.asMap().entries.map((entry) {
                    int rowIndex = entry.key;
                    List<bool> row = entry.value;

                    return Row(
                      children: row.asMap().entries.map((seatEntry) {
                        int colIndex = seatEntry.key;
                        bool isBooked = seatEntry.value;
                        String seatLabel =
                            '${String.fromCharCode(65 + rowIndex)}${colIndex + 1}';
                        bool isSelected = selectedSeats.contains(seatLabel);

                        return GestureDetector(
                          onTap: () {
                            if (!isBooked) {
                              onSeatToggled(seatLabel);
                            }
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: isBooked
                                  ? Colors.red
                                  : isSelected
                                      ? Colors.orange
                                      : Color.fromRGBO(61, 152, 255, 1),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Center(
                              child: Text(
                                '${colIndex + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}