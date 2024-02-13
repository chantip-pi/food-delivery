import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/food_controllers.dart';
import 'package:food_delivery/views/food_item_page.dart';
import 'package:food_delivery/models/food_model.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
    
  }

  Widget buildBody(BuildContext context) {
    return ListView(
      children: [
        buildHeader(),
        buildSearchTextField(),
        buildCategoryChips(),
        BuildFoodList(),
      ],
    );
  }

  Widget buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lorem Restaurant",
            style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.star_rate_rounded, color: Colors.deepOrange),
              Text("4.8 Ratings(123 users)"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Search Menu...',
          prefixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
    );
  }

  Widget buildCategoryChips() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 8.0),
          SizedBox(
            height: 40.0,
            child: ListView(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              scrollDirection: Axis.horizontal,
              children: [
                buildCategoryChip('Recommend', Colors.orange, Colors.white),
                const SizedBox(width: 8.0),
                buildCategoryChip('Main Dish', Colors.white, Colors.black),
                const SizedBox(width: 8.0),
                buildCategoryChip('Appetizer', Colors.white, Colors.black),
                const SizedBox(width: 8.0),
                buildCategoryChip('Dessert', Colors.white, Colors.black),
                const SizedBox(width: 8.0),
                buildCategoryChip('Drinks', Colors.white, Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryChip(String label, Color bgColor, Color textColor) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
      backgroundColor: bgColor,
      labelStyle: TextStyle(color: textColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: bgColor),
      ),
    );
  }
}


class BuildFoodList extends StatelessWidget {
  BuildFoodList({super.key});
  final List<Food> _foodList = FoodController().getFoodList();  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child:GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _foodList.length,
        itemBuilder: (context, index) {
          return BuildProductBox(food: _foodList[index]);
        },
      ));
    
  }
}

class BuildProductBox extends StatefulWidget {
  const BuildProductBox({Key? key, required this.food}) : super(key: key);

  final Food food;

  @override
  _BuildProductBoxState createState() => _BuildProductBoxState();
}

class _BuildProductBoxState extends State<BuildProductBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FoodItem(food: widget.food)),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  "assets/images/${widget.food.image}",
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: [
                          const Icon(
                            Icons.hourglass_bottom_outlined,
                            color: Colors.grey,
                          ),
                          Text("${widget.food.prepTime} mins"),
                        ],
                      ),
                      Text(
                        "\$ ${widget.food.price}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
