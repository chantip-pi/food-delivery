import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';


class FoodItem extends StatefulWidget {
  final Food food;

  const FoodItem({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  int count = 1;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                child: Image.asset("assets/images/${widget.food.image}",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  widget.food.name,
                  style: const TextStyle(fontSize: 32),
                ))),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Divider(
              color: Colors.grey,
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "Additional request",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: "E.g. No veggies.."),
              )
            ])),
        Expanded(flex: 4, child: Container()),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    onPressed: decrement,
                    child: const Icon(Icons.remove, color: Colors.black)),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: 30,
                      child: Center(
                          child: Text(count.toString(),
                              style: const TextStyle(fontSize: 24))),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    onPressed: increment,
                    child: const Icon(Icons.add, color: Colors.black)),
                Expanded(
                    child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: Text(
                      "Add to order \$ ${(count * widget.food.price).toStringAsFixed(2)}"),
                ))
              ],
            ))
      ],
    )));
  }
}
