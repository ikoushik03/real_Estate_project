
import 'package:controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate_project/components/switch.dart';
import '../../components/riq_app_bar.dart';
import '../../config/color_keys.dart';
import '../../form_page.dart';

import '../../models/lead.dart';
import '../../models/lead_responce.dart';
import '../../services/remote_service.dart';
import 'lead_item.dart';

import 'package:connectivity_plus/connectivity_plus.dart';


class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  //final _searchTextController = TextEditingController();

  //late ScrollController _scrollController;



  Future<List<Lead>?>? future;
  int _page = 1;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  final ScrollController _controller = ScrollController();

  // String? _nextPageUrl;
  // String searched = "";

  //bool _isNotFoundDisplayed = false;
  bool _isSearchEmpty = false;
  List<Lead>? _searchedLeads;
  List<Lead>? _leads = [];
  List<Lead>? searchResult = [];
  TextEditingController _searchController = TextEditingController();



  Future<List<Lead>?> loadData() async {
    var response = await RemoteService().getAsync(
        "rda_lead/?page=$_page", null, (json) => leadResponseFromJson(json));
    var leadResponse = response.data;
    await Future.delayed(const Duration(seconds: 3));
    return leadResponse?.results;
  }


  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      loadMoreData();
    });
    future = loadData();
    _searchedLeads = _leads; // Initialize _searchedLeads with all leads
  }


  ///This method is work only based on letter contains in name///
  // void filterLeadsByName(String name) {
  //   setState(() {
  //     if (name.isNotEmpty) {
  //       _searchedLeads = _leads
  //           ?.where((lead) =>
  //           lead.name.toLowerCase().contains(name.toLowerCase()))
  //           .toList();
  //     } else {
  //       _searchedLeads = null; // Display the full list when search query is empty
  //     }
  //   });
  // }

  ///This method is work only based on letter startsWith contains in name///
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


  ///This method is for getting list in alphabetical and that name doesnot exist in the list it will show empty list.
  // void filterLeadsByName(String name) {
  //   setState(() {
  //     if (name.isNotEmpty) {
  //       _searchedLeads = _leads
  //           ?.where((lead) =>
  //           lead.name.toLowerCase().startsWith(name.toLowerCase()))
  //           .toList();
  //
  //       if (_searchedLeads == null || _searchedLeads!.isEmpty) {
  //         _isSearchEmpty = true; // Set _isSearchEmpty to true when there are no matches
  //         _searchedLeads = [];
  //       } else {
  //         _isSearchEmpty = false; // Reset _isSearchEmpty when there are matches
  //         _searchedLeads!.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())); // Sort alphabetically (case-insensitive)
  //       }
  //     } else {
  //       _searchedLeads = null; // Display the full list when search query is empty
  //       _isSearchEmpty = false; // Reset _isSearchEmpty when the query is empty
  //     }
  //   });
  // }



  void filterLeadsByNamePartialMatch(String name) {
    setState(() {
      if (name.isNotEmpty) {
        _searchedLeads = _leads
            ?.where((lead) =>
            lead.name.toLowerCase().contains(name.toLowerCase()))
            .toList();

        if (_searchedLeads == null || _searchedLeads!.isEmpty) {
          _isSearchEmpty = true;
          _searchedLeads = [];
        } else {
          _isSearchEmpty = false;
        }
      } else {
        _searchedLeads = null;
        _isSearchEmpty = false;
      }
    });
  }




  /*

  The function is called whenever the user enters text into the search bar.

It checks if the search text (name) is not empty.

If the search text is not empty, it performs two types of filtering on the list of leads (_leads):

Starts with query: It finds leads whose names start with the search text. For example, if you search for 'A,' it finds all leads whose names start with 'A.'
Contains query: It finds leads whose names contain the search text anywhere in the name but don't start with it. For example, if you search for 'Kumar,' it finds leads with names like 'Anil Kumar M.'
It combines the results from both filtering operations. First, it adds the leads that start with the search text (from "starts with query"), and then it adds the leads that contain the search text (from "contains query"). This way, names starting with the search text will appear first in the list, followed by names containing the search text.

If the search text is empty, it means the user cleared the search bar, so it sets _searchedLeads to null to display the full list of leads again.

In summary, this function sorts and displays leads based on whether their names start with the search text or contain the search text, ensuring that you see relevant results when searching for both partial and starting text matches
   */


  ///But this is the final method work on both case ///
  // void filterLeadsByName(String name) {
  //   setState(() {
  //     if (name.isNotEmpty) {
  //       final startsWithQuery = _leads
  //           ?.where((lead) =>
  //           lead.name.toLowerCase().startsWith(name.toLowerCase()))
  //           .toList();
  //       final containsQuery = _leads
  //           ?.where((lead) =>
  //       !lead.name.toLowerCase().startsWith(name.toLowerCase()) &&
  //           lead.name.toLowerCase().contains(name.toLowerCase()))
  //           .toList();
  //
  //       _searchedLeads = [...startsWithQuery ?? [], ...containsQuery ?? []];
  //     } else {
  //       _searchedLeads = null; // Display the full list when search query is empty
  //     }
  //   });
  // }

  ///This method is for both Start with and for Alphabetical order
  // void filterLeadsByName(String name) {
  //   setState(() {
  //     if (name.isNotEmpty && name.length == 1) {
  //       final filteredLeads = _leads
  //           ?.where((lead) =>
  //           lead.name.toLowerCase().startsWith(name.toLowerCase()))
  //           .toList();
  //
  //       // Sort the filtered leads by name in alphabetical order
  //       if (filteredLeads != null) {
  //         filteredLeads.sort((a, b) => a.name.compareTo(b.name));
  //       }
  //
  //       _searchedLeads = filteredLeads;
  //     } else {
  //       _searchedLeads = null; // Display the full list when the character is empty or not valid
  //     }
  //   });
  // }

  ///This method work for both name and id ///
  // void filterLeadsByNameOrId(String query) {
  //   setState(() {
  //     if (query.isNotEmpty) {
  //       final startsWithQuery = _leads
  //           ?.where((lead) =>
  //       lead.name.toLowerCase().startsWith(query.toLowerCase()) ||
  //           (lead.id != null && lead.id!.toString().toLowerCase() == query.toLowerCase()))
  //           .toList();
  //       final containsQuery = _leads
  //           ?.where((lead) =>
  //       !lead.name.toLowerCase().startsWith(query.toLowerCase()) &&
  //           !(lead.id != null && lead.id!.toString().toLowerCase() == query.toLowerCase()) &&
  //           (lead.name.toLowerCase().contains(query.toLowerCase()) ||
  //               (lead.id != null && lead.id!.toString().toLowerCase().contains(query.toLowerCase()))))
  //           .toList();
  //
  //       _searchedLeads = [...startsWithQuery ?? [], ...containsQuery ?? []];
  //     } else {
  //       _searchedLeads = null; // Display the full list when search query is empty
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _controller.addListener(() {
  //     loadMoreData();
  //   });
  //   future = loadData();
  //   _searchController.addListener(() {
  //     filterSearchResults(_searchController.text);
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _controller.addListener(() {
  //     loadMoreData();
  //   });
  //   future = loadData();
  //
  //   _searchController.addListener(() {
  //     filterSearchResults(_searchController.text);
  //   });
  // }


  ///This method is used for loading the more data ///
  void loadMoreData() async {
    if (_hasNextPage &&
        !_isLoadMoreRunning &&
        _controller.position.extentAfter < 300) {

      setState(() {
        _isLoadMoreRunning = true;
      });

      _page++;

      var newLeads = await loadData();
      if(newLeads!.isEmpty){
        setState(() {
          _hasNextPage = false;
        });
      }else{
        setState(() {
          _leads?.addAll(newLeads);
        });
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }





  // @override
  // void dispose()
  // {
  //   //_searchController.removeListener(filterSearchResults);
  //   _searchController.dispose();
  //   super.dispose();
  // }

  // void filterLeads(String query) {
  //   setState(() {
  //     if (query.isEmpty) {
  //       // If the query is empty, show all leads
  //       _searchedLeads = _leads;
  //     } else {
  //       // Filter leads by name containing the query
  //       _searchedLeads = _leads
  //           ?.where((lead) =>
  //           lead.name.toLowerCase().contains(query.toLowerCase()))
  //           .toList();
  //     }
  //   });
  // }


  // void filterLeadsByName(String name) {
  //   setState(() {
  //     _searchedLeads = _leads
  //         ?.where((lead) =>
  //         lead.name.toLowerCase().contains(name.toLowerCase()))
  //         .toList();
  //   });
  // }

  // void filterLeadsByName(String name) {
  //   setState(() {
  //     if (name.isNotEmpty) {
  //       _searchedLeads = _leads
  //           ?.where((lead) =>
  //           lead.name.toLowerCase().contains(name.toLowerCase()))
  //           .toList();
  //     } else {
  //       _searchedLeads = null; // Display the full list when search query is empty
  //     }
  //   });


  // void filterSearchResults(String query) {
  //   List<Lead> searchResults = [];
  //   if (query.isNotEmpty) {
  //     _leads?.forEach((lead) {
  //       if (lead.name.toLowerCase().contains(query.toLowerCase())) {
  //         searchResults.add(lead);
  //       }
  //     });
  //   } else {
  //     searchResults = _leads!;
  //   }
  //   setState(() {
  //     searchResult = searchResults;
  //   });
  // }

  // void filterSearchResults(String query) {
  //   print(_searchController.text);
  //   List<Lead> searchResults = [];
  //   if (query.isNotEmpty) {
  //     _leads?.forEach((lead) {
  //       if (lead.name.toLowerCase().contains(query.toLowerCase())) {
  //         searchResults.add(lead);
  //       }
  //     });
  //   } else {
  //     searchResults = _leads!;
  //   }
  //
  //   setState(() {
  //     _searchResults = searchResults;
  //   });
  // }

  // void filterSearchResults(String query) {
  //   List<Lead> searchResults = [];
  //
  //   if (query.isNotEmpty) {
  //     searchResults = _leads
  //         ?.where((lead) => lead.name.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   } else {
  //     searchResults = _leads!;
  //   }
  //
  //   setState(() {
  //     _searchResults = searchResults;
  //   });
  // }


  // void loadMoreData() async {
  //   if (_hasNextPage &&
  //       !_isLoadMoreRunning &&
  //       _controller.position.extentAfter < 300) {
  //
  //     setState(() {
  //       _isLoadMoreRunning = true;
  //     });
  //
  //     _page++;
  //
  //     var newLeads = await loadData();
  //     if(newLeads!.isEmpty){
  //       setState(() {
  //         _hasNextPage = false;
  //       });
  //     }else{
  //       setState(() {
  //         _leads?.addAll(newLeads);
  //       });
  //     }
  //
  //     setState(() {
  //       _isLoadMoreRunning = false;
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Center(child: Text("LEADS")),
    //   ),
    //   body: FutureBuilder(
    //     future: future,
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Text('Error: ${snapshot.error}');
    //       } else {
    //         _leads = snapshot.data;
    //         return Padding(
    //           padding:
    //           const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 padding:
    //                 const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
    //                 decoration: BoxDecoration(
    //                     color: Colors.grey.withOpacity(0.2),
    //                     border: Border.all(color: Colors.black87),
    //                     borderRadius:
    //                     const BorderRadius.all(Radius.circular(12))),
    //                 child:  TextField(
    //                   controller: _searchController,
    //                   onChanged:(name){
    //                     filterLeadsByNamePartialMatch(name);
    //                   },
    //                   decoration: InputDecoration(
    //                       border: InputBorder.none,
    //                       prefixIcon: Icon(Icons.search),
    //                       hintText: "Search...."),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 15,
    //               ),
    //               // Row(
    //               //   children: [
    //               //     const CircleAvatar(
    //               //       backgroundImage:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQb-9dfAu41XjR3HWAPStCdqQYh-PM_lk3vQ&usqp=CAU")
    //               //     ),
    //               //     const SizedBox(
    //               //       width: 12,
    //               //     ),
    //               //     Column(
    //               //       crossAxisAlignment: CrossAxisAlignment.start,
    //               //       children: [
    //               //         Text(
    //               //           "Wel Come Back",
    //               //           style: Theme
    //               //               .of(context)
    //               //               .textTheme
    //               //               .caption,
    //               //         ),
    //               //         Text(
    //               //           "Koushik Sharma",
    //               //           style: Theme
    //               //               .of(context)
    //               //               .textTheme
    //               //               .headline6,
    //               //         )
    //               //       ],
    //               //     ),
    //               //     const Spacer(),
    //               //     const Icon(LineIcons.bellAlt)
    //               //   ],
    //               // ),
    //               // SizedBox(
    //               //   height:15,
    //               // ),
    //               // Row(
    //               //   children: [
    //               //     Icon((Icons.location_on),color: Colors.blue.shade700,),
    //               //     SizedBox(
    //               //       width:5
    //               //     ),
    //               //     Text("Mysuru , Karnataka",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black87,fontSize:15),),
    //               //     const Spacer(),
    //               //     const Icon(LineIcons.bellAlt)
    //               //   ],
    //               // ),
    //               // const SizedBox(
    //               //   height: 30,
    //               // ),
    //               // Container(
    //               //   padding: const EdgeInsets.symmetric(
    //               //       vertical: 4,
    //               //       horizontal: 8
    //               //   ),
    //               //   decoration: BoxDecoration(color: Colors.grey
    //               //       .withOpacity(0.2),
    //               //       borderRadius: BorderRadius.all(
    //               //           Radius.circular(12))),
    //               //   child: TextField(
    //               //     controller: _searchController,
    //               //     onChanged:(name){
    //               //       filterLeadsByName(name);
    //               //     },
    //               //     decoration: InputDecoration(
    //               //         border: InputBorder.none,
    //               //         prefixIcon: Icon(Icons.search),
    //               //         hintText: "Search...."
    //               //     ),
    //               //   ),
    //               // ),
    //               // const SizedBox(
    //               //   height: 15,
    //               // ),
    //               // SelectCategory(),
    //               // const SizedBox(
    //               //   height: 15,
    //               // ),
    //               // Row(
    //               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               //   children: [
    //               //     Text(
    //               //       "Recommendation",
    //               //       style: Theme
    //               //           .of(context)
    //               //           .textTheme
    //               //           .headline6,
    //               //     ),
    //               //     TextButton(onPressed:(){}, child:Text(
    //               //       "See All",
    //               //       style:TextStyle(fontWeight:FontWeight.bold,color: Colors.black87),
    //               //     ))
    //               //   ],
    //               // ),
    //               // const SizedBox(
    //               //   height: 30,
    //               // ),
    //               Expanded(
    //                   child: ListView.builder(
    //                       physics:BouncingScrollPhysics(),
    //                       controller: _controller,
    //                       /// If _searchedLeads is null or doesn't exist,
    //                       /// it then checks if _leads exists and uses its length.
    //                       /// If neither _searchedLeads nor _leads exist, it defaults to zero.
    //                       itemCount: (_searchedLeads?.length ?? 0) > 0 ? _searchedLeads!.length : (_leads?.length ?? 0),
    //                       // itemCount: _searchResults?.length ?? 0,
    //                       //itemCount: _leads?.length,
    //                       scrollDirection: Axis.vertical,
    //                       itemBuilder: (BuildContext context, int index) {
    //                         // if(_searchController.text.isEmpty)
    //                         //   {
    //                         //     return LeadItem(lead: _leads![index]);
    //                         //   }
    //                         // else if(positon.toLowerCase().contains(_searchController.text.toLowerCase()))
    //                         //   {
    //                         //     return LeadItem(lead: _leads![index]);
    //                         //   }
    //                         // else
    //                         //   {
    //                         //     return Container();
    //                         //   }
    //
    //
    //                         //return LeadItem(lead: _searchedLeads![index]);
    //
    //
    //                         //return LeadItem(lead: _leads![index]);
    //
    //
    //                         if (_isSearchEmpty && _searchedLeads != _leads) {
    //                           print("Not found");
    //                           return Container();
    //                         }
    //
    //                         else if (_searchedLeads != null &&
    //                             _searchedLeads!.isNotEmpty && index <
    //                             _searchedLeads!.length) {
    //                           print("Filtered List");
    //                           return LeadItem(lead: _searchedLeads![index]);
    //                         }
    //
    //                         else if (_leads != null && _leads!.isNotEmpty &&
    //                             index < _leads!.length) {
    //                           print("Main List");
    //                           return LeadItem(lead: _leads![index]);
    //
    //                           // } else if (_searchedLeads != null && _searchedLeads != _leads) {
    //                           //   return Container();
    //                           // }
    //                           // if (_searchedLeads != null && _searchedLeads!.isNotEmpty && index < _searchedLeads!.length) {
    //                           //   return LeadItem(lead: _searchedLeads![index]);
    //                           // } else if (_leads != null && _leads!.isNotEmpty && index < _leads!.length) {
    //                           //   return LeadItem(lead: _leads![index]);
    //                           // } else {
    //                           //   return Container(); // Return an empty container for out-of-bounds indexes
    //                           // }
    //
    //                         }
    //                       }
    //                   )
    //               ),
    //
    //
    //
    //               if (_isLoadMoreRunning)
    //                 const Padding(
    //                   padding: EdgeInsets.only(top: 10, bottom: 40),
    //                   child: Center(
    //                     child: CircularProgressIndicator(),
    //                   ),
    //                 ),
    //               // SizedBox(
    //               //   height:30,
    //               // ),
    //               // Text(
    //               //   "Near By You",
    //               //   style: Theme
    //               //       .of(context)
    //               //       .textTheme
    //               //       .headline6,
    //               // ),
    //               // SizedBox(
    //               //   height:30,
    //               // ),
    //               // SizedBox(
    //               //   height: 300,
    //               //   // width: 350,
    //               //   child: ListView.builder(
    //               //     physics:BouncingScrollPhysics(),
    //               //     // controller: _controller,
    //               //     // itemCount: _searchResults?.length ?? 0,
    //               //     controller: _controller,
    //               //     itemCount: _leads?.length,
    //               //     scrollDirection: Axis.horizontal,
    //               //     itemBuilder: (BuildContext context, int index) {
    //               //       return LeadItemNearby(lead: _leads![index]);
    //               //     },
    //               //   ),
    //               // ),
    //
    //               // if (!_hasNextPage)
    //               //   Container(
    //               //     padding: const EdgeInsets.only(top: 30, bottom: 40),
    //               //     color: Colors.amber,
    //               //     child: const Center(
    //               //       child: Text("You have fetched all of the content"),
    //               //     ),
    //               //   )
    //             ],
    //           ),
    //         );
    //       }
    //     },
    //   ),
    // );


    return Scaffold(
        appBar: RIQAppBar(
          //isMain: true,
        ),
        key: scaffoldKey,
        backgroundColor: RIQColors.background,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            
          },
          //child: Image.asset(assetsDirectory + "AddLeadIcon.png"),
          child: Image.network("https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
          backgroundColor: RIQColors.RIQBrandPrimary,
        ),
        body: Container(
          color: RIQColors.background,
          child: Column(
            children: <Widget>[
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
                  onChanged:(name){
                    filterLeadsByNamePartialMatch(name);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search...."),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              // vertical: spacingSmall,
                              // horizontal: spacingSmall
                            vertical: 15,horizontal: 15
                             ),
                          child: RIQSwitch(
                              //value: controller.isSmartList,
                              // onChanged: (value) async {
                              //   if (isHintShown)
                              //     closeLayout(context: context);
                              //   filterController.update();
                              //
                              //   if (value)
                              //     Navigator.of(context).push(
                              //         MaterialPageRoute(
                              //             builder: (_) =>
                              //                 SmartPage()));
                              // }
                              )
                      ),
                      // Text(L10n.of(context).smartlist,
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .bodyText2
                      //         .copyWith(
                      //         color: controller.isSmartList
                      //             ? RIQColors.RIQBrandPrimary
                      //             : Colors.black)
                      // )

                      Text("L10n",style:TextStyle(
                        fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                  Divider(
                      height: 0,
                      thickness: 0.5,
                      color: Colors.grey[300])
                ],
              ),
              // controller.isSmartList
              //     ? Container()
              //     : LeadandProjectSearch(
              //     FilterScreen.Lead, scaffoldKey),
              Expanded(
                  // child: RefreshIndicator(
                  //     //onRefresh: () => controller.onRefresh(),
                  //     // onRefresh:()
                  //     // {
                  //     //   print("Koushik");
                  //     // },
                  //     child: connectivityResult ==
                  //         ConnectivityResult.none
                  //         ? Center(
                  //       child:
                  //       Text(L10n.of(context).networkError),
                  //     )
                  //         : controller.isLoading
                  //         ? Center(
                  //       child:
                  //       RIQCircularProgressIndicator(),
                  //     )
                  //         : controller.leads.isEmpty
                  //         ? LeadsEmptyState()
                  //         : Container(
                  //       color: RIQColors.background,
                  //       child: ListView.builder(
                  //           controller:
                  //           _scrollController,
                  //           shrinkWrap: true,
                  //           padding: EdgeInsets.only(
                  //               // top: spacingSmall,
                  //               // bottom: spacingAlone *
                  //               //    2.75
                  //
                  //             top: 15,
                  //             bottom: 15
                  //           ),
                  //           itemCount:_leads?.length,
                  //           //controller.leads.length,
                  //           itemBuilder: (_, index) {
                  //             return GestureDetector(
                  //               onTap: () {
                  //                 Navigator.of(context).push(
                  //                     MaterialPageRoute(
                  //                         builder: (_) =>
                  //                             LeadDetailsScreen(
                  //                               leadID: controller
                  //                                   .leads[index]
                  //                                   .id,
                  //                             )
                  //                       // LeadDetailsScreen(
                  //                       //     leads[index].id)
                  //
                  //                     ));
                  //               },
                  //               child: LeadWidget(
                  //                 lead: controller
                  //                     .leads[index],
                  //               ),
                  //             );
                  //           }
                  //           ),

                child: ListView.builder(
                    physics:BouncingScrollPhysics(),
                    controller: _controller,
                    /// If _searchedLeads is null or doesn't exist,
                    /// it then checks if _leads exists and uses its length.
                    /// If neither _searchedLeads nor _leads exist, it defaults to zero.
                    itemCount: (_searchedLeads?.length ?? 0) > 0 ? _searchedLeads!.length : (_leads?.length ?? 0),
                    // itemCount: _searchResults?.length ?? 0,
                    //itemCount: _leads?.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      // if(_searchController.text.isEmpty)
                      //   {
                      //     return LeadItem(lead: _leads![index]);
                      //   }
                      // else if(positon.toLowerCase().contains(_searchController.text.toLowerCase()))
                      //   {
                      //     return LeadItem(lead: _leads![index]);
                      //   }
                      // else
                      //   {
                      //     return Container();
                      //   }


                      //return LeadItem(lead: _searchedLeads![index]);


                      //return LeadItem(lead: _leads![index]);


                      if (_isSearchEmpty && _searchedLeads != _leads) {
                        print("Not found");
                        return Container();
                      }

                      else if (_searchedLeads != null &&
                          _searchedLeads!.isNotEmpty && index <
                          _searchedLeads!.length) {
                        print("Filtered List");
                        return LeadItem(lead: _searchedLeads![index]);
                      }

                      else if (_leads != null && _leads!.isNotEmpty &&
                          index < _leads!.length) {
                        print("Main List");
                        return LeadItem(lead: _leads![index]);
                        // } else if (_searchedLeads != null && _searchedLeads != _leads) {
                        //   return Container();
                        // }
                        // if (_searchedLeads != null && _searchedLeads!.isNotEmpty && index < _searchedLeads!.length) {
                        //   return LeadItem(lead: _searchedLeads![index]);
                        // } else if (_leads != null && _leads!.isNotEmpty && index < _leads!.length) {
                        //   return LeadItem(lead: _leads![index]);
                        // } else {
                        //   return Container(); // Return an empty container for out-of-bounds indexes
                        // }

                      }
                    }
                ),
              ),

            ]
          ),
        )
    );
  }
}
