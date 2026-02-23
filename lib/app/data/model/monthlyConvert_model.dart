class MonthlyConvertModel {
  String? monthName;
  int? totalCost;
  List<MonthlyData>? monthlyData;

  MonthlyConvertModel({this.monthName, this.totalCost, this.monthlyData});

  MonthlyConvertModel.fromJson(Map<String, dynamic> json) {
    monthName = json['monthName'];
    totalCost = json['totalCost']?.toDouble();
    if (json['monthlyData'] != null) {
      monthlyData = <MonthlyData>[];
      json['monthlyData'].forEach((v) {
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
    data['totalCost'] = totalCost;
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
  double? totalCost;

  MonthlyData({
    this.dateTime,
    this.product,
    this.cost,
    this.costType,
  });

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
