import 'package:cartiez/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../../data/models/category.dart';
import '../../../helpers/category_card.dart';
import '../../../helpers/product_list.dart';
import '../../../helpers/search_form.dart';
import '../../../helpers/section_tile.dart';

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
        backgroundColor: Constants.bgColor,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Constants.defaultPadding / 2),
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
                  vertical: Constants.defaultPadding
                ),
                child: SearchForm()),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sampleCategories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: Constants.defaultPadding),
                    child: CategoryCard(
                        icon: sampleCategories[index].icon,
                        title: sampleCategories[index].title,
                        press: (){}),
                  )),
            ),
            SizedBox(
              height: Constants.defaultPadding,
            ),
            SectionTile(title: "New Arrivals", pressSeeAll: () { },),
            SizedBox(
              height: 250,
                child: ProductList()),
            SectionTile(title: "Popular", pressSeeAll: (){},),
            SizedBox(
              height: 250,
                child: ProductList())
          ],
        ),
      ),
    );
  }
}







