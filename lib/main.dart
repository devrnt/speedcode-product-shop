import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:product_shop/styles.dart';
import 'package:product_shop/widgets.dart';

void main() => runApp(ProductShopApp());

class ProductShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final title = Center(
    heightFactor: 2.5,
    child: Text('STORE', style: titleStyle),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 15.0),
          child: Column(
            children: <Widget>[
              title,
              BigProductTile(),
              Divider(height: 55.0),
              SmallProductTiles(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ProductShopBottomNavigationBar(),
    );
  }
}

class ProductShopBottomNavigationBar extends StatelessWidget {
  static const _iconSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                OMIcons.shoppingBasket,
                size: _iconSize,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                OMIcons.search,
                size: _iconSize,
              ),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(
                OMIcons.shoppingCart,
                size: _iconSize,
              ),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Hero(
                  tag: 'airpods',
                  child: Image.asset(
                    'assets/airpods_large.jpg',
                    height: MediaQuery.of(context).size.height / 2 + 65,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 55.0, 25.0, 15.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    elevation: 0,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 15.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'AirPods',
                          style: tileItemStyle.copyWith(fontSize: 28),
                        ),
                        Text(
                          '£156',
                          style: tileItemPriceStyle.copyWith(fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'AirPods are automatically on and always connected. Put them in your ears and they connect immediately, immersing you in rich, huigh-quality sound.',
                      style: descriptionStyle,
                    ),
                  ),
                  QuantitySelector(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        'Add to Cart',
                        style: buttonStyle,
                      ),
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
}
