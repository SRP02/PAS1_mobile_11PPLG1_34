
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_34/Controller/FavoriteTeamController.dart';

class FavoriteTeamList extends StatelessWidget {
  final FavoriteTeamController favoriteTeamController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final favoriteTeams = favoriteTeamController.favoriteTeams;
      if (favoriteTeams.isEmpty) {
        return const Text("No favorite teams found");
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: favoriteTeams.length,
          itemBuilder: (context, index) {
            final team = favoriteTeams[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(team.name),
                  leading: Image.network(
                    team.image,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.sports_soccer);
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Hapus Favorit',
                        middleText: 'Apakah Anda yakin ingin menghapus tim ini dari favorit?',
                        onConfirm: () {
                          favoriteTeamController.removeFavorite(team);
                          Get.back(); // Tutup dialog
                        },
                        onCancel: () {
                          Get.back(); // Tutup dialog
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      }
    });
  }
}
