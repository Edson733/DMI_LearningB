import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Column( //SingleChildScrollView
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  child: Text('EP'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    Text(
                      'Edson Miguel Peralta Valdez',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ), 
                    Text(
                      'Hace 10 minutos',
                      style: TextStyle(fontSize: 12, color: Colors.black54)
                    )
                  ]
                ),
                Spacer(),
                Icon(Icons.more_vert)
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () async => await FirebaseAuth.instance.signOut(), 
              child: const Text('Cerrar Sesión')
            ),
          )
          // Image.asset('cohete2.png', width: double.infinity, height: 400),
          // const Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Row(
          //     children: [
          //       Icon(Icons.favorite, color: Colors.red),
          //       Icon(Icons.message),
          //       Icon(Icons.ios_share),
          //       Spacer(),
          //       Icon(Icons.save_alt),
          //     ],
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Text('Datos del usuario'),
          // ),
          // const Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Text('Datos del usuario'),
          // ),
          // const Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Text('Datos del usuario'),
          // ),
        ],
      )
    );
  }
}