// main.dart
import 'package:flutter/material.dart';
import 'agent_list_page.dart';
import 'map_list_page.dart';

void main() => runApp(ValorantWikiApp());

class ValorantWikiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Wiki',
      theme: ThemeData(
        primaryColor: Color(0xFFFA4454), // Ubah warna tema
      ),
      home: HomePage(),
      routes: {
        '/agents': (context) => AgentListPage(),
        '/maps': (context) => MapListPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Page',
          style: TextStyle(color: Colors.white), // Ubah warna teks judul AppBar menjadi putih
        ),
        centerTitle: true, // Pusatkan teks app bar
        backgroundColor: Theme.of(context).primaryColor, // Gunakan warna tema
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // Gunakan 80% lebar layar untuk tombol
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/agents');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor, // Ubah warna latar belakang tombol
                  padding: EdgeInsets.all(16.0), // Perbesar tombol
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Atur radius tombol
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white, // Ubah warna ikon menjadi putih
                      size: 40, // Atur ukuran ikon
                    ),
                    SizedBox(height: 8), // Spasi antara ikon dan teks
                    Text(
                      'Agents',
                      style: TextStyle(
                        color: Colors.white, // Ubah warna teks menjadi putih
                        fontSize: 16, // Atur ukuran teks
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Spasi antara tombol
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // Gunakan 80% lebar layar untuk tombol
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/maps');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor, // Ubah warna latar belakang tombol
                  padding: EdgeInsets.all(16.0), // Perbesar tombol
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Atur radius tombol
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.map,
                      color: Colors.white, // Ubah warna ikon menjadi putih
                      size: 40, // Atur ukuran ikon
                    ),
                    SizedBox(height: 8), // Spasi antara ikon dan teks
                    Text(
                      'Maps',
                      style: TextStyle(
                        color: Colors.white, // Ubah warna teks menjadi putih
                        fontSize: 16, // Atur ukuran teks
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
