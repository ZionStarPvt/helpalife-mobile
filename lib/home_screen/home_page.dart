import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';
import 'donate_map.dart';
import 'find_donors_map.dart';

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


  final List<String> bloodGroups = ["O+", "A+", "B+", "AB+", "O-", "A-", "B-", "AB-"];

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
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        );
      },
    );
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
      appBar: PreferredSize(
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
                        items: bloodGroups
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
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                onChanged: null,
                                items: [],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 20,
                            color: Colors.grey.shade400,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          Icon(Icons.gps_fixed, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Search Button
                  InkWell(
                    onTap: () {
                      print("Search button clicked");
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
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
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,

      ),
    );
  }
}
