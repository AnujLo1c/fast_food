import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Utility/colors.dart';
import 'add_item_screen.dart';  // Import the AddItemScreen here

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: primary_color,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No items available'));
          }
          final items = snapshot.data!.docs;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Price: ${item['price']} €\n'
                      'Time: ${item['time']} min\n'
                      'Discount: ${item['discount']} €'),
                  leading: Image.network(item['image'], width: 50, height: 50, fit: BoxFit.cover),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      FirebaseFirestore.instance.collection('items').doc(item.id).delete();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemScreen()),  // Navigate to AddItemScreen
          );
        },
        backgroundColor: primary_color,
        child: const Icon(Icons.add),
      ),
    );
  }
}
