import 'dart:developer';

import 'package:finance_management/app/data/dummy_data/cost_type_data.dart';
import 'package:finance_management/app/module/home/controller/add_transection_controller/add_transection.dart';
import 'package:flutter/material.dart';

import '../../../../Global_widget/custom_Textfield.dart';
import 'package:get/get.dart';

import '../../../../Global_widget/custom_text.dart';

class ExpenseTexField extends StatelessWidget {
  const ExpenseTexField({super.key, required this.controller});
  final AddTraController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.mykey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Product
          CustomText(
            text: "Product",
            fontWeight: FontWeight.w900,
            fontsize: 16,
          ),
          CustomTextField(
            controller: controller.productsControleller,
            hintText: "Products...",
          ),
          SizedBox(height: 10),

          //Type
          CustomText(text: "Type", fontWeight: FontWeight.w900, fontsize: 16),
          Obx(
            () => DropdownButtonFormField(
              padding: EdgeInsets.symmetric(horizontal: 10),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              validator: (value) {
                if (value == null || value == "") {
                  return "field can't be empty";
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              hint: CustomText(text: "Select Type"),
              initialValue: controller.costType.value != ""
                  ? controller.costType.value
                  : null,
              items: CostType().Type
                  .map(
                    (v) => DropdownMenuItem(
                      value: v,
                      child: Row(
                        spacing: 8,
                        children: [
                          v == "Food & Dining"
                              ? Icon(Icons.food_bank_outlined)
                              : v == "Groceries"
                              ? Icon(Icons.local_grocery_store_outlined)
                              : v == "Transport"
                              ? Icon(Icons.airplane_ticket_outlined)
                              : v == "Rent"
                              ? Icon(Icons.car_rental_outlined)
                              : v == "Shopping"
                              ? Icon(Icons.shopping_bag_outlined)
                              : v == "Health"
                              ? Icon(Icons.health_and_safety_outlined)
                              : v == "Education"
                              ? Icon(Icons.cast_for_education_outlined)
                              : v == "Bills"
                              ? Icon(Icons.lightbulb_outline)
                              : v == "Entertainment"
                              ? Icon(Icons.interests_outlined)
                              : v == "Family"
                              ? Icon(Icons.person_3_outlined)
                              : v == "Other"
                              ? Icon(Icons.devices_other)
                              : SizedBox(),
                          CustomText(text: "${v}"),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                controller.costType.value = value!;
              },
            ),
          ),
          SizedBox(height: 10),

          //Cost price
          CustomText(text: "Cost", fontWeight: FontWeight.w900, fontsize: 16),
          CustomTextField(
            validator: (value) {
              if (value == "" || value == null) {
                return "field can't be empty";
              }
            },
            preIcon: Icon(Icons.account_balance),
            keyboardType: TextInputType.number,
            controller: controller.costPriceController,
            hintText: "Cost price",
          ),
        ],
      ),
    );
  }
}
