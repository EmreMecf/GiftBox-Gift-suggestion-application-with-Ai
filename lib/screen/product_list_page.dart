/*import 'package:flutter/material.dart';
import '../class/product.dart';



class ProductListPage extends StatefulWidget {
  final String _selectedCategory;

  ProductListPage(this._selectedCategory);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> _recommendedProducts = [];

  @override
  void initState() {
    super.initState();
    _getRecommendedProducts();
  }

  Future<void> _getRecommendedProducts() async {
    final recommendations = await GeminiAPI.getRecommendations(widget._selectedCategory);
    setState(() {
      _recommendedProducts = recommendations
          .map((json) => Product(
        name: json['name'],
        price: json['price'],
        description: json['description'],
      ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _recommendedProducts.length,
          itemBuilder: (context, index) {
            final product = _recommendedProducts[index];
            return Card(
              child: ListTile(
                title: Text(product.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price: \$${product.price}'),
                    SizedBox(height: 8),
                    Text(product.description),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}

 */