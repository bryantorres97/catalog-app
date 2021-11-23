import 'package:flutter/material.dart';
import 'package:productos_app/src/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final notProductImg =
      'https://www.google.com.ec/url?sa=i&url=https%3A%2F%2Fsp.depositphotos.com%2Fvector-images%2Fno-image-available.html&psig=AOvVaw3y3ovEXx0ajLyrN5zZtNoq&ust=1637335373028000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMCSkeCbovQCFQAAAAAdAAAAABAJ';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _decorationCardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            BackgroundImage(
              img: product.picture,
            ),
            ProductDetails(
              name: product.name,
              id: product.id!,
            ),
            Positioned(
              child: PriceTag(
                price: product.price,
              ),
              top: 0,
              right: 0,
            ),
            if (!product.available)
              Positioned(
                child: _NotAvailable(),
                top: 0,
                left: 0,
              ),
          ],
        ),
        // color: Colors.red,
      ),
    );
  }

  BoxDecoration _decorationCardBorders() => BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(25),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
                color: Colors.black, offset: Offset(0, 2), blurRadius: 6)
          ]);
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.yellow[800],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class PriceTag extends StatelessWidget {
  final double price;
  const PriceTag({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$$price',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final String name;
  final String id;
  const ProductDetails({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 70,
        // color: Colors.indigo,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              id,
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class BackgroundImage extends StatelessWidget {
  final String? img;
  const BackgroundImage({Key? key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: (img == null)
            ? Image(
                image: AssetImage('assets/img/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/img/jar-loading.gif'),
                image: NetworkImage(img!)),
      ),
    );
  }
}
