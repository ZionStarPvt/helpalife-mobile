import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:helpalife_mobile/history_screen/history_page.dart';
import 'package:helpalife_mobile/profile_screen/profile_page.dart';
import 'package:helpalife_mobile/registration_screen/registration_page.dart';
import 'package:http/http.dart' as http;
import 'bottom_navigation_bar.dart';
import 'donate_map.dart';
import 'find_donors_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _bottomText = "Over 100 available donors";
  int _selectedIndex = 0;
  String selectedBloodGroup = "O+";
  String currentLocation = "Current Location";
  late LatLng _currentPosition;
  GoogleMapController? _mapController;

  final TextEditingController _locationController = TextEditingController();


  final List<String> bloodGroups = ["O+", "A+", "B+", "AB+", "O-", "A-", "B-", "AB-"];

  final List<Widget> _pages = [
    Container(),
    HistoryPage(),
    RegistrationPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _bottomText =
            _tabController.index == 0
                ? "Over 100 available donors"
                : "Over 100 blood requests";
      });
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.78,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
        );
      },
    );
  }

  Future<void> _fetchLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      setState(() {
        currentLocation = "${place.locality}, ${place.postalCode}, ${place.administrativeArea}";
      });
    }
  }


  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          _selectedIndex == 0
              ? PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: Padding(
                  padding: EdgeInsets.only(top: 50, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Labels
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Blood Group",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Location",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          // Blood Group Dropdown
                          Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: selectedBloodGroup,
                                onChanged: (value) {
                                  setState(() {
                                    selectedBloodGroup = value!;
                                  });
                                },
                                items:
                                    bloodGroups
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Location Field with Dropdown
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GooglePlaceAutoCompleteTextField(
                                      boxDecoration: BoxDecoration(
                                        color: Colors.white
                                      ),
                              textEditingController: _locationController,
                                googleAPIKey: dotenv.env['GOOGLE_API_KEY'] ?? "",
                                inputDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                                ),
                                debounceTime: 800,
                                countries: ["in"],
                                isLatLngRequired: true,
                                getPlaceDetailWithLatLng: (Prediction prediction) {
                                  setState(() {
                                    currentLocation = prediction.description ?? "";
                                    _locationController.text = currentLocation;
                                    if (prediction.lat != null && prediction.lng != null) {
                                      _currentPosition = LatLng(
                                        double.parse(prediction.lat!),
                                        double.parse(prediction.lng!),
                                      );
                                    }
                                  });
                                },
                                itemClick: (Prediction prediction) {
                                  _locationController.text = prediction.description ?? "";
                                },
                                seperatedBuilder: Divider(),
                                isCrossBtnShown: true,
                              ),
                                  ),

                                  // Dropdown icon
                                  Icon(Icons.arrow_drop_down, color: Colors.grey),

                                  // Divider
                                  Container(
                                    width: 1,
                                    height: 20,
                                    color: Colors.grey.shade400,
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                  ),

                                  // GPS Icon
                                  InkWell(
                                    onTap: _fetchLocation,
                                    child: Icon(Icons.gps_fixed, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),


                          // Red Search Icon Button (joined)
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                print("Search tapped");
                              },
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              child: Center(
                                child: Icon(Icons.search, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              : null,
      body:
          _selectedIndex == 0
              ? Column(
                children: [
                  // TabBar
                  TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [Tab(text: "Find Donors"), Tab(text: "Donate")],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        FindDonorsMap(), // Find Donors Map
                        DonateMap(),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: _showBottomSheet,
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.grey,
                          thickness: 4,
                          indent: 180,
                          endIndent: 180,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            _bottomText,
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
