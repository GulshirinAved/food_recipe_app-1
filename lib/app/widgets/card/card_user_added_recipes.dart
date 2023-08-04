import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/data/model/services/crud_services.dart';

FutureBuilder<QuerySnapshot<Map<String, dynamic>>> verticalMyRecipeCard() {
  return CrudMethods().futureforUser(false);
}
