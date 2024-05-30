import 'package:flutter/material.dart';
import 'agent_model.dart';

class AgentDetailPage extends StatelessWidget {
  final Agent agent;

  AgentDetailPage({required this.agent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          agent.displayName,
          style: TextStyle(color: Colors.white), // Ubah warna teks judul AppBar menjadi putih
        ),
        backgroundColor: Color(0xFFFA4454), // Gunakan warna tema sebelumnya untuk AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(agent.fullPortrait),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      agent.displayName,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(agent.description),
                  SizedBox(height: 16),
                  Text(
                    'Role: ${agent.role}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Abilities:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Column(
                    children: agent.abilities.map((ability) {
                      return ListTile(
                        leading: ability.displayIcon.isNotEmpty
                            ? Image.network(ability.displayIcon) // Gunakan displayIcon untuk gambar
                            : null,
                        title: Text(ability.displayName),
                        subtitle: Text(ability.description),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
