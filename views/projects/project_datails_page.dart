
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/project.dart';



class ProjectsPage extends StatelessWidget{
  final Project project;
  const ProjectsPage({
    Key?key,
    required this.project,
  }):super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title:Text(project.id.toString(),
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
                        Text("Id : ${project.id}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Address 1 : ${project.addressLine1}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Address 2 : ${project.addressLine2}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Landmark : ${project.landmark}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("City : ${project.city}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Region : ${project.region}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("PostalCode : ${project.postalCode}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Country : ${project.country}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Latitude : ${project.latitude}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Longitude : ${project.longitude}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("MapLink : ${project.mapLink}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("CreatedTs : ${project.createdTs}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("ModifiedTs : ${project.modifiedTs}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Project : ${project.project}",
                          style:Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     String? mapLink = project.mapLink;
                        //     launchMap(mapLink);
                        //   },
                        //   child: Text('Open in Google Maps'),
                        // )
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






