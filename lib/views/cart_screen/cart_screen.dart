import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/views/cart_screen/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  var item = cartController.cartItems[index];
                  return ListTile(
                    title: Text(item['title']),
                    subtitle: Text('Quantity: ${item['quantity']}'),
                    trailing: Text(
                      '\$${(double.parse(item['price']) * item['quantity']).toStringAsFixed(2)}',
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  _showPaymentDialog(context);
                },
                child: const Text('Pay'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPaymentDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return PaymentDialog(cartController: cartController);
      },
    );
  }
}

class PaymentDialog extends StatefulWidget {
  final CartController cartController;

  PaymentDialog({required this.cartController});

  @override
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  String nama = '';
  String address = '';
  String shippingMethod = 'KIRIM'; // Default value is 'KIRIM'

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Payment Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Nama'),
            onChanged: (value) {
              setState(() {
                nama = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Address'),
            onChanged: (value) {
              setState(() {
                address = value;
              });
            },
          ),
          DropdownButton<String>(
            value: shippingMethod,
            onChanged: (String? newValue) {
              setState(() {
                shippingMethod = newValue!;
              });
            },
            items: <String>['KIRIM', 'Ambil Toko']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (nama.isNotEmpty &&
                address.isNotEmpty &&
                shippingMethod.isNotEmpty) {
              if (widget.cartController.cartItems.isNotEmpty) {
                final selectedItem = widget.cartController.cartItems[0];
                double total = double.parse(selectedItem['price']) *
                    selectedItem['quantity'];
                await widget.cartController
                    .saveToDatabase(nama, total.toStringAsFixed(2), {
                  'title': selectedItem['title'],
                  'price': selectedItem['price'],
                  'quantity': selectedItem['quantity'],
                  'nama': nama,
                  'total': total.toStringAsFixed(2),
                  'alamat': address,
                  'pengiriman': shippingMethod,
                });
                widget.cartController.cartItems.clear();
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Your cart is empty'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Please fill in all fields'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: Text('Pay'),
        ),
      ],
    );
  }
}
