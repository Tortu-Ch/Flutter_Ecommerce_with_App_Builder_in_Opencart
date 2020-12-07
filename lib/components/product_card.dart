import 'package:flutter/material.dart';
import 'package:shop_app/components/cart_order_btn.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shop_app/models/Product.dart';
// import 'package:shop_app/screens/details/details_screen.dart';

import '../constants.dart';
// import '../size_config.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
    @required this.incVal,
    this.isCartButton = true,
  }) : super(key: key);

  final double width, aspectRetio;
  final dynamic product;
  final int incVal;
  final bool isCartButton;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _cartNum;

  @override
  void initState() {
    _cartNum = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        width: widget.width,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.white70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.02,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        child: Hero(
                          tag: widget.product['id'].toString(),
                          child: Image.network(
                            widget.product['src'],
                            fit: widget.product['image_contentMode'] ==
                                    'scaleAspectFill'
                                ? BoxFit.fill
                                : BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: widget.width * 0.7,
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.product['name']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                "${widget.product['price']}",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child:
                                /* widget.product['is_in_wishlist']
                                ? Icon(Icons.favorite)
                                :  */
                                Icon(Icons.favorite_outline, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                widget.isCartButton == true
                    ? (_cartNum == 0
                        ? FlatButton(
                            minWidth: widget.width,
                            color: kButtonColor,
                            textColor: kBtnTxtColor,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.blueAccent,
                            onPressed: () {
                              if (widget.incVal > 0) {
                                setState(() {
                                  _cartNum = widget.incVal;
                                });
                              }
                            },
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(fontSize: 14.0),
                            ),
                          )
                        : CartOrderBtn(width: widget.width))
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
