class Cart {
  static double getItemPrice(String item) {
    return _itemPrices[item] ?? 0.0;
  }

  static final Map<String, int> _cartItems = {};
  static final Map<String, double> _itemPrices = {
    'Canned beans': 1.0,
    'Canned vegetables': 1.5,
    'Canned fruit': 1.5,
    'Peanut butter': 2.5,
    'Rice': 1.0,
    'Pasta': 1.0,
    'Oatmeal': 1.0,
    'Canned soup': 1.0,
    'Cooking oil': 3.0,
    'Sugar': 1.0,
    'Flour': 1.0,
    'Salt': 0.5,
    'Dried lentils': 1.0,
    'Canned tuna': 1.5,
    'Canned chicken': 2.0,
    'Instant noodles': 0.5,
    'Shelf-stable milk': 1.0,
    'Fruit juice': 2.5,
    'Granola bars': 1.5,
    'Baby formula': 15.0,
    'Baby food': 1.0,
    'Instant mashed potatoes': 1.0,
    'Vegetable broth': 1.0,
    'Spices (e.g., pepper, garlic powder)': 0.5,
    'Tea': 2.0,
    'Coffee': 5.0,
    'Sugar substitutes': 2.0,
    'Snack items (e.g., crackers, chips)': 1.5,
    'Frozen vegetables': 2.0,
    'Frozen fruits': 2.0,
    'Whole grain bread': 1.5,
    'Tortillas': 1.0,
    'Nuts and seeds': 3.0,
    'Dried fruits': 2.0,
    'Herbs (e.g., basil, oregano)': 1.0,
    'Condiments (e.g., ketchup, mustard)': 1.0,
    'Baking supplies (e.g., baking powder, baking soda)': 1.0,
    'Cereal': 2.0,
    'Popcorn': 1.0,
    'Rice cakes': 1.0,
    'Vegetable oil': 3.0,
    'Honey': 3.0,
    'Maple syrup': 4.0,
    'Jelly or jam': 2.0,
    'Pudding cups': 1.0,
    'Instant rice': 1.0,
    'Chili': 2.0,
    'Macaroni and cheese': 1.5,
    'Vegetable snacks (e.g., carrot sticks)': 1.0,
    'Fruit snacks': 1.0,
    // Existing items
    'Instant coffee': 5.0,
    'Rice pudding': 3.0,
    'Nappies size 5/6': 10.0,
    'Cat/ dog food': 8.0,
    'Bread': 1.5,
    'Milk': 1.0,
    'Eggs': 2.0,
    'Butter': 2.5,
    'Cheese': 3.0,
    'Toilet paper': 1.0,
    'Soap': 1.0,
    'Shampoo': 2.0,
    'Toothpaste': 1.5,
    'Toothbrush': 1.0,
    'Deodorant': 2.0,
    'Laundry detergent': 3.0,
    'Dish soap': 1.5,
    'Cleaning supplies': 2.0,
    'Diapers': 10.0,
    'Feminine hygiene products': 5.0,
    'Razors': 2.0,
    'Shaving cream': 2.0,
    'First aid supplies': 5.0,
    'Pain relievers': 3.0,
    'Cold medicine': 3.0,
    'Vitamins': 5.0,
    'Hand sanitizer': 2.0,
    'Face masks': 1.0,
    'Gloves': 1.0,
    'Blankets': 10.0,
  };

  static void addToCart(String item) {
    if (_cartItems.containsKey(item)) {
      _cartItems[item] = _cartItems[item]! + 1;
    } else {
      _cartItems[item] = 1;
    }
  }

  static void removeFromCart(String item) {
    if (_cartItems.containsKey(item) && _cartItems[item]! > 0) {
      _cartItems[item] = _cartItems[item]! - 1;
      if (_cartItems[item] == 0) {
        _cartItems.remove(item);
      }
    }
  }

  static Map<String, int> getCartItems() {
    return _cartItems;
  }

  static double getTotalPrice() {
    return _cartItems.entries.fold(
        0, (total, entry) => total + _itemPrices[entry.key]! * entry.value);
  }

  static void clearCart() {
    _cartItems.clear();
  }
}
