import 'package:flutter/material.dart';
import 'package:google_maps/controllers/controller_lat_long.dart';
import 'package:provider/provider.dart';

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste'),
      ),
      body: ChangeNotifierProvider<Controller>(
        create: (context) => Controller(),
        child: Builder(builder: (context) {
          final local = context.watch<Controller>();

          String mensagem = local.erro == ''
              ? 'Latitude: ${local.lat} | Longitude: ${local.long}'
              : local.erro;
          return Center(child: Text(mensagem));
        }),
      ),
    );
  }
}
