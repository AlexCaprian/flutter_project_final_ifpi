import 'package:flutter/material.dart';
import 'package:google_maps/models/user.dart';
import 'package:google_maps/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  _form.currentState!.save();
                  Provider.of<Users>(context, listen: false).put(User(
                    id: _formData['id']!,
                    name: _formData['name']!,
                    email: _formData['email']!,
                    avatarUrl: _formData['avatarUrl']!,
                  ));
                  Navigator.of(context).pop();
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                    ),
                    onSaved: (value) => _formData['name'] = value!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      onSaved: (value) => _formData['email'] = value!),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'URL do Avatar',
                      ),
                      onSaved: (value) => _formData['avatarUrl'] = value!),
                ),
              ],
            ),
          ),
        ));
  }
}
