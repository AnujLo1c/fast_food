import 'package:fast_food_app/Widgets/bordered_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key, required this.item});
  final dynamic item;

  @override
  State<ItemDetailScreen> createState() {
    return _ItemDetailScreenState();
  }
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  bool cheese = true;
  bool sauce = false;
  bool package = false;
  var number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: const Color.fromRGBO(255, 228, 204, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const BorderedIcon(
                        icon: Icons.chevron_left,
                      ),
                    ),
                    CircleAvatar(
                      foregroundImage: NetworkImage(
                        widget.item['image'],
                      ),
                      radius: 150,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(130, 120, 110, 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/exit.svg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    widget.item['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.deepOrange,
                    size: 36,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.item['description'],
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    '€${(widget.item['price'] - widget.item['discount']).toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '€${widget.item['price'].toStringAsFixed(2)}',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
