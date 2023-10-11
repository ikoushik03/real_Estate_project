import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:new_project_1/models/property_model.dart';

class DetailsPage extends StatelessWidget{
  final PropertyModel propertyModel;
  const DetailsPage({
    Key?key,
    required this.propertyModel,
  }):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselwithIndicatorDemo(
                propertyModel: propertyModel,
              ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Row(
                      children: [
                        Text(
                          propertyModel.title,
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const Spacer(),
                        Icon(LineIcons.starAlt,
                        color: Colors.red),
                        Text(
                          propertyModel.rating.toString(),
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                      const SizedBox(
                        height: 12,
                      ),
                     Text(propertyModel.subTitle.toString(),
                     style: Theme.of(context).textTheme.subtitle2!.copyWith(
                     color: Colors.black.withOpacity(0.5)),
                     ),
                      const SizedBox(
                        height:32,
                      ),
                       SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Row(
                           children: [
                             specWidget(
                                 context,
                                 LineIcons.home,"${propertyModel.rooms} Rooms"),
                             specWidget(
                                 context,
                                 LineIcons.areaChart,"${propertyModel.area} Sqft"),
                             specWidget(
                                 context,
                                 LineIcons.building,"${propertyModel.floors} Floors"),
                           ],
                         ),
                       ),
                      const SizedBox(
                        height:32,
                      ),
                      Text(
                        "Descriptions",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height:12,
                      ),
                      Text(
                        propertyModel.details,
                        style:Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                          letterSpacing: 1.1,
                          height: 1.4
                        ),
                      ),
                      const SizedBox(
                        height:100,
                      ),
                    ]
                  ),
                )
              ],
            ),
          ),
          Positioned(
              left:20,
              right:0,
              bottom:0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
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
                            color: Colors.black.withOpacity(0.3),),
                          boxShadow: [BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(4,4),
                            blurRadius:20,
                            spreadRadius:4
                          )]
                        ),
                        child: Icon(LineIcons.facebookMessenger),
                      ),
                    )
                    ,GestureDetector(
                      onTap:(){},
                        child:Container(
                          margin: const EdgeInsets.all(12),
                          padding: const EdgeInsets.only(right:8),
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.3),),
                              boxShadow: [BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(4,4),
                                  blurRadius:20,
                                  spreadRadius:4
                              )]
                          ),
                          child: Icon(LineIcons.heart),
                        ),
                    ),
                    Expanded(
                      child:GestureDetector(
                        onTap: (){},
                        child: Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.only(right:8),
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.3),),
                            boxShadow: [BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(4,4),
                                blurRadius:20,
                                spreadRadius:4
                            )]
                        ),
                        child:  Center(
                          child:  Text(
                              "BUY NOW",
                            style:Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Colors.white,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                        ),
                    ),
                      ),
                    )
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }

  Widget specWidget(BuildContext context,IconData iconData,String text) {
    return Padding(
      padding: const EdgeInsets.only(right:12.0),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color(0xffE7CD6B),
                    shape: BoxShape.circle
                ),
                child:Icon(iconData),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                  text,
                  style: Theme.of(context).textTheme.subtitle1
              ),
            ],
          )
        ],
      ),
    );
  }
}

//This is the first way to do this .Instead of extracting widget we can make a function

// class DetailsSpecItems extends StatelessWidget {
//   final PropertyModel propertyModel;
//
//   const DetailsSpecItems({
//     Key?key,
//     required this.propertyModel
//   }) :super(key: key);
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Color(0xffE7CD6B),
//               shape: BoxShape.circle
//             ),
//             child:const Icon(Icons.home),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Text(
//             "${propertyModel.rooms} Rooms",
//             style: Theme.of(context).textTheme.subtitle1
//             ),
//           const SizedBox(
//             width: 8,
//           ),
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//                 color: Color(0xffE7CD6B),
//                 shape: BoxShape.circle
//             ),
//             child:const Icon(Icons.home),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Text(
//               "${propertyModel.area} Area",
//               style: Theme.of(context).textTheme.subtitle1
//           ),
//
//         ],
//       ),
//     );
//   }
// }




class CarouselwithIndicatorDemo extends StatefulWidget{
  final PropertyModel propertyModel;
  const CarouselwithIndicatorDemo({
    Key?key,
    required this.propertyModel,
  }): super(key: key);

  @override
  _CarouselwithIndicatorDemoState createState() =>
      _CarouselwithIndicatorDemoState();
}

class _CarouselwithIndicatorDemoState extends State <CarouselwithIndicatorDemo>{
    int _current =0;
    final CarouselController _controller = CarouselController();
    @override
    Widget build(BuildContext context)
    {
      return Column(
        children: [
            CarouselSlider(
              carouselController: _controller,
              items: widget.propertyModel.images
                  .map((item) => Image.asset(
                item,
                fit: BoxFit.cover,
                width: 1000,
              ))
                .toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height/1.7,
                autoPlay:true ,
                enlargeCenterPage:false,
                onPageChanged:(index,reason){
                  setState(() {
                    _current =index;
                  });
                }
              ),
            ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: widget.propertyModel.images.asMap().entries.map((entry)
            {
              return GestureDetector(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal:4,vertical:12),
                    width:4,
                    height:_current==entry.key? 6 : 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color:Theme.of(context).brightness==Brightness.dark
                        ? Colors.white : Colors.black
                        .withOpacity(
                          _current==entry.key?0.5:0.2,
                        )
                    ),
                  ),
              );
            }).toList()
            ,
          )
          ,
        ],
      );
    }
}

