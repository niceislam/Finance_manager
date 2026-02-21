class MonthlyConvertModel {
  String? monthName;
  List<MonthlyData>? monthlyData;

  MonthlyConvertModel({this.monthName, this.monthlyData});

  // এই Method টি Map এবং Object উভয় থেকেই ডাটা নিতে পারবে
  MonthlyConvertModel.fromJson(Map<String, dynamic> json) {
    monthName = json['monthName'];
    if (json['monthlyData'] != null) {
      monthlyData = <MonthlyData>[];
      json['monthlyData'].forEach((v) {
        // যদি v একটি Map হয় তবে .fromJson ব্যবহার করবে
        // আর যদি সরাসরি Object (যেমন TExpense) হয় তবে .fromObject ব্যবহার করবে
        if (v is Map<String, dynamic>) {
          monthlyData!.add(MonthlyData.fromJson(v));
        } else {
          monthlyData!.add(MonthlyData.fromObject(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['monthName'] = monthName;
    if (monthlyData != null) {
      data['monthlyData'] = monthlyData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthlyData {
  String? dateTime;
  String? product;
  int? cost;
  String? costType;

  MonthlyData({this.dateTime, this.product, this.cost, this.costType});

  // নতুন মেথড: এটি সরাসরি TExpense অবজেক্ট থেকে ডাটা ম্যাপ করবে
  MonthlyData.fromObject(dynamic obj) {
    dateTime = obj.dateTime;
    product = obj.product;
    cost = obj.cost;
    costType = obj.costType;
  }

  MonthlyData.fromJson(Map<String, dynamic> json) {
    dateTime = json['dateTime'];
    product = json['product'];
    cost = json['cost'];
    costType = json['costType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dateTime'] = dateTime;
    data['product'] = product;
    data['cost'] = cost;
    data['costType'] = costType;
    return data;
  }
}