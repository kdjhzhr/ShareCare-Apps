import 'package:flutter/material.dart';
import 'cart.dart';
import 'success.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, int> cartItems = Cart.getCartItems();
    double totalPrice = Cart.getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
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
            Text(
              'Items in Cart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  String item = cartItems.keys.elementAt(index);
                  int quantity = cartItems[item]!;
                  double price = Cart.getItemPrice(item) * quantity;
                  return ListTile(
                    title: Text('$item x $quantity'),
                    subtitle: Text('\RM${price.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total Price: \RM${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Payment Method',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Online Banking'),
              leading: Radio(
                value: 'Online Banking',
                groupValue: 'payment',
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: Text('Credit/Debit Card'),
              leading: Radio(
                value: 'Credit/Debit Card',
                groupValue: 'payment',
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessPage()),
                  );
                },
                child: Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
