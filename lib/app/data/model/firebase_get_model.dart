class FirebaseGetModel {
  String? profession;
  int? income;
  List<TExpense>? tExpense;
  List<TExpense>? allExpense;
  String? name;
  int? expense;
  int? age;

  FirebaseGetModel({
    this.profession,
    this.income,
    this.tExpense,
    this.allExpense,
    this.name,
    this.expense,
    this.age,
  });

  FirebaseGetModel.fromJson(Map<String, dynamic> json) {
    profession = json['profession'];
    income = json['income'];

    if (json['tExpense'] != null) {
      tExpense = <TExpense>[];
      json['tExpense'].forEach((v) {
        tExpense!.add(TExpense.fromJson(v));
      });
    }

    if (json['allExpense'] != null) {
      allExpense = <TExpense>[];
      json['allExpense'].forEach((v) {
        allExpense!.add(TExpense.fromJson(v));
      });
    }

    name = json['name'];
    expense = json['expense'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profession'] = profession;
    data['income'] = income;

    if (tExpense != null) {
      data['tExpense'] = tExpense!.map((v) => v.toJson()).toList();
    }

    if (allExpense != null) {
      data['allExpense'] = allExpense!.map((v) => v.toJson()).toList();
    }

    data['name'] = name;
    data['expense'] = expense;
    data['age'] = age;
    return data;
  }
}

class TExpense {
  String? dateTime;
  String? product;
  int? cost;
  String? costType;

  TExpense({this.dateTime, this.product, this.cost, this.costType});

  TExpense.fromJson(Map<String, dynamic> json) {
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