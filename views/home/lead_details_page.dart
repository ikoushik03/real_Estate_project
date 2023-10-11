
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../models/lead.dart';


class DetailsPage extends StatelessWidget{
  final Lead lead;
  const DetailsPage({
    Key?key,
    required this.lead,
  }):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title:Text(lead.name,
            style:TextStyle(color: Colors.white),
          ),
          backgroundColor:Colors.blue,
        ),
        body: SingleChildScrollView(
          physics:BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
              child: Center(
                  child:Container(
                    height:850,
                    width: 550,
                    padding: const EdgeInsets.symmetric(horizontal:25,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70,border: Border.all(color: Colors.black87)),
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height:30,
                        ),
                        Text("Id : ${lead.id}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text("Name : ${lead.name}",
                                style:Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width:110,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // Handle WhatsApp button press
                                },
                                icon: Icon(
                                  FontAwesome.whatsapp,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              backgroundColor:Colors.greenAccent,
                              radius:10,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Mobile : ${lead.mobile}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Alt_Number : ${lead.altMobile}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Email : ${lead.email}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Stage : ${lead.stage}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Favorite : ${lead.favorite}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Campaign : ${lead.campaign}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Lead Source : ${lead.leadSource}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("InActive : ${lead.inactive}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Junk : ${lead.junk}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Project Proposal Count : ${lead.projectProposalCount}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Project Match Count : ${lead.projectMatchCount}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Site Visit Schedule Count : ${lead.siteVisitScheduledCount}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Site Visit Done Count : ${lead.siteVisitDoneCount}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Owner : ${lead.owner}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Owner Name : ${lead.ownerName}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("New : ${lead.leadNew}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Created By : ${lead.createdBy}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Agency : ${lead.agency}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Created Ts : ${lead.createdTs}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Modified Ts : ${lead.modifiedTs}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Notes : ${lead.notes}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  )
              ),
            ),
          ),
        )
    );
  }
}






