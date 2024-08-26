import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Utility/colors.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
        backgroundColor: primary_color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextFormField(
                labelText: 'Item Name',
                controller: _nameController,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              buildTextFormField(
                labelText: 'Item Description',
                controller: _descriController,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              buildTextFormField(
                labelText: 'Price',
                controller: _priceController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              buildTextFormField(
                labelText: 'Time (min)',
                controller: _timeController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              buildTextFormField(
                labelText: 'Discount (€)',
                controller: _discountController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              buildTextFormField(
                labelText: 'Image URL',
                controller: _imageUrlController,
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: secondary_color,
                      foregroundColor: primary_color,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseFirestore.instance.collection('items').add({
                        'name': _nameController.text,
                        'description': _descriController.text,
                        'price': double.parse(_priceController.text),
                        'time': int.parse(_timeController.text),
                        'discount': double.parse(_discountController.text),
                        'image': _imageUrlController.text,
                      }).then((value) => Navigator.pop(context));
                    }
                  },
                  child: const Text('Add Item',style: TextStyle(fontSize: 20),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextFormField({
  required String labelText,
  required TextEditingController controller,
  required TextInputType keyboardType,
  String? hintText,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      labelText: labelText,
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 24),
      fillColor: Colors.white70,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
    keyboardType: keyboardType,
    validator: validator ?? (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $labelText';
      }
      return null;
    },
  );
}
