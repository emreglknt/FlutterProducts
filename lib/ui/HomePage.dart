import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urunler/ui/DetailsPage.dart';

import '../data/entity/Urunler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


Future<List<Urunler>> loadProduct() async {
  var productList = <Urunler>[];
  var p1 = Urunler(id: 1, name: "Mackbook Pro 14", image: "bilgisayar.png", price: 43000);
  productList.add(p1);
  var p2 = Urunler(id: 2, name: "Ryban Club Master", image: "gozluk.png", price: 2500);
  productList.add(p2);
  var p3 = Urunler(id: 3, name: "Sony ZX Series", image: "kulaklik.png", price: 40000);
  productList.add(p3);
  var p4 = Urunler(id: 4, name: "Gio Armani", image: "parfum.png", price: 2000);
  productList.add(p4);
  var p5 = Urunler(id: 5, name: "Casio X Series", image: "saat.png", price: 8000);
  productList.add(p5);
  var p6 = Urunler(id: 6, name:"Dyson V8", image: "supurge.png", price: 18000);
  productList.add(p6);
  var p7 = Urunler(id: 7, name: "Iphone 13", image: "telefon.png", price: 32000);
  productList.add(p7);

  return productList;

}



class _HomePageState extends State<HomePage> {

  void addToCart(BuildContext context, Urunler product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sepete Ekle"),
          content: Text("${product.name} ürününü sepete eklemek istiyor musunuz?"),
          actions: <Widget>[
            TextButton(
              child: Text("Hayır"),
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapat
              },
            ),
            TextButton(
              child: Text("Evet"),
              onPressed: () {
                // Sepete ekleme işlemi burada gerçekleştirilebilir
                Navigator.of(context).pop(); // Dialog'u kapat
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${product.name} sepete eklendi!"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: FutureBuilder<List<Urunler>>(
        future: loadProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            var productList = snapshot.data;
            return ListView.builder(
              itemCount: productList?.length,
              itemBuilder: (context, index) {
                var product = productList![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(prduct: product,)))
                        .then((value) {
                      print("Returned to home page");
                    });
                  },
                  child: Card(
                    color: Colors.deepPurpleAccent,
                    elevation: 5.0,
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset('images/${product.image}'),
                      title: Text(product.name,style: TextStyle(color: Colors.white),),
                      subtitle: Text('${product.price} TL',style: TextStyle(color: Colors.white),),
                      trailing: IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () => addToCart(context, product),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

}
