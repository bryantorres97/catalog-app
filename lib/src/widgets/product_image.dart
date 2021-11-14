import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Container(
          decoration: _buildBoxDecoration(),
          width: double.infinity,
          height: 450,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: FadeInImage(
              image: NetworkImage('https://via.placeholder.com/400x300/green'),
              placeholder: AssetImage('assets/img/jar-loading.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 5))
          ]);
}
