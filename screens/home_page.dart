
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:new_project_1/models/category_model.dart';
import 'package:new_project_1/models/property_model.dart';
import 'package:new_project_1/screens/category_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'details_page.dart';


class HomePage extends StatefulWidget {

  const HomePage({Key?key}) :super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

 // get propertyModel => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          //Your Condition to render the widget
          if(_currentIndex == 0) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("images/user1.jpeg"),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wel Come Back",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption,
                              ),
                              Text(
                                "Koushik Sharma",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline6,
                              )
                            ],
                          ),
                          const Spacer(),
                          const Icon(LineIcons.bellAlt)
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8
                        ),
                        decoration: BoxDecoration(color: Colors.grey
                            .withOpacity(0.2),
                            borderRadius: BorderRadius.all(
                                Radius.circular(12))),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search...."
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 0.4,
                        ),
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryButton(
                            categoryModel: categories[index],);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Recommondation",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height:270,

                //         height: 400,
                //         width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: properties.length,
                          itemBuilder: (BuildContext context, int index) {
                            final PropertyModel propertyModel = properties[index];
                            return RecommendationCard(
                                propertyModel: propertyModel);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          else if(_currentIndex == 1)
            {
              //favorite Page
              return SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8
                          ),
                          decoration: BoxDecoration(color: Colors.grey
                              .withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search...."
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 600,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: properties.length,
                            itemBuilder: (BuildContext context, int index) {
                              final PropertyModel propertyModel = properties[index];
                              return RecommendationCard(
                                  propertyModel: propertyModel);
                            },
                          ),
                        )
                      ]
                    ),
                  ),
                ),
              );
            }
          else if(_currentIndex == 2)
          {
            return Scaffold(
              appBar: AppBar(
                title: Center(child: Text('Your Account')),
                actions: [
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      // Navigate to settings screen.
                    },
                  ),
                ],
                backgroundColor:Colors.cyan,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/user1.jpeg'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Koushik Sharma',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Android Developer | Flutter Enthusiast',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 20),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8
                          ),
                          decoration: BoxDecoration(color: Colors.grey
                              .withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "First Name"
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8
                          ),
                          decoration: BoxDecoration(color: Colors.grey
                              .withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Last Name"
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8
                          ),
                          decoration: BoxDecoration(color: Colors.grey
                              .withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email Id"
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8
                          ),
                          decoration: BoxDecoration(color: Colors.grey
                              .withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "City"
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8
                          ),
                          decoration: BoxDecoration(color: Colors.grey
                              .withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Pin Code"
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8
                          ),
                          decoration: BoxDecoration(color: Colors.grey
                              .withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "State"
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8
                          ),
                          decoration: BoxDecoration(color: Colors.grey
                              .withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Country",
                            ),
                          ),
                        ), // Display more profile-related information here.
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          else if(_currentIndex == 3)
          {
            //Setting Page
            return Scaffold(
              body:SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                height: 100
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage('images/user1.jpeg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Settings",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30
                                ),
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Icon(Icons.logout),
                                Text("Logout")
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height:20,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_circle,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Account Preferences",
                                style: TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.sign_language,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Sign in Security",
                                style: TextStyle(fontSize:20,
                                    fontWeight:FontWeight.bold,color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.visibility,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Visibility",
                                style: TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.privacy_tip,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Data Privacy",
                                style: TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_chart,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Advertising Data",
                                style: TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Notification",
                                style: TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Help Center",
                                style:TextStyle(fontWeight:FontWeight.normal,fontSize:15),),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Accessibilty",
                                style:TextStyle(fontWeight:FontWeight.normal,fontSize:15),),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Privacy Policy",
                                style:TextStyle(fontWeight:FontWeight.normal,fontSize:15),),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Recommendation Transparency",
                                style:TextStyle(fontWeight:FontWeight.normal,fontSize:15),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return SizedBox();
        }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12)
          ),
          child: SalomonBottomBar(
          unselectedItemColor:Colors.white,
            currentIndex:_currentIndex,
            onTap :(p0){
              setState(() {
                _currentIndex = p0;
              });
          },
            items: [
          ///Home
          SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Colors.purple,
    ),

    /// Likes
    SalomonBottomBarItem(
    icon: Icon(Icons.search),
    title: Text("Search"),
    selectedColor: Colors.pink,
    ),

    /// Search
    SalomonBottomBarItem(
    icon: Icon(Icons.person),
    title: Text("Profile"),
    selectedColor: Colors.orange,
    ),

    /// Profile
    SalomonBottomBarItem(
    icon: Icon(Icons.settings),
    title: Text("Settings"),
    selectedColor: Colors.teal,
    )
          ],
          ),
        ),
      ),
    );
  }
}
class RecommendationCard extends StatelessWidget{
  final PropertyModel propertyModel;

  const RecommendationCard({Key?key,
  required this.propertyModel
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap:() => Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => DetailsPage(propertyModel: propertyModel),
      ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 200,
          padding:EdgeInsets.all(16) ,
          margin:EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(
            height: 120,
            width:double.infinity,
        //    image: AssetImage("images/${propertyModel.images}"),
        //    image: AssetImage("images/${categoryModel.assetPath}"),
            image: AssetImage("images/villa4.jpeg"),
            fit:BoxFit.cover,
          ),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:const Color(0xffE5CE6A),
              borderRadius: BorderRadius.circular(16)
            ),
            child:Text(
              "FOR SALE",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
              const SizedBox(
                height: 6,
              ),
              Text(
                propertyModel.title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${propertyModel.rooms} rooms - ${propertyModel.area} square foots -${propertyModel.floors} floors",
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.bold
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget{
    final CategoryModel categoryModel;
    const CategoryButton({
      Key?key,
      required this.categoryModel}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder:(context) => CategoryPage(categoryModel: categoryModel),
        )
        );
      },
      child: Container(
        margin:const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration:BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12)),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categoryModel.title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w500
              ),
            ),
            Flexible(child:ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                height: 50,
                width: 50,
                image: AssetImage("images/${categoryModel.assetPath}"),
                fit:BoxFit.cover,
              ),
             )
            )
          ],
        ),
      ),
    );
  }
}




