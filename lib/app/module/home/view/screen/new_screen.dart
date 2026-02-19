import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/module/home/view/screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Global_widget/custom_text.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StreamController controller = Get.put(StreamController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: CustomText(text: "StreamBuilder"),
      ),
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: controller.streamData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                FirebaseGetModel modelData = FirebaseGetModel();
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                modelData = FirebaseGetModel.fromJson(data);

                return Center(
                  child: CustomText(
                    text: "${jsonEncode(modelData.allExpense)}",
                  ),
                );
              }
              return CustomText(text: "NO Data Found");
            },
          ),
        ],
      ),
    );
  }
}
