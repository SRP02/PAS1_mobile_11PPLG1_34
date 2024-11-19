import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_34/models/Team_models.dart';
import 'package:pas1_mobile_11pplg1_34/utils/apiSport.dart';


class TeamController extends GetxController {
var isLoading = true.obs;
  var TeamList = <TeamModels>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var post = await ApiService().fetchTeams();
      TeamList.assignAll(post);
    } finally {
      isLoading(false);
    }
  }
}