import 'package:flutter/material.dart';
import 'package:google_maps/models/user.dart';
import 'package:google_maps/provider/users.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == '' || user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                color: Colors.blue,
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                              title: const Text('Excluir Usuário'),
                              content: const Text('Tem Certeza?'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Provider.of<Users>(context, listen: false)
                                          .remove(user);
                                          Navigator.of(context).pop;
                                    },
                                    child: const Text('Sim'))
                              ]));
                },
                color: Colors.red,
                icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
