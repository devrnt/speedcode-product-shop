import 'package:flutter/material.dart';
import 'package:product_shop/main.dart';
import 'package:product_shop/styles.dart';

class SmallProductTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Picked for you',
                style: tileTitleStyle,
              ),
              Opacity(
                opacity: 0.6,
                child: Text(
                  'Show all',
                  style: filterStyle,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 5,
                  child: SmallProductTile(
                    name: 'Console',
                    price: 149,
                    asset: 'assets/console.jpg',
                    padding: const EdgeInsets.only(right: 14.0),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: SmallProductTile(
                    name: 'Watch',
                    price: 199,
                    asset: 'assets/watch.jpg',
                    padding: const EdgeInsets.only(left: 14.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BigProductTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsScreen()));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'What\'s new',
                  style: tileTitleStyle,
                ),
                filter,
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Hero(
                  tag: 'airpods',
                  child: Image.asset(
                    'assets/airpods.jpg',
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'AirPods',
                    style: tileItemStyle,
                  ),
                  Text(
                    '£156',
                    style: tileItemPriceStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get filter {
    return Opacity(
      opacity: 0.45,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(Icons.sort),
          ),
          Text('Filter', style: filterStyle),
        ],
      ),
    );
  }
}

class SmallProductTile extends StatelessWidget {
  final String name;
  final int price;
  final String asset;
  final EdgeInsets padding;

  SmallProductTile({
    @required this.name,
    @required this.price,
    @required this.asset,
    @required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              asset,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('$name', style: smallTileName),
                Text('£$price', style: smallTilePrice),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Quantity', style: quantityStyle),
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black.withOpacity(0.06),
                ),
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: Text('―', style: quantityIconStyle),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text('1',
                    style: quantityIconStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 18)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black.withOpacity(0.05),
                ),
                alignment: Alignment.center,
                width: 36,
                height: 36,
                child: Text('+', style: quantityIconStyle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
