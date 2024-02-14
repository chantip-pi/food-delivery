import 'package:flutter/material.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lorem Ipsum Restaurant',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      ),
      body: Container(
        color: const Color.fromARGB(255, 243, 243, 243),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child:  Text('Delivery Info',
              style: TextStyle(
                fontWeight: FontWeight.bold,)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Card(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      // Handle card tap if needed
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      title: Text(
                        "221B Baker St",
                      ),
                      subtitle: Text(
                        "London NW1 6XE, Great Britain",
                      ),
                    ),
                  )),
            ),
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child:  Text('My Order',style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: _CartList(),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Divider(
                  color: Colors.grey,
                )),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.titleLarge;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<CartProvider>();

    return ListView.builder(
      itemCount: cart.cartLength,
      itemBuilder: (context, index) => ListTile(
        leading: Container(
          decoration: BoxDecoration(color:Colors.white,shape: BoxShape.rectangle),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${cart.shoppingCart[index].quantity}'
            ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.removeItem(cart.shoppingCart[index].product.id!);
          },
        ),
        title: Text(
          cart.shoppingCart[index].product.name ?? "Unknown Item",
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Another way to listen to a model's change is to include
            // the Consumer widget. This widget will automatically listen
            // to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild
            // the rest of the widgets in this build method.
            Consumer<CartProvider>(
                builder: (context, cart, child) => 
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ordering not supported yet.')));
                                  },
                                   style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),),
                          backgroundColor: Colors.deepOrange,),
                      child:
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Order Now',style: TextStyle(color: Colors.white)),
                              Text('\$${cart.getCartTotal().toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        )
                       ),
                  ),
                )),
          
          ],
        ),
      ),
    );
  }
}
