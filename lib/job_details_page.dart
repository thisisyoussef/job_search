import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'venue_page_header.dart';
import 'venue_info.dart';
import 'header_text.dart';

class JobDetailsPage extends StatefulWidget {
  static String id = "venue_page";
  final Widget venueImage;
  final String venueName;
  final String venueArea;
  final double venueRating;
  final int venueDistance;
  final bool approved;
  final String venueId;
  final List venueSports;
  final int venuePrice;
  final List venueAmenities;
  const JobDetailsPage({
    Key key,
    this.venueImage,
    this.venueId,
    this.approved,
    this.venueName,
    this.venueArea,
    this.venueRating,
    this.venueDistance,
    this.venueSports,
    this.venuePrice,
    this.venueAmenities,
  }) : super(key: key);

  @override
  _JobDetailsPageState createState() => _JobDetailsPageState();
}

class VenueListStream extends StatelessWidget {
  const VenueListStream({Key key, this.homePage}) : super(key: key);

  final bool homePage;
  @override
  Widget build(BuildContext context) {}
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  String headerText = "AMENITIES";
  List<String> amenities = [
    "Ball",
    "Bibs",
    "Bathroom",
    "Drinks",
    "Prayer Area",
  ];
  final items = List<DateTime>.generate(
      7,
      (i) => DateTime.utc(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ).add(Duration(days: i)));
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  bool isAm = true;

  bool isFavorite = true;
  var _currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7F8F8),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 30,
              toolbarHeight: 50,
              expandedHeight: 227,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: VenuePageHeader(),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VenueInfo(
                    sports: widget.venueSports,
                    area: widget.venueArea,
                    name: widget.venueName,
                    distance: widget.venueDistance,
                    rating: widget.venueRating,
                    price: widget.venuePrice,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: HeaderText(headerText: "SELECT DAY")),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: HeaderText(headerText: "SELECT TIME")),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: HeaderText(headerText: "AMENITIES"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: HeaderText(
                      headerText: "LOCATION",
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
