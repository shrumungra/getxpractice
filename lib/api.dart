import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

           // api calling using getxcontrolller => http=>GetxController

class apicall extends StatelessWidget {
  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("get api use getxController(http)"))),
        backgroundColor: Colors.grey.shade200,
        body: Obx(() => controller.isLoading.value
            ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: controller.product!.products!.length ,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 20,
                      child: ListTile(
                          onTap: () {},
                          leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              maxRadius: 20,
                              child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "${controller.product!.products![index].thumbnail}"))),
                          title: Text("${controller.product!.products![index].title}"),
                          subtitle: Text("${controller.product!.products![index].price}/-")),
                    );
                  },
                ),
            )
            : Center(child: CircularProgressIndicator())));
  }
}

class ProductController extends GetxController {

  RxBool isLoading = false.obs;
  Product? product;
  String name="";

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchData();
    name="asfds";
    print("======$name");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    name="shruti";
    print("======$name");
  }


  Future<void> fetchData() async {
    print("object");
      http.Response response =
          await http.get(Uri.parse('https://dummyjson.com/products'));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
       var map = jsonDecode(response.body);

        product = Product.fromJson(map);

        if(product!.products!.isNotEmpty){
          isLoading(true);
        }

  }
}

class Product {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  Product({this.products, this.total, this.skip, this.limit});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}
class Products {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  var rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
