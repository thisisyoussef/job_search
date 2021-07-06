import 'package:flutter/material.dart';
import 'package:job_search/data/job_filters.dart';
import 'package:job_search/filterModal/filter_screen.dart';
import 'package:job_search/user_input_field.dart';
import 'package:provider/provider.dart';
import 'list_card.dart';
import 'data/job_data.dart';
import 'models/job.dart';

class JobCardsScreen extends StatefulWidget {
  final List<Job> jobData;

  const JobCardsScreen({Key key, this.jobData}) : super(key: key);

  @override
  _JobCardsScreenState createState() => _JobCardsScreenState();
}

class _JobCardsScreenState extends State<JobCardsScreen> {
  String searchKey = "";
  String sortKey = "";
  @override
  Widget build(BuildContext context) {
    JobData().getJobData();
    List<Job> selectedList;
    sortKey == "Earliest"
        ? selectedList = jobListEarliest
        : sortKey == "Latest"
            ? selectedList = jobListLatest
            : sortKey = "";
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFF4F6F8),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.green,
                height: 88,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: UserInputField(
                          callback: (String newKey) {
                            setState(() {
                              searchKey = newKey;
                            });
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: InkWell(
                          child: Icon(
                            Icons.filter_list,
                            size: 28,
                          ),
                          onTap: () async {
                            await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: FilterScreen(),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      sortKey == "Earliest"
                          ? sortKey = "Latest"
                          : sortKey == "Latest"
                              ? sortKey = ""
                              : sortKey == ""
                                  ? sortKey = "Earliest"
                                  : sortKey = "";
                    });
                  },
                  child: Text("Sort by: " + sortKey)),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedList.length,
                  scrollDirection: Axis.vertical,
                  reverse: false,
                  itemBuilder: (context, index) {
                    var selectedJob = selectedList[index];
                    String jobTitle = selectedJob.jobTitle.toLowerCase();
                    return ((Provider.of<JobFilters>(context, listen: true)
                                    .getCategories("Applied")
                                    .contains(selectedJob.category) ||
                                Provider.of<JobFilters>(context, listen: true)
                                    .getCategories("Applied")
                                    .isEmpty) &&
                            (Provider.of<JobFilters>(context, listen: true)
                                    .getJobTypes("Applied")
                                    .contains(selectedJob.jobType) ||
                                Provider.of<JobFilters>(context, listen: true)
                                    .getJobTypes("Applied")
                                    .isEmpty) &&
                            jobTitle.contains(searchKey))
                        ? ListCard(job: selectedJob)
                        : Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
