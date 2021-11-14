import 'package:flutter/material.dart';
import 'package:productos_app/src/screens/screens.dart';
import 'package:productos_app/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Producto'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                child: ProductCard(),
                onTap: () =>
                    Navigator.pushNamed(context, ProductScreen.routeName),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
