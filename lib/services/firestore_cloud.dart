import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addFoodItem(
    String userId, String foodName, double calories) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('foodItems')
      .add({
    'foodName': foodName,
    'calories': calories,
  });
}

Stream<QuerySnapshot> getFoodItems(String userId) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('foodItems')
      .snapshots();
}
