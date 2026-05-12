import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderScreen(),
    );
  }
}

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  // ===== Task 1: Controller for TextField =====
  TextEditingController nameController = TextEditingController();

  // ===== Task 2: Validation Variables =====
  String? errorText;

  // ===== Task 3: Dropdown Variables =====
  String selectedSize = "Small";
  List<String> sizes = ["Small", "Medium", "Large", "Party Size"];

  // ===== Task 4: Submit Function =====
  void submitOrder() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationScreen(
          customerName: nameController.text,
          pizzaSize: selectedSize,
        ),
      ),
    );

    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Order Confirmed!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SMT Cuisine Order")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // ===== Task 1: TextField =====
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Enter customer name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            // ===== Task 2: TextFormField with Live Validation =====
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter discount code",
                border: OutlineInputBorder(),
                errorText: errorText,
              ),
              onChanged: (value) {
                setState(() {
                  if (value.contains(" ")) {
                    errorText = "Don't use blank spaces";
                  } else {
                    errorText = null;
                  }
                });
              },
            ),

            SizedBox(height: 15),

            // ===== Task 3: Dropdown =====
            DropdownButton<String>(
              value: selectedSize,
              isExpanded: true,
              items: sizes.map((size) {
                return DropdownMenuItem(
                  value: size,
                  child: Text(size),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSize = value!;
                });
              },
            ),

            SizedBox(height: 20),

            // ===== Task 4: Submit Button =====
            ElevatedButton(
              onPressed: submitOrder,
              child: Text("Submit Order"),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Task 4: Confirmation Screen =====
class ConfirmationScreen extends StatelessWidget {
  final String customerName;
  final String pizzaSize;

  ConfirmationScreen({
    required this.customerName,
    required this.pizzaSize,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirmation")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Customer Name: $customerName"),
            Text("Pizza Size: $pizzaSize"),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Confirm"),
            )
          ],
        ),
      ),
    );
  }
}