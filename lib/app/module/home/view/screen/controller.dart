import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:get/get.dart';

class StreamController extends GetxController {
  Stream<DocumentSnapshot>? streamData;

  Future<void> getData() async {
    String? uid = await LocalStorage().readData(key: "login");
    if (uid != null) {
      streamData = FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .snapshots();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
