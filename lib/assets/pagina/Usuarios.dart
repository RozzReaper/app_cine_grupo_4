import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    home: Usuarios(),
  ));
}

class Usuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1), // Bright Turquoise
      appBar: AppBar(
        title: Text('Registrarse'),
        backgroundColor: Color.fromRGBO(255, 61, 61, 1), // Coral Red
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Completa el siguiente formulario para registrarte:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            RegistrationForm(),
          ],
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _cityController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  String _gender = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Nombre'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu nombre';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _idController,
            decoration: InputDecoration(labelText: 'Número de Identidad'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu número de identidad';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Correo Electrónico'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu correo electrónico';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _cityController,
            decoration: InputDecoration(labelText: 'Ciudad'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu ciudad';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(labelText: 'Edad'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu edad';
              } else if (int.tryParse(value) == null) {
                return 'Por favor ingresa un número válido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    if (_formKey.currentState!.validate()) {
                      DatabaseHelper dbHelper = DatabaseHelper();
                      int result = await dbHelper.insertRegistro({
                        'nombre': _nameController.text,
                        'numero_identidad': _idController.text,
                        'correo_electronico': _emailController.text,
                        'ciudad': _cityController.text,
                        'edad': int.parse(_ageController.text),
                        'genero': _gender,
                      });
                      print('Insert result: $result');  // Debugging line
                      if (result != 0) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registro exitoso')));
                        _clearForm();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al registrar')));
                      }
                    }
                  } catch (e) {
                    print('Error: $e');  // Debugging line
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ocurrió un error durante el registro')));
                  }
                },
                child: Text('Registrar'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _clearForm() {
    _nameController.clear();
    _idController.clear();
    _cityController.clear();
    _ageController.clear();
    _emailController.clear();
    setState(() {
      _gender = '';
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _cityController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

class DatabaseHelper {
  static late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cine_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Registro(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT,
            numero_identidad TEXT,
            correo_electronico TEXT,
            ciudad TEXT,
            edad INTEGER,
            genero TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertRegistro(Map<String, dynamic> registro) async {
    Database db = await database;
    return await db.insert('Registro', registro);
  }
}
