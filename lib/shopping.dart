import 'package:flutter/material.dart';
import 'cart.dart';
import 'checkout.dart';

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  List<String> items = [
    'Canned beans',
    'Canned vegetables',
    'Canned fruit',
    'Peanut butter',
    'Rice',
    'Pasta',
    'Oatmeal',
    'Canned soup',
    'Cooking oil',
    'Sugar',
    'Flour',
    'Salt',
    'Dried lentils',
    'Canned tuna',
    'Canned chicken',
    'Instant noodles',
    'Shelf-stable milk',
    'Fruit juice',
    'Granola bars',
    'Baby formula',
    'Baby food',
    'Instant mashed potatoes',
    'Vegetable broth',
    'Spices (e.g., pepper, garlic powder)',
    'Tea',
    'Coffee',
    'Sugar substitutes',
    'Snack items (e.g., crackers, chips)',
    'Frozen vegetables',
    'Frozen fruits',
    'Whole grain bread',
    'Tortillas',
    'Nuts and seeds',
    'Dried fruits',
    'Herbs (e.g., basil, oregano)',
    'Condiments (e.g., ketchup, mustard)',
    'Baking supplies (e.g., baking powder, baking soda)',
    'Cereal',
    'Popcorn',
    'Rice cakes',
    'Vegetable oil',
    'Honey',
    'Maple syrup',
    'Jelly or jam',
    'Pudding cups',
    'Instant rice',
    'Chili',
    'Macaroni and cheese',
    'Vegetable snacks (e.g., carrot sticks)',
    'Fruit snacks',
  ];

  // Example stock levels for items
  Map<String, String> stockLevels = {
    'Canned beans': 'low',
    'Canned vegetables': 'well',
    'Canned fruit': 'well',
    'Peanut butter': 'urgently',
    'Rice': 'well',
    'Pasta': 'well',
    'Oatmeal': 'low',
    'Canned soup': 'well',
    'Cooking oil': 'well',
    'Sugar': 'well',
    'Flour': 'well',
    'Salt': 'well',
    'Dried lentils': 'well',
    'Canned tuna': 'low',
    'Canned chicken': 'well',
    'Instant noodles': 'well',
    'Shelf-stable milk': 'well',
    'Fruit juice': 'well',
    'Granola bars': 'low',
    'Baby formula': 'urgently',
    'Baby food': 'well',
    'Instant mashed potatoes': 'well',
    'Vegetable broth': 'well',
    'Spices (e.g., pepper, garlic powder)': 'well',
    'Tea': 'well',
    'Coffee': 'well',
    'Sugar substitutes': 'well',
    'Snack items (e.g., crackers, chips)': 'well',
    'Frozen vegetables': 'well',
    'Frozen fruits': 'well',
    'Whole grain bread': 'well',
    'Tortillas': 'well',
    'Nuts and seeds': 'low',
    'Dried fruits': 'well',
    'Herbs (e.g., basil, oregano)': 'well',
    'Condiments (e.g., ketchup, mustard)': 'well',
    'Baking supplies (e.g., baking powder, baking soda)': 'well',
    'Cereal': 'well',
    'Popcorn': 'well',
    'Rice cakes': 'well',
    'Vegetable oil': 'well',
    'Honey': 'well',
    'Maple syrup': 'well',
    'Jelly or jam': 'well',
    'Pudding cups': 'well',
    'Instant rice': 'well',
    'Chili': 'well',
    'Macaroni and cheese': 'well',
    'Vegetable snacks (e.g., carrot sticks)': 'well',
    'Fruit snacks': 'well',
  };

  String selectedFilter = 'All';

  void addToCart(String item) {
    setState(() {
      Cart.addToCart(item);
    });
  }

  void removeFromCart(String item) {
    setState(() {
      Cart.removeFromCart(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredItems = items;

    if (selectedFilter == 'Urgently Needed') {
      filteredItems =
          items.where((item) => stockLevels[item] == 'urgently').toList();
    } else if (selectedFilter == 'Low in Stock') {
      filteredItems =
          items.where((item) => stockLevels[item] == 'low').toList();
    } else if (selectedFilter == 'Well Stocked') {
      filteredItems =
          items.where((item) => stockLevels[item] == 'well').toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Food Bank Shopping List'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedFilter,
              onChanged: (value) {
                setState(() {
                  selectedFilter = value!;
                });
              },
              items: [
                'All',
                'Urgently Needed',
                'Low in Stock',
                'Well Stocked',
              ].map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  String item = filteredItems[index];
                  double price = Cart.getItemPrice(item);
                  int quantity = Cart.getCartItems()[item] ?? 0;
                  return Container(
                    color: const Color.fromARGB(255, 39, 85, 185),
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      title: Text(
                        '$item - \RM${price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () => removeFromCart(item),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '$quantity',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () => addToCart(item),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutPage()),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.shopping_cart),
            if (Cart.getCartItems().isNotEmpty)
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '${Cart.getCartItems().values.fold(0, (sum, item) => sum + item)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 127, 160, 232),
      ),
    );
  }
}
