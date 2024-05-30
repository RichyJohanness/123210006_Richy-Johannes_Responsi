import 'package:flutter/material.dart';
import 'api_service.dart';
import 'agent_model.dart';
import 'agent_detail_page.dart';

class AgentListPage extends StatefulWidget {
  @override
  _AgentListPageState createState() => _AgentListPageState();
}

class _AgentListPageState extends State<AgentListPage> {
  late Future<List<Agent>> futureAgents;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    futureAgents = ApiService().getAgents();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agents',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFFA4454),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: AgentSearchDelegate(futureAgents),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Agent>>(
        future: futureAgents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Agent agent = snapshot.data![index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.network(agent.displayIcon),
                    title: Text(agent.displayName),
                    subtitle: Text(agent.role),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgentDetailPage(agent: agent),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load agents'));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class AgentSearchDelegate extends SearchDelegate<List<Agent>> {
  final Future<List<Agent>> futureAgents;

  AgentSearchDelegate(this.futureAgents);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }


  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results view here
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your search suggestions view here
    return Container();
  }
}
