import 'package:flutter/material.dart';
import 'package:google_maps/screens/cadastros.dart';
import 'package:google_maps/screens/contatos.dart';
import 'package:google_maps/screens/mapa.dart';
import 'package:google_maps/screens/teste.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de Contatos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          width: double.maxFinite,
          child: Column(
            children: [
              Image.asset('assets/img/ifpi_logo.jpg'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => const Contatos())
                        );
                      },
                      child: Container(
                        color: Colors.green,
                        width: 170,
                        height: 140,
                        child:  const Center(
                          child: Text('Contatos',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 28,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => const MapSample())
                        );
                      },
                      child: Container(
                        color: Colors.green,
                        width: 170,
                        height: 140,
                        child:  const Center(
                          child: Text('Mapas',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 28,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => UserForm())
                        );
                      },
                      child: Container(
                        width: 170,
                        height: 140,
                        child:   const Center(
                          child: Text('Extra',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 28,
                          ),
                          )
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => const Teste())
                        );
                      },
                      child: Container(
                        width: 170,
                        height: 140,
                        child:  const Center(
                          child: Text('Localização',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 28,
                          ),
                          ),
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ),
      ),
    );
  }
}
