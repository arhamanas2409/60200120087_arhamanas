import 'package:flutter/material.dart';

void main() => runApp(TokopediaApp());

class TokopediaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tokopedia',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tokoku'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Promo',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 150.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PromoCard(
                    image: 'promo1.jpg',
                    title: 'Promo 1',
                  ),
                  PromoCard(
                    image: 'promo2.jpg',
                    title: 'Promo 2',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Produk Terbaru',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8.0),
              children: [
                ProductCard(
                  image: 'produk1.png',
                  name: 'indomie',
                  price: 'Rp 2.500',
                ),
                ProductCard(
                  image: 'produk2.jpg',
                  name: 'susu uht',
                  price: 'Rp 5.000',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String image;
  final String title;

  PromoCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.black.withOpacity(0.3),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  ProductCard({required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Text(
              price,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
