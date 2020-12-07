import 'package:flutter/material.dart';
import 'package:shop_app/components/cart_order_btn.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/details/components/details_app_bar.dart';

import '../../models/Product.dart';
import 'components/image_viewer.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = "/details";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Future<void> initialize(id) async {
    await getProductData(id);
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: DetailsAppBar(),
      body: FutureBuilder(
        future: initialize(args.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Container(
                height: 2000,
                color: kBGColor,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        children: [
                          ImageViewer(
                            images: productVariable.product['images'],
                          ),
                          Divider(),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              productVariable.product['name'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              productVariable.product['price'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 30,
                              child: CartOrderBtn(
                                width: MediaQuery.of(context).size.width * 0.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Info and Care',
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.48,
                                child: Text(
                                  productVariable.product['product_info'][2]
                                      ['name'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                              Container(
                                child: Text(
                                  productVariable.product['product_info'][2]
                                              ['value'] ==
                                          null
                                      ? ''
                                      : productVariable.product['product_info']
                                          [2]['value'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.48,
                                child: Text(
                                  productVariable.product['product_info'][1]
                                      ['name'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                              Container(
                                child: Text(
                                  productVariable.product['product_info'][1]
                                              ['value'] ==
                                          null
                                      ? ''
                                      : productVariable.product['product_info']
                                          [1]['value'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.48,
                                child: Text(
                                  productVariable.product['product_info'][0]
                                      ['name'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                              Container(
                                child: Text(
                                  productVariable.product['product_info'][0]
                                              ['value'] ==
                                          null
                                      ? ''
                                      : productVariable.product['product_info']
                                          [0]['value'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Text(productVariable.product['description']),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ProductDetailsArguments {
  final String id;

  ProductDetailsArguments({@required this.id});
}
