
import 'package:flutter/material.dart';

import '../pages/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  
  'usuarios' :  (_) => const UsuariosPage(),
  'chat' :  (_) => const ChatPage(),  
  'login' :  (_) => const LoginPage(),
  'register': (_)=> const RegisterPage(),
  'loading': (_) => const LoadingPage()

};