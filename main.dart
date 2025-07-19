import 'package:flutter/material.dart';

void main() {
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F5),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green.shade700,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: ""),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Top row with icons and location
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.location_on_outlined),
                const Text(
                  "Green Valley Point",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Delivery / Pickup switch
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildDeliveryToggle("Delivery", true),
                  buildDeliveryToggle("Pickup", false),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Category Icons Row
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCategory("assets/meats.png", "Meats"),
                  buildCategory("assets/fresh.png", "Fresh"),
                  buildCategory("assets/bakery.png", "Bakery"),
                  buildCategory("assets/grains.png", "Grains"),
                  buildCategory("assets/organic.png", "Organic"),
                ],
              ),
            ),

            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Popular items", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("See All", style: TextStyle(color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 12),

            // Product Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset("assets/farm_fresh.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Farm Fresh Produce",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("\$10.00", style: TextStyle(fontWeight: FontWeight.bold)),
                            Row(children: [
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Text("3.5"),
                            ]),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Delivered", style: TextStyle(color: Colors.grey)),
                            Text("Time 10 min", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text("Discount 5%", style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDeliveryToggle(String title, bool selected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: selected ? Colors.green.shade100 : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.green.shade800 : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategory(String assetPath, String label) {
    return Container(
      width: 64,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            backgroundImage: AssetImage(assetPath),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
