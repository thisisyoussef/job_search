import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:job_search/list_card.dart';
import 'models/job.dart';
import 'venue_page_header.dart';
import 'venue_info.dart';
import 'header_text.dart';

class JobDetailsPage extends StatefulWidget {
  static String id = "venue_page";
  final Job job;
  const JobDetailsPage({Key key, this.job}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7F8F8),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 30,
              toolbarHeight: 50,
              expandedHeight: 227,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: ListCard(
                  job: widget.job,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Html(data: widget.job.description)],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
