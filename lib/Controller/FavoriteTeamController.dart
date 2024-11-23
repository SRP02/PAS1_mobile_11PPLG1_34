import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_34/helpers/DatabaseHelper.dart';
import 'package:pas1_mobile_11pplg1_34/models/Local%20Databases/FavoriteTeam_models.dart';
import 'package:pas1_mobile_11pplg1_34/models/Team_models.dart';

class FavoriteTeamController extends GetxController {
  var favoriteTeams = <FavoriteteamModels>[].obs;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  // Load tim favorit dari database
  Future<void> loadFavorites() async {
    favoriteTeams.value = await _dbHelper.getFavorites();
  }

  // Cek apakah tim sudah ada di favorit
  bool isFavorite(TeamModels team) {
    return favoriteTeams.any((favTeam) => favTeam.id == team.id);
  }

  // Tambah atau hapus tim dari favorit
void toggleFavorite(dynamic team) async {
  if (team is TeamModels) {
    if (isFavorite(team)) {
      await _dbHelper.deleteFavorite(int.parse(team.id));
      favoriteTeams.removeWhere((favTeam) => favTeam.id == team.id);
    } else {
      final favoriteTeam = FavoriteteamModels(id: team.id, name: team.name, image: team.image,description: team.description);
      await _dbHelper.insertFavorite(favoriteTeam);
      favoriteTeams.add(favoriteTeam);
    }
  } else if (team is FavoriteteamModels) {
    await _dbHelper.deleteFavorite(int.parse(team.id));
    favoriteTeams.removeWhere((favTeam) => favTeam.id == team.id);
  }
}

void removeFavorite(FavoriteteamModels favoriteTeam) async {
  await _dbHelper.deleteFavorite(int.parse(favoriteTeam.id));
  favoriteTeams.removeWhere((favTeam) => favTeam.id == favoriteTeam.id);
}

}
