
import 'package:flutter/material.dart';
import 'package:real_estate_project/views/projects/project_item.dart';
import '../../models/project.dart';
import '../../models/project_responce.dart';
import '../../services/remote_service.dart';


class SecondHomePage extends StatefulWidget {
  const SecondHomePage({super.key});


  @override
  State<StatefulWidget> createState() => _SecondHomePage();
}

class _SecondHomePage extends State<SecondHomePage> {
  Future<List<Project?>?>? future;
  int _page = 1;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;

  final ScrollController _controller = ScrollController();
  //String? _nextPageUrl;


  bool _isSearchEmpty = false;
  List<Project?>? _projects = [];
  List<Project?>? _searchedProjects =[];
  TextEditingController _searchController = TextEditingController();


  Future<List<Project?>?>? loadData() async {
    var response = await RemoteService().getAsync(
        "project_address/?page=$_page", null, (json) => projectResponseFromJson(json));
    var projectResponse = response.data;
    await Future.delayed(const Duration(seconds: 3));
    return projectResponse?.results;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      loadMoreData();
    });
    future = loadData();
    _searchedProjects = _projects;
  }

  // void filterLeadsByName(String name) {
  //   setState(() {
  //     if (name.isNotEmpty) {
  //       _searchedLeads = _leads
  //           ?.where((lead) =>
  //           lead.name.toLowerCase().startsWith(name.toLowerCase()))
  //           .toList();
  //     } else {
  //       _searchedLeads = null; // Display the full list when search query is empty
  //     }
  //   });
  // }

  // void filterProjectsByLandmark(String landmark) {
  //   setState(() {
  //     if (landmark.isNotEmpty) {
  //       _searchedProjects = _projects
  //           ?.where((project) =>
  //           project!.landmark!.toLowerCase().startsWith(landmark.toLowerCase()))
  //           .toList();
  //     } else {
  //       _searchedProjects = null; // Display the full list when search query is empty
  //     }
  //   });
  // }

  // void filterProjectsByLandmark(String landmark) {
  //   setState(() {
  //     if (landmark.isNotEmpty) {
  //       final startsWithQuery = _projects
  //           ?.where((project) =>
  //           project!.landmark!.toLowerCase().startsWith(landmark.toLowerCase()))
  //           .toList();
  //       final containsQuery = _projects
  //           ?.where((project) =>
  //       project!.landmark!.toLowerCase().startsWith(landmark.toLowerCase()) &&
  //           project.landmark!.toLowerCase().contains(landmark.toLowerCase()))
  //           .toList();
  //
  //       _searchedProjects = [...startsWithQuery ?? [], ...containsQuery ?? []];
  //     } else {
  //       _searchedProjects = null; // Display the full list when search query is empty
  //     }
  //   });
  // }



  // void filterProjectsByLandmark(String landmark) {
  //   setState(() {
  //     if (landmark.isNotEmpty) {
  //       _searchedProjects = _projects
  //           ?.where((project) =>
  //           project!.landmark!.toLowerCase().startsWith(landmark.toLowerCase()))
  //           .toList();
  //
  //       if (_searchedProjects == null || _searchedProjects!.isEmpty) {
  //         _isSearchEmpty = true; // Set _isSearchEmpty to true when there are no matches
  //         _searchedProjects = [];
  //       } else {
  //         _isSearchEmpty = false; // Reset _isSearchEmpty when there are matches
  //         _searchedProjects!.sort((a, b) => a!.landmark!.toLowerCase().compareTo(b!.landmark!.toLowerCase())); // Sort alphabetically (case-insensitive)
  //       }
  //     } else {
  //       _searchedProjects = null; // Display the full list when search query is empty
  //       _isSearchEmpty = false; // Reset _isSearchEmpty when the query is empty
  //     }
  //   });
  // }


  /// Two types of filtered is used -1) based on Alphabetical order 2) based on letter contains
  void filterLeadsByLandmarkPartialMatch(String landmark) {
    setState(() {
      if (landmark.isNotEmpty) {
        _searchedProjects = _projects
            ?.where((project) =>
            project!.landmark!.toLowerCase().contains(landmark.toLowerCase()))
            .toList();

        if (_searchedProjects == null || _searchedProjects!.isEmpty) {
          _isSearchEmpty = true;
          _searchedProjects = [];
        } else {
          _isSearchEmpty = false;
        }
      } else {
        _searchedProjects = null;
        _isSearchEmpty = false;
      }
    });
  }


  void loadMoreData() async {
    if (_hasNextPage &&
        !_isLoadMoreRunning &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      _page++;

      var newProjects = await loadData();
      if(newProjects!.isEmpty){
        setState(() {
          _hasNextPage = false;
        });
      }else{
        setState(() {
          _projects?.addAll(newProjects);
        });
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("PROJECTS")),
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            _projects = snapshot.data;
            return Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        border: Border.all(color: Colors.black87),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(12))),
                    child:  TextField(
                      controller: _searchController,
                      onChanged:(landmark){
                        filterLeadsByLandmarkPartialMatch(landmark);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search...."),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: (_searchedProjects?.length ?? 0) > 0 ? _searchedProjects!.length : (_projects?.length ?? 0),
                      //itemCount: _projects!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        // final Project? project = snapshot.data![index];
                        // return ProjectItem(project: project!);

                        //return ProjectItem(project: _projects![index]);
                        //return ProjectItem(project: _projects![index]!);

                        if (_isSearchEmpty) {
                          return Container();
                        }

                        // if (_searchedProjects != null && _searchedProjects!.isNotEmpty && index < _searchedProjects!.length) {
                        //   return ProjectItem(project: _searchedProjects![index]!);
                        // } else if (_projects != null && _projects!.isNotEmpty && index < _projects!.length) {
                        //   return ProjectItem(project: _projects![index]!);
                        // } else {
                        //   return Container();
                        // }

                        else if (_searchedProjects != null && _searchedProjects!.isNotEmpty && index < _searchedProjects!.length) {
                          return ProjectItem(project: _searchedProjects![index]!);
                        } else if (_projects != null && _projects!.isNotEmpty && index < _projects!.length) {
                          return ProjectItem(project: _projects![index]!);


                          // } else if (_searchedProjects != null && _searchedProjects != _projects) {
                          //   return Container();
                          // }

                        }
                      },
                    ),
                  ),
                  if (_isLoadMoreRunning)
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  // if (!_hasNextPage)
                  //   Container(
                  //     padding: const EdgeInsets.only(top: 30, bottom: 40),
                  //     color: Colors.amber,
                  //     child: const Center(
                  //       child: Text("You have fetched all of the content"),
                  //     ),
                  //   )
                ],
              ),
            );
          }
        },
      ),
    );
  }


}
