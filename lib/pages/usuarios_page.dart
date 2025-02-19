import 'package:flutter/material.dart';

import '../models/user.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    User(
        online: true,
        name: 'Maria',
        email: 'usuarioprueba1@gmail.com',
        uid: '1'),
    User(
        online: true,
        name: 'Jose',
        email: 'usuarioprueba2@gmail.com',
        uid: '2'),
    User(
        online: false,
        name: 'Luis',
        email: 'usuarioprueba3@gmail.com',
        uid: '3')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios', style: TextStyle(color: Colors.black87)),
        elevation: 3,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app, color: Colors.black87),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (_, i) => _userListTitle(usuarios[i]),
        separatorBuilder: (_, i) => const Divider(),
        itemCount: usuarios.length,
      ),
    );
  }

  ListTile _userListTitle(User user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email, style: const TextStyle(color: Colors.black54)),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(user.name.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
