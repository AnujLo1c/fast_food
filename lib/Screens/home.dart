import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food_app/Screens/Pages/profile.dart';
import 'package:fast_food_app/Screens/item_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../Utility/colors.dart';
import '../Widgets/custombottomnavigationbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  String deliveryLoc = "Location";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
var Pages=[Profile()];


    return Scaffold(
      body: _currentIndex==0?SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: primary_color,
                    child: SvgPicture.asset(
                      "assets/icons/home.svg",
                      width: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Home, ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    deliveryLoc,
                    style: const TextStyle(color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/arrow-bottom.svg",
                      width: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CarouselSlider(
                items: [
                  carouselItem(size),
                  carouselItem(size),
                  carouselItem(size),
                  carouselItem(size),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  initialPage: 0,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                ),
              ),
              Gap(20),
              Row(
                children: [
                  Text("Fastest Delivery🔥"),
                  Spacer(),
                  SizedBox(
                    height: 24,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondary_color,
                        padding: EdgeInsets.all(0),
                      ),
                      child: Text(
                        "See all",
                        style: TextStyle(fontSize: 10, color: primary_color),
                      ),
                    ),
                  )
                ],
              ),
              Gap(15),
              SizedBox(
                height: 220,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('items')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No items available'));
                    }
                    var items = snapshot.data!.docs;
                    var fastest = items.toList();
                    fastest.sort((a, b) => a['time'].compareTo(b['time']));

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fastest.length,
                      itemBuilder: (context, index) => listTile(index, fastest),
                    );
                  },
                ),
              ),
              Gap(15),
              Row(
                children: [
                  Text("Popular Items🔥"),
                  Spacer(),
                  SizedBox(
                    height: 24,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondary_color,
                        padding: EdgeInsets.all(0),
                      ),
                      child: Text(
                        "See all",
                        style: TextStyle(fontSize: 10, color: primary_color),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(15),
              SizedBox(
                height: 220,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('items')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No items available'));
                    }
                    var items = snapshot.data!.docs;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) => listTile(index, items),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ):Pages[0],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: primary_color,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  Widget carouselItem(Size size) {
    return Container(
      width: size.width,
      height: size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.orange.shade600, primary_color],
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Gap(30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Get Your 30% \n discount now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black),
                  onPressed: () {},
                  child: const Text(
                    "Order Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 180,
              child: Image.asset(
                "assets/images/Image10.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listTile(int index, List<dynamic> items) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(item: items[index]),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: 250,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(blurRadius: 2, color: Color.fromRGBO(98, 98, 98, 0.2))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                items[index]['image'],
                height: 120,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    items[index]['description'],
                    maxLines: 1,
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.fire_truck_rounded,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(width: 5),
                      Text('€${items[index]['price']}'),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.timer,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(width: 5),
                      Text('${items[index]['time']} min'),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.discount,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(width: 5),
                      Text('€2${items[index]['discount']}'),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}