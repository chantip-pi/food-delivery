import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildRestaurant(restaurant) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: Colors.white,
            child: InkWell(
              onTap: () {
                // Handle card tap if needed
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16)),
                      child: Image.asset(
                        "assets/images/${restaurant.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.resName,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.deepOrange),
                                  Text(
                                    '${restaurant.stars.toStringAsFixed(1)} (${restaurant.reviews})',
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Row(
                                children: [
                                  const Icon(Icons.motorcycle,
                                      color: Colors.black54),
                                  Text(
                                    '${restaurant.distance.toStringAsFixed(2)} km \$${restaurant.fee}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return ListView(shrinkWrap: true, children: [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          "Welcome, \nLet's order some food!",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 30, left: 10, right: 10),
        child: SizedBox(
          height: 150,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.orange,
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "Food",
                                style: TextStyle(
                                    fontSize: 32, color: Colors.white),
                              )),
                          Icon(
                            Icons.food_bank,
                            size: 50,
                            color: Colors.white,
                          ),
                        ])),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.teal[300]),
                          height: double.infinity,
                          width: double.infinity,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("Orders",
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white)),
                              ),
                              Icon(
                                Icons.timer,
                                size: 36,
                                color: Colors.white,
                              )
                            ],
                          )),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.red[500],
                          ),
                          height: double.infinity,
                          width: double.infinity,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("Mart",
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white)),
                              ),
                              Icon(
                                Icons.local_grocery_store,
                                size: 36,
                                color: Colors.white,
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 5, right: 5),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
              child: SizedBox(
                width: 350,
                child: Image.asset('assets/images/advertisement1.jpg',
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
              child: SizedBox(
                width: 350,
                child: Image.asset('assets/images/advertisement2.jpg',
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
              child: SizedBox(
                width: 350,
                child: Image.asset('assets/images/advertisement3.jpg',
                    fit: BoxFit.fill),
              ),
            ),
          ],
        ),
      ),
      Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Populars",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          buildRestaurant(RestaurantInfo(
              resName:
                  'Not Sweet as Sherliam\'s "Catch me if you can, Mr.Holmes"',
              reviews: 221,
              stars: 5.0,
              distance: 2.5,
              fee: 5,
              image: 'restaurant1.jpg')),
          buildRestaurant(RestaurantInfo(
            resName: 'Savory Delights',
            reviews: 150,
            stars: 4.8,
            distance: 3.2,
            fee: 7,
            image: 'restaurant2.jpg',
          )),
          const SizedBox(height: 40),
        ],
      ),
    ]);
  }
}

