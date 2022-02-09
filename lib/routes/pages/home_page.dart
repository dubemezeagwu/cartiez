import 'package:cartiez/helpers/category_card.dart';
import 'package:cartiez/helpers/search_form.dart';
import 'package:cartiez/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:cartiez/models/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          "Cartiez",
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic
          ),
        ),
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications),
              color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black)
            ),
            Text(
              "Check our collection for you!",
              style: TextStyle(
                fontSize: 18
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: defaultPadding
                ),
                child: SearchForm()),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children:
              List.generate(
                  sampleCategories.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: defaultPadding),
                        child: CategoryCard(
                  icon: sampleCategories[index].icon,
                  title: sampleCategories[index].title,
                  press: (){}),
                      )),),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrivals",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),),
                TextButton(
                  onPressed: () {  },
                  child: Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 154,
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius))
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: itemBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius))
                    ),
                    child: Image.asset(
                        "assets/images/product_0.png",
                      height: 150,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Short Sleeve Shirts",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: defaultPadding/4,),
                      Text(
                          "\$120",
                        style: Theme.of(context).textTheme.subtitle2,
                        ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

