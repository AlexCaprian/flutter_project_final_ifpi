import 'package:flutter/material.dart';
import 'package:google_maps/login/cadastro.dart';
import 'package:google_maps/login/login.dart';
import 'package:google_maps/screens/contatos.dart';
import 'package:google_maps/screens/mapa.dart';

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
                    padding: const EdgeInsets.all(10),
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
                        width: 140,
                        height: 140,
                        child:  const Center(
                          child: Text('Contatos')
                          ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
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
                        width: 140,
                        height: 140,
                        child:  const Center(
                          child: Text('Mapas')
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
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => const Login())
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 140,
                        child:  const Center(
                          child: Text('Extra')
                          ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => const Cadastro())
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 140,
                        child:  const Center(
                          child: Text('Extra')
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
