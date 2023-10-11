
import 'package:flutter/material.dart';
import 'package:real_estate_project/views/projects/project_datails_page.dart';
import '../../models/project.dart';


class ProjectItem extends StatelessWidget {
  final Project project;

  const ProjectItem({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectsPage(project: project),
          ),
        ),
        child: Container(
          height: 300,
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
              Text("Project :${project.project}",
                style:TextStyle(fontWeight:FontWeight.bold,fontSize:18,
                    color: Colors.blueGrey),),
              Text("Address :${project.addressLine1}",
                style:TextStyle(fontSize:18,
                    color: Colors.blueGrey),),
              Text("Landmark:${project.landmark}",
                style:TextStyle(fontSize:18,
                    color: Colors.blueGrey),),
              Text("City :${project.city}",
                style:TextStyle(fontSize:18,
                    color: Colors.blueGrey),),
              Text("Region :${project.region}",
                style:TextStyle(fontSize:18,
                    color: Colors.blueGrey),),
              Text("Country :${project.country}",
                style:TextStyle(fontSize:18,
                    color: Colors.blueGrey),),
              Text("Postal Code :${project.postalCode}",
                style:TextStyle(fontSize:18,
                    color: Colors.blueGrey),)
            ],
          ),
        )
    );
  }
}