import 'dart:convert';

import 'package:assingment3/allpage/view_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../product_list.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product > MyList =[];
  @override
  void initState() {
    super.initState();
    getProductApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductList"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: MyList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewProduct(
                      title: MyList[index].title,
                      Image: MyList[index].Image,
                      id: MyList[index].id,
                    ),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: Hero(
                      tag: MyList[index].id,
                      child: Image.network(MyList[index].Image)),
                  title:  Text(MyList[index].title),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> getProductApi() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    Response response = await get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var item in data) {
        Product product = Product(
          id: item["id"],
          title: item["title"],
          Image: item["url"],
        );
        MyList.add(product);
      }
      setState(() {

      });
    }
  }
}
