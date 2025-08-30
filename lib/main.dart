import 'package:flutter/material.dart';

void main() {
  runApp(MyShopApp());
}

class MyShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Shop POS',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int stock = 10; // الكمية
  double buyPrice = 5000; // السعر من المورد
  double sellPrice = 7000; // السعر للزبون
  double totalProfit = 0; // الربح

  void sellItem() {
    if (stock > 0) {
      setState(() {
        stock--;
        totalProfit += (sellPrice - buyPrice);
      });
    }
  }

  void addItem() {
    setState(() {
      stock++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إدارة البضاعة")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("الكمية المتوفرة: $stock", style: TextStyle(fontSize: 20)),
            Text("سعر الشراء: $buyPrice", style: TextStyle(fontSize: 18)),
            Text("سعر البيع: $sellPrice", style: TextStyle(fontSize: 18)),
            Text("الربح الكلي: $totalProfit", style: TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: sellItem, child: Text("بيع")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: addItem, child: Text("إضافة")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
