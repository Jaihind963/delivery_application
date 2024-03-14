import 'package:delivery_app/pages/detailspage.dart';
import 'package:delivery_app/widgets/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Hi Jaihind",
                    style: AppWidget.semiBoldTextStyle(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Delicious Food",
                style: AppWidget.headLineText(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Discover and get Great Food",
                style: AppWidget.lightText(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            showItems(),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(
                    right: 20, bottom: 10, top: 10, left: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(),
                          ),
                        );
                      },
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/salad2.png",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Vigge Taco Hash",
                                style: AppWidget.semiText(),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Fresh and Healthy",
                                style: AppWidget.lightText(),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "\$25",
                                style: AppWidget.semiBoldTextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/salad2.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Vigge Taco Hash",
                              style: AppWidget.semiText(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Fresh and Healthy",
                              style: AppWidget.lightText(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "\$25",
                              style: AppWidget.semiBoldTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/salad2.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Vigge Taco Hash",
                              style: AppWidget.semiText(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Fresh and Healthy",
                              style: AppWidget.lightText(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "\$25",
                              style: AppWidget.semiBoldTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/salad2.png",
                        height: 120,
                        width: 120,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: Text(
                              "Mediterranean Chickpea Salad",
                              style: AppWidget.semiText(),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Honey goot cheese",
                            style: AppWidget.lightText(),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "\$25",
                            style: AppWidget.semiBoldTextStyle(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItems() {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              icecream = true;
              pizza = false;
              salad = false;
              burger = false;
              setState(() {});
            },
            child: Container(
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: icecream ? Colors.black : Colors.white,
                  ),
                  child: Image.asset(
                    "assets/images/ice-cream.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                    color: icecream ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              icecream = false;
              pizza = true;
              salad = false;
              burger = false;
              setState(() {});
            },
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: pizza ? Colors.black : Colors.white,
                ),
                child: Image.asset(
                  "assets/images/pizza.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                  color: pizza ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              icecream = false;
              pizza = false;
              salad = true;
              burger = false;
              setState(() {});
            },
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: salad ? Colors.black : Colors.white,
                ),
                child: Image.asset(
                  "assets/images/salad.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                  color: salad ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              icecream = false;
              pizza = false;
              salad = false;
              burger = true;
              setState(() {});
            },
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: burger ? Colors.black : Colors.white,
                ),
                child: Image.asset(
                  "assets/images/burger.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                  color: burger ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
