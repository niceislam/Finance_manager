import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconData {
  dynamic data({required dynamic ticket}) {
    return ticket == "Food & Dining"
        ? Icon(Icons.food_bank_outlined)
        : ticket == "Groceries"
        ? Icon(Icons.local_grocery_store_outlined)
        : ticket == "Transport"
        ? Icon(Icons.airplane_ticket_outlined)
        : ticket == "Rent"
        ? Icon(Icons.car_rental_outlined)
        : ticket == "Shopping"
        ? Icon(Icons.shopping_bag_outlined)
        : ticket == "Health"
        ? Icon(Icons.health_and_safety_outlined)
        : ticket == "Education"
        ? Icon(Icons.cast_for_education_outlined)
        : ticket == "Bills"
        ? Icon(Icons.lightbulb_outline)
        : ticket == "Entertainment"
        ? Icon(Icons.interests_outlined)
        : ticket == "Family"
        ? Icon(Icons.person_3_outlined)
        : ticket == "Other"
        ? Icon(Icons.devices_other)
        : Icon(Icons.close);
  }
}
