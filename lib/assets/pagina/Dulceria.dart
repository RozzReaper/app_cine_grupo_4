import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Definición de la clase Combo
class Combo {
  final String nombre;
  final String descripcion;
  final double precio;
  final String imagen;
  int cantidad; // Se agrega la cantidad a la clase Combo

  Combo({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imagen,
    this.cantidad = 0, // Se asigna un valor por defecto a la cantidad
  });
}

// Widget para mostrar un ítem de combo
class ComboItem extends StatefulWidget {
  final Combo combo;
  final Function(int) onQuantityChanged; // Función para actualizar la cantidad

  ComboItem({required this.combo, required this.onQuantityChanged});

  @override
  _ComboItemState createState() => _ComboItemState();
}

class _ComboItemState extends State<ComboItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(widget.combo.imagen),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.combo.nombre,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.combo.descripcion,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'L. ${widget.combo.precio.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (widget.combo.cantidad > 0) {
                            widget.combo.cantidad--;
                            widget.onQuantityChanged(widget.combo.cantidad);
                          }
                        });
                      },
                    ),
                    Text(widget.combo.cantidad.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          widget.combo.cantidad++;
                          widget.onQuantityChanged(widget.combo.cantidad);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Página principal de la aplicación
class Dulceria extends StatefulWidget {
  @override
  _CandyPageState createState() => _CandyPageState();
}

class _CandyPageState extends State<Dulceria> {
  final List<Combo> combos = [
    // Lista de combos predefinidos
    Combo(
      nombre: 'Combo Personal 1',
      descripcion: 'Incluye palomitas, Refresco, Hotdog y Chocolate KitKat',
      precio: 150.0,
      imagen:
          'https://iili.io/dnhHXtf.jpg',
    ),
    Combo(
      nombre: 'Combo Normal 2',
      descripcion: 'Incluye nachos y refresco',
      precio: 120.0,
      imagen:
          'https://cuponassets.cuponatic-latam.com/backendMx/uploads/imagenes_descuentos/103913/6f86a091b0028c31a012a139722ab48e471973b2.XL2.jpg',
    ),
    Combo(
      nombre: 'Combo Normal 3',
      descripcion: 'Incluye hot dog y refresco',
      precio: 100.0,
      imagen:
          'https://cuponassets.cuponatic-latam.com/backendMx/uploads/imagenes_descuentos/104123/bff1ae501dca170a3fd64e0cc86d7cdeb6958959.XL2.jpg',
    ),
  ];

  double get totalPrice {
    double total = 0.0;
    for (var combo in combos) {
      total += combo.precio * combo.cantidad;
    }
    return total;
  }

  bool get canPay {
    for (var combo in combos) {
      if (combo.cantidad > 0) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú de Dulcería'),
        backgroundColor: Color.fromRGBO(255, 61, 61, 1), // Coral Red
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromRGBO(129, 66, 255, 1), // Electric Violet
        child: ListView.builder(
          itemCount: combos.length,
          itemBuilder: (context, index) {
            return ComboItem(
              combo: combos[index],
              onQuantityChanged: (quantity) {
                setState(() {});
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: canPay ? () => _showPaymentDialog(context) : null,
          child: Text('Pagar'),
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _PaymentDialog(totalPrice: totalPrice);
      },
    );
  }
}

class _PaymentDialog extends StatefulWidget {
  final double totalPrice;

  _PaymentDialog({required this.totalPrice});

  @override
  __PaymentDialogState createState() => __PaymentDialogState();
}

class __PaymentDialogState extends State<_PaymentDialog> {
  String cardNumber = '';
  String expiryDate = '';
  String cvv = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Realizar Pago'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {
              cardNumber = value;
            },
            decoration: InputDecoration(labelText: 'Número de Tarjeta'),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {
              expiryDate = value;
            },
            decoration: InputDecoration(labelText: 'Fecha de Expiración'),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {
              cvv = value;
            },
            decoration: InputDecoration(labelText: 'CVV'),
          ),
          SizedBox(height: 20),
          Text(
            'Total a Pagar: L. ${widget.totalPrice.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (cardNumber.isEmpty || expiryDate.isEmpty || cvv.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Por favor, complete todos los campos')),
              );
            } else {
              _showPaymentConfirmation(context);
            }
          },
          child: Text('Pagar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
      ],
    );
  }

  void _showPaymentConfirmation(BuildContext context) {
    Navigator.of(context).pop(); // Cerrar el diálogo de pago
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pago Exitoso'),
          content: Text('¡Su pago ha sido realizado exitosamente!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

// Función principal para ejecutar la aplicación
void main() {
  runApp(MaterialApp(
    home: Dulceria(), // Página principal de la aplicación
  ));
}
