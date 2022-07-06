import 'package:flutter/material.dart';
import 'package:google_maps/components/user_tile.dart';
import 'package:google_maps/data/ifpi_users.dart';
import 'package:google_maps/provider/users.dart';
import 'package:google_maps/screens/cadastros.dart';
import 'package:provider/provider.dart';

class Contatos extends StatefulWidget {
  const Contatos({Key? key}) : super(key: key);

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  final users = {...IFPI_USERS};

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Contatos'), actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) =>  UserForm())
              );
            },
            icon: const Icon(Icons.add),
          ),
        ]),
        body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(user: users.all.elementAt(i)),
        ));
  }
}
