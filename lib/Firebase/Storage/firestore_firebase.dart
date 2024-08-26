import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food_app/Model/User.dart';
  import 'dart:convert';
  import 'package:crypto/crypto.dart';
import 'package:fast_food_app/Model/item.dart';


class FirestoreFirebaseAL{

  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  FirebaseFirestore ff=FirebaseFirestore.instance;
  uploadUserDataAL(User cu) async {
    try{
await ff.collection("users").doc(cu.email).set(cu.toMap());
      print("user profile data success");
    return true;
    }
    catch(e){
      print("user data firebasefirestore upload failed");
      return false;
    }
  }
  deleteUserDataAl(String? docName) async {
    try{
      await ff.collection("users").doc(docName).delete();
      print("user profile data delete success");
      return true;
    }
    catch(e){
      print("user data firebasefirestore delete failed");
      return false;
    }
  }
  Future<List<Item>> getItems() async {
    List<Item> items = [];
    try {
      CollectionReference collectionRef = FirebaseFirestore.instance.collection('items');

      QuerySnapshot querySnapshot = await collectionRef.get();

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Item item = Item.fromMap(data);
        items.add(item);
      }
    } catch (e) {
      print('Error fetching items: $e');
    }

    return items;
  }

}