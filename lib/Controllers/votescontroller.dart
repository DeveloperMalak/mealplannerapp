import 'package:daily_recipe/ApiServices/votes.dart';
import 'package:daily_recipe/consts/packages.dart';

class Votescontroller extends GetxController {
  var usersallvotes = [].obs;
  RxString mycastedvotecandidatesid = ''.obs;
  @override
  void onInit() {
    getAllUserVotes();
    mycastedvote();
    super.onInit();
  }

  Future<void> getAllUserVotes() async {
    var result = await Votes.getAllVotes();
    if (result.success == true) {
      usersallvotes.value = result.finaluservoteList!;
    }
  }

  var voteMap = <String, bool>{}.obs;
  RxBool favtoggle = false.obs;
  Future<void> castvote(candidatesid, voterid) async {
    if (voteMap.containsKey(candidatesid)) {
      voteMap[candidatesid] = !voteMap[candidatesid]!;
    } else {
      voteMap[candidatesid] = false;
    }
    favtoggle.value = true;
    if (voteMap[candidatesid] != true) {
      await deleteVote(voterid).then((value) {
        getAllUserVotes();
        mycastedvotecandidatesid.value = '';
        mycastedvote();
      });
    } else {
      await Votes.castVote(candidatesid).then((value) {
        getAllUserVotes();
        mycastedvote();
      });
    }
  }

  bool isVoted(String candidatesid) {
    return voteMap[candidatesid] ?? false;
  }

  Future<void> deleteVote(voterid) async {
    await Votes.deleteVote(voterid);
  }

  Future<void> mycastedvote() async {
    var result = await Votes.whomivoted();
    if (result["success"] == true) {
      mycastedvotecandidatesid.value = result["mycastedvote"]["candidates_id"];
    } else {
      mycastedvotecandidatesid.value = '';
    }
  }
}
