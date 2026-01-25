class FirebaseGetModel {
  String? profession;
  dynamic income;
  List<TExpense>? tExpense;
  String? name;
  dynamic expense;
  dynamic age;

  FirebaseGetModel({
    this.profession,
    this.income,
    this.tExpense,
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
        tExpense!.add(new TExpense.fromJson(v));
      });
    }
    name = json['name'];
    expense = json['expense'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profession'] = this.profession;
    data['income'] = this.income;
    if (this.tExpense != null) {
      data['tExpense'] = this.tExpense!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['expense'] = this.expense;
    data['age'] = this.age;
    return data;
  }
}

class TExpense {
  String? dateTime;
  String? product;
  dynamic cost;
  String? costType;

  TExpense({this.dateTime, this.product, this.cost, this.costType});

  TExpense.fromJson(Map<String, dynamic> json) {
    dateTime = json['dateTime'];
    product = json['product'];
    cost = json['cost'];
    costType = json['costType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateTime'] = this.dateTime;
    data['product'] = this.product;
    data['cost'] = this.cost;
    data['costType'] = this.costType;
    return data;
  }
}
