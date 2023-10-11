import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:new_project_1/models/category_model.dart';
import 'package:new_project_1/models/property_model.dart';


import 'details_page.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryPage({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios,
                      ),
                    ),
                    Text(categoryModel.title,
                    style:Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
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
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style:Theme.of(context).textTheme.headline6,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        "See All",
                        style:Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                ListView.builder(
                  shrinkWrap:true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemCount: properties.length,
                    itemBuilder:(BuildContext context,int index){
                    return ExpandedRecommendationCard(
                        propertyModel:properties[index]);
                    }
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedRecommendationCard extends StatelessWidget{
  final PropertyModel propertyModel;

  const ExpandedRecommendationCard({Key?key,
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
      child: Container(
        width: double.infinity,
        padding:EdgeInsets.all(16) ,
        margin:EdgeInsets.only(right: 8 ,bottom: 12,top: 12),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                height: 200,
                width:double.infinity,
                image: AssetImage("images/villa1.jpeg"),
                fit:BoxFit.cover,
              ),
            ),
              const SizedBox(
                height:12,
              ),
              Row(
                children: [
                  Text(
                    propertyModel.title,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                      LineIcons.starAlt,
                      color: Colors.red),
                  // Text(
                  //   propertyModel.rating.toString(),
                  //   style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "${propertyModel.rooms} rooms - ${propertyModel.area} square foots -${propertyModel.floors} floors",
                style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child:GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: const EdgeInsets.all(12),
                          padding: const EdgeInsets.only(right:8),
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              color: Color(0xffE5CE6A),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.1),),
                              boxShadow: [BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0,5),
                                  blurRadius:20,
                                  spreadRadius:4
                              )]
                          ),
                          child:  Center(
                            child:  Text(
                              "BUY NOW",
                              style:Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Colors.black,
                                fontWeight:FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:(){},
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.only(right:8),
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.1),),
                            boxShadow: [BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0,5),
                                blurRadius:20,
                                spreadRadius:4
                            )]
                        ),
                        child: Icon(LineIcons.whatSApp),
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}