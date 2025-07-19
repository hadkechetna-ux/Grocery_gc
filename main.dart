import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ProductDetailsPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.share_outlined, color: Colors.black),
          )
        ],
        title: const Text("Products Details",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset("assets/farm_fresh.png"),
          ),
          const SizedBox(height: 16),

          // Product Title + Price + Discount
          const Text("Farm Fresh Produce",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 8),
          Row(
            children: const [
              Text("\$10.00",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(width: 12),
              Text("Discount 5%",
                  style: TextStyle(
                      backgroundColor: Color(0xFFDFF5E3),
                      color: Colors.green,
                      fontSize: 14)),
            ],
          ),
          const SizedBox(height: 12),

          // Delivery + Time + Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(children: [
                Icon(Icons.delivery_dining, color: Colors.grey),
                SizedBox(width: 4),
                Text("Delivered"),
              ]),
              Row(children: [
                Icon(Icons.timer_outlined, color: Colors.grey),
                SizedBox(width: 4),
                Text("Time 10 min"),
              ]),
              Row(children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text("3.5 Rating"),
              ]),
            ],
          ),

          const SizedBox(height: 20),

          // Description
          const Text("Discription",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 6),
          const Text(
            "Enjoy farm-fresh produce, handpicked for quality, packed with nutrition, and delivered with care! See more...",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 40),

          // Add to Cart Row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, size: 20),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Text(quantity.toString(),
                        style: const TextStyle(fontSize: 16)),
                    IconButton(
                      icon: const Icon(Icons.add, size: 20),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text("Add to Cart",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
