import 'package:flutter/material.dart';

import '../../models/lead.dart';
import 'lead_details_page.dart';

class LeadItem extends StatelessWidget {
  final Lead lead;

  const LeadItem({Key? key, required this.lead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(lead: lead),
        ),
      ),
      // child: Container(
      //   height: 120,
      //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(20),
      //       color: Colors.white70,
      //       border: Border.all(color: Colors.black87)),
      //   margin: const EdgeInsets.all(12.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             "Id : ${lead.id.toString()}",
      //             style: const TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 18,
      //                 color: Colors.blueGrey),
      //           ),
      //           const CircleAvatar(
      //             backgroundColor: Colors.greenAccent,
      //             radius: 10,
      //           )
      //         ],
      //       ),
      //       Text(
      //         "Name : ${lead.name}",
      //         style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
      //       ),
      //       Text(
      //         "Mobile : ${lead.mobile}",
      //         style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
      //       ),
      //     ],
      //   ),
      // )
      // child: Padding(
      //   padding: const EdgeInsets.all(5),
      // child: Container(
      //   width: 300,
      //   height: 400,
      //   padding:EdgeInsets.all(16) ,
      //   margin:EdgeInsets.only(right: 8),
      //   // decoration: BoxDecoration(
      //   //   //color: Colors.grey.withOpacity(0.15),
      //   //   color: Colors.pink.withOpacity(0.15),
      //   //   color: Colors.black45.withOpacity(0.15),
      //   //   borderRadius: BorderRadius.circular(16),
      //   //
      //   // ),
      //   decoration: BoxDecoration(
      //       color: Colors.white70.withOpacity(0.15),
      //       borderRadius: BorderRadius.circular(16),
      //       border: Border.all(color:Colors.black38),
      //   ),
      //   child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [ClipRRect(
      //         borderRadius: BorderRadius.circular(12),
      //         child: Image(
      //           height: 200,
      //           width:double.infinity,
      //           //    image: AssetImage("images/${propertyModel.images}"),
      //           //    image: AssetImage("images/${categoryModel.assetPath}"),
      //           //image: AssetImage("images/villa4.jpeg"),
      //           image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5wYUbLO04r5LHe718NGwur3J9KC-5nvb2Kg&usqp=CAU"),
      //           fit:BoxFit.cover,
      //         ),
      //       ),
      //         const SizedBox(
      //           height:10,
      //         ),
      //         Container(
      //           padding: const EdgeInsets.all(16),
      //           decoration: BoxDecoration(
      //               color:const Color(0xffE5CE6A),
      //               borderRadius: BorderRadius.circular(16)
      //           ),
      //           child:Text(
      //             "FOR SALE",
      //             style: Theme.of(context).textTheme.subtitle2,
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         Text(
      //           lead.name,
      //           style: Theme.of(context).textTheme.subtitle1!.copyWith(
      //               fontWeight: FontWeight.bold
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 4,
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text("Owner Name : ${lead.ownerName}",style: TextStyle(
      //               fontWeight: FontWeight.w500,fontSize:13
      //             ),),
      //             const SizedBox(
      //               height: 4,
      //             ),
      //             Text("Contact Number : ${lead.mobile}",style: TextStyle(
      //                 fontWeight: FontWeight.w300,fontSize:13
      //             ),),
      //             const SizedBox(
      //               height: 4,
      //             ),
      //             Text("Alt Contact Number : ${lead.altMobile}",style: TextStyle(
      //                 fontWeight: FontWeight.w300,fontSize:13
      //             ),),
      //             const SizedBox(
      //               height: 4,
      //             ),
      //             Text("Stage : ${lead.stage}",style: TextStyle(
      //                 fontWeight: FontWeight.w300,fontSize:13
      //             ),)
      //           ],
      //         )
      //         // Text(
      //         //   "Owner Name :   - ${} Mobile  -${lead.altMobile} Alt Mobile",
      //         //   style: Theme.of(context).textTheme.caption!.copyWith(
      //         //       fontWeight: FontWeight.bold
      //         //   ),
      //         // )
      //       ]
      //   ),
      // ),

      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white70,
            border: Border.all(color: Colors.black87)),
        margin: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Id : ${lead.id.toString()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blueGrey),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  radius: 10,
                )
              ],
            ),
            Text(
              "Name : ${lead.name}",
              style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            Text(
              "Mobile : ${lead.mobile}",
              style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}