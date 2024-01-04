import 'package:flutter/material.dart';
import '../provider/provider.dart';
import '../components/card.dart';

class Home extends StatefulWidget {
  final List<dynamic> data;

  const Home({Key? key, required this.data}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hide the default back button
        titleSpacing: 0, // Remove the spacing between the title and actions
        title: Center(
          child: Container(
            height: 35.0,
            width: screenWidth * 0.98, // Take up the maximum width
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.left, // Align the search text to the left
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  // contentPadding: const EdgeInsets.symmetric(
                  //     vertical: 1.0), // Set vertical padding
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        _searchQuery = '';
                        _searchController.clear();
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return CustomCard(
            parkingSpotId: widget.data[index]['parking_spot_id'],
            rate: widget.data[index]['rate'],
            idx: index,
          );
        },
      ),
    );
  }
}
