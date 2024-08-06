
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'checkout_summary_view.dart';

class CartBodyView extends StatefulWidget {
  const CartBodyView({super.key});

  @override
  _CartBodyViewState createState() => _CartBodyViewState();
}

class _CartBodyViewState extends State<CartBodyView> {
  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwc6d5bdfe/nk/9bc/0/1/6/b/c/9bc016bc_cd7a_49cc_a399_47930b00c59f.jpg?sw=700&sh=700&sm=fit&q=100&strip=false',
      'price': 29.99,
      'title': 'Nike Dunk Low Retro',
      'quantity': 1,
    },
    {
      'image': 'https://telfonak.com/wp-content/uploads/2024/02/iphone15-plus.webp',
      'price': 950.0,
      'title': 'Apple iPhone 15 Plus',
      'quantity': 1,
    },
  ];

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  double _calculateSubtotal() {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  double _calculateDeliveryCharge() {
    return 10.0; // مثلا يعنى
  }

  double _calculateTotal() {
    return _calculateSubtotal() + _calculateDeliveryCharge();
  }

  void _navigateToCheckout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutSummaryView(
          subtotal: _calculateSubtotal(),
          deliveryCharge: _calculateDeliveryCharge(),
          total: _calculateTotal(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantComponents.firstColor,
        title: Text(
          'Cart Items',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return buildCartItem(
                  image: cartItems[index]['image'],
                  price: cartItems[index]['price'],
                  title: cartItems[index]['title'],
                  quantity: cartItems[index]['quantity'],
                  index: index,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: _navigateToCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: ConstantComponents.firstColor,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
              ),
              child: Text(
                'Go to Checkout',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCartItem({
    required String image,
    required double price,
    required String title,
    required int quantity,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '\$ $price',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _decrementQuantity(index),
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _incrementQuantity(index),
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () => _removeItem(index),
                      icon: Icon(
                        Icons.delete,
                        color: ConstantComponents.firstColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';

class CartBodyView extends StatefulWidget {
  const CartBodyView({super.key});

  @override
  _CartBodyViewState createState() => _CartBodyViewState();
}

class _CartBodyViewState extends State<CartBodyView> {
  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwc6d5bdfe/nk/9bc/0/1/6/b/c/9bc016bc_cd7a_49cc_a399_47930b00c59f.jpg?sw=700&sh=700&sm=fit&q=100&strip=false',
      'price': 29.99,
      'title': 'Nike Dunk Low Retro',
      'quantity': 1,
    },
    {
      'image': 'https://telfonak.com/wp-content/uploads/2024/02/iphone15-plus.webp',
      'price': 950.0,
      'title': 'Apple iPhone 15 Plus',
      'quantity': 1,
    },
  ];

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantComponents.firstColor,
        title: Text(
          'Cart Items',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return buildCartItem(
            image: cartItems[index]['image'],
            price: cartItems[index]['price'],
            title: cartItems[index]['title'],
            quantity: cartItems[index]['quantity'],
            index: index,
          );
        },
      ),
    );
  }

  Widget buildCartItem({
    required String image,
    required double price,
    required String title,
    required int quantity,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '\$ $price',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _decrementQuantity(index),
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _incrementQuantity(index),
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () => _removeItem(index),
                      icon: Icon(
                        Icons.delete,
                        color:ConstantComponents.firstColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/