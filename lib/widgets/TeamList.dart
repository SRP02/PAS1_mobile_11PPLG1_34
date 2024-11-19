
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_34/Controller/FavoriteTeamController.dart';
import 'package:pas1_mobile_11pplg1_34/models/Team_models.dart';
import 'package:pas1_mobile_11pplg1_34/utils/apiSport.dart';

class TeamList extends StatefulWidget {
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  final FavoriteTeamController favoriteTeamController = Get.put(FavoriteTeamController());
  List<TeamModels> _filteredTeams = [];
  List<TeamModels> _allTeams = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<TeamModels>>(
            future: ApiService().fetchTeams(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No teams found"));
              } else {
                _allTeams = snapshot.data!;
                _filteredTeams = _filteredTeams.isEmpty ? _allTeams : _filteredTeams;
                return ListView.builder(
                  itemCount: _filteredTeams.length,
                  itemBuilder: (context, index) {
                    final team = _filteredTeams[index];

                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Obx(() {
                          final isFav = favoriteTeamController.isFavorite(team);
                          return ListTile(
                            title: Text(team.name),
                            leading: team.image.isNotEmpty
                                ? Image.network(
                                    team.image,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.sports_soccer);
                                    },
                                  )
                                : const Icon(Icons.sports_soccer),
                            trailing: IconButton(
                              icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                              onPressed: () {
                                // Show confirmation dialog for adding/removing favorite
                                Get.defaultDialog(
                                  title: isFav ? 'Hapus Favorit' : 'Tambah Favorit',
                                  middleText: isFav
                                      ? 'Apakah Anda yakin ingin menghapus tim ini dari favorit?'
                                      : 'Apakah Anda yakin ingin menambahkan tim ini ke favorit?',
                                  onConfirm: () {
                                    favoriteTeamController.toggleFavorite(team);
                                    Get.back(); // Tutup dialog
                                  },
                                  onCancel: () {
                                    Get.back(); // Tutup dialog
                                  },
                                );
                              },
                            ),
                            onTap: () {
                              Get.toNamed('/team-detail', arguments: team);
                            },
                          );
                        }),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
