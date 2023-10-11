
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/lead.dart';
import '../services/remote_service.dart';


class formPage extends StatefulWidget {
  const formPage({super.key});

  @override
  State<formPage> createState() => _formPageState();
}

class _formPageState extends State<formPage> {
  TextEditingController fieldController = TextEditingController();
  TextEditingController field1Controller = TextEditingController();
  TextEditingController field2Controller = TextEditingController();
  TextEditingController field3Controller = TextEditingController();
  TextEditingController field4Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fieldController = TextEditingController();
    field1Controller = TextEditingController();
    field2Controller = TextEditingController();
    field3Controller = TextEditingController();
    field4Controller = TextEditingController();
  }

  @override
  void dispose() {
    fieldController.dispose();
    field1Controller.dispose();
    field2Controller.dispose();
    field3Controller.dispose();
    field4Controller.dispose();
    super.dispose();
  }


  Future<void> sendLeadToServer(Lead lead) async {
    print("API $lead");
    var response = await RemoteService()
        .postAsync("lead_activity_type",null,lead,null);
    var realIqResponce = response.data;
    print("response = $realIqResponce");
    print("koushik");
  }

  var _myFormKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool _isCheck = false;
  bool isChecked = false;
  bool isCheck = false;
  String selectedOwner = '----------';
  String selectedCampaign = '-----------------------------------------';
  String selectedLeadSource = '------------------------------';
  List<String> dropdownCampaignItems = ['-----------------------------------------','GLA', 'Indiranagar Bungalow', 'Navami Landmaark', 'Klassik Landmaark','The Magic Faraway Tree','The Green Valley Address','Meda Greens','Gruha Mela','Equinox','Grand La Casa'];
  List<String> dropdownLeadOwner = ['----------','88','47','33','9','61','55','84','92','40','3','86','89','93','90','94','14','44','64','65','66','67','5','68','69','59','60','62','57','2','4','8','48','7','35','72','46','6','73','10','41','15','12','43','39','53','56','51','81','74','49','50','85','83','75','76','77','78','79','80','58','70','71','91'];
  List<String> dropdownLeadSource = ['------------------------------','Facebook','Instagram','Linkedin','Twitter','Quora','Google Ads','Youtube Ads','TV','Radio','99Acres','MagicBricks','Housing','Makaan','PropTiger','CommonFloor','OLX','Quikr','Sulekha','Website','Email','SMS','Outbound Calls','Inbound Calls','Referrals','Channel Partner','Others','Newspaper','Magazine','Pamphlet'];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Page"),
      ),
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0,horizontal:10.0),
          child: Center(
            child: Container(
              height:1150,
              width: 550,
              padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white70,border: Border.all(color: Colors.black87)),
              margin: const EdgeInsets.all(12.0),
              child: Form(
                key: _myFormKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:EdgeInsets.all(10.0),
                      child:TextFormField(
                        controller:fieldController,
                        validator: (String? msg) {
                          if (msg == null || msg.isEmpty) {
                            return "Please enter your Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText:"Name",
                            hintText: "Enter Your Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.all(10.0),
                      child:TextFormField(
                        controller: field1Controller,
                        keyboardType: TextInputType.number,
                        validator: (String? msg) {
                          if (msg == null || msg.isEmpty) {
                            return "Please enter your Mobile Number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            labelText:"Mobile Number",
                            hintText: "Enter Your Mobile Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1.0)
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.all(10.0),
                      child:TextFormField(
                        controller:field2Controller,
                        keyboardType: TextInputType.number,
                        validator: (String? msg) {
                          if (msg == null || msg.isEmpty) {
                            return "Please enter your Alt Mobile Number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            labelText:"Alt Mobile Number",
                            hintText: "Enter Your Alt Mobile Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1.0)
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.all(10.0),
                      child:TextFormField(
                        controller: field3Controller,
                        validator: (String? msg) {
                          if (msg == null || msg.isEmpty) {
                            return "Please enter your Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText:"Email",
                            hintText: "Enter Your Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1.0)
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked = newValue ?? false;
                              });
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                          ),
                          Text("Favorite"),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Checkbox(
                            value: _isCheck,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isCheck = newValue ?? false;
                              });
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                          ),
                          Text("Inactive"),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue ?? false;
                              });
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                          ),
                          Text("New"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isCheck,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheck = newValue ?? false;
                              });
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                          ),
                          Text("Junk"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,right:10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: DropdownButton<String>(
                              value: selectedCampaign,
                              items: dropdownCampaignItems.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCampaign = newValue!;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width:5,
                          ),
                          Text("Campaign"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButton<String>(
                            value: selectedLeadSource,
                            items: dropdownLeadSource.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLeadSource = newValue!;
                              });
                            },
                          ),
                          SizedBox(
                            width:5,
                          ),
                          Text("Lead Source"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButton<String>(
                            value: selectedOwner,
                            items: dropdownLeadOwner.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOwner = newValue!;
                              });
                            },
                          ),
                          SizedBox(
                            width:5,
                          ),
                          Text("Lead Owner"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller:field4Controller,
                        maxLines: 5,
                        decoration: InputDecoration(
                          icon: Icon(Icons.notes),
                          labelText: "Notes",
                          hintText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:50),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_myFormKey.currentState!.validate()) {
                            print("Form validation successfully");
                            final lead = Lead(
                              name: fieldController.text,
                              mobile: field1Controller.text,
                              altMobile: field2Controller.text,
                              email: field3Controller.text,
                              favorite: _isChecked,
                              inactive: _isCheck,
                              junk: isChecked,
                              leadNew: isCheck,
                              notes: field4Controller.text,
                              campaign:selectedCampaign,
                              leadSource:selectedLeadSource,
                              owner:int.parse(selectedOwner),
                            );
                            print("Name : ${fieldController.text}");
                            print("Mobile : ${field1Controller.text}");
                            print("Alt Mobile : ${field2Controller.text}");
                            print("Email : ${field3Controller.text}");
                            print("Favorite : ${_isChecked}");
                            print("Inactive : ${_isCheck}");
                            print("New : ${isChecked}");
                            print("Junk : ${isCheck}");
                            print("Campaign : ${selectedCampaign}");
                            print("Lead Source : ${selectedLeadSource}");
                            print("Lead Owner : ${selectedOwner}");
                            print("Notes : ${field4Controller.text}");
                            sendLeadToServer(lead);
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
