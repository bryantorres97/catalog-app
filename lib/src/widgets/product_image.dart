import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? img;
  const ProductImage({Key? key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Container(
          decoration: _buildBoxDecoration(),
          width: double.infinity,
          height: 450,
          child: Opacity(
            opacity: 0.9,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45), topRight: Radius.circular(45)),
              child: (img == null)
                  ? const Image(
                      image: AssetImage('assets/img/no-image.png'),
                      fit: BoxFit.cover,
                    )
                  : FadeInImage(
                      image: NetworkImage(img!),
                      placeholder:
                          const AssetImage('assets/img/jar-loading.gif'),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]);
}
