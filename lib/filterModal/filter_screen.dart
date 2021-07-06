import 'package:flutter/material.dart';
import 'package:job_search/wide_rounded_button.dart';
import 'package:provider/provider.dart';
import 'filterNamePanel/filter_name_panel.dart';
import 'filter_title_bar.dart';
import 'filter_tile.dart';
import 'package:job_search/data/job_filters.dart';
import 'size_provider_widget.dart';
import 'package:job_search/data/app_information.dart';

class FilterScreen extends StatefulWidget {
  static String id = "filter_screen";
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String filterSwitch = "Default";
  double screenHeight = 0;
  String title = "Title";
  String _area;
  DateTime _startDate;
  DateTime _endDate;
  String _sport;
  int _distanceFromUser;
  int _maxPrice;
  List<String> _amenities;
  double _rating;

  @override
  Widget build(BuildContext context) {
    bool isCategories = (filterSwitch == "Categories");
    bool isJobTypes = (filterSwitch == "Job Types");
    String selectedSport = _sport;
    Function _cancelCallBack = () {
      setState(() {
        filterSwitch = "Default";
      });
    };

    return Consumer<JobFilters>(
        builder: (BuildContext context, JobFilters jobFilters, Widget child) {
      Function categoryCheckBoxCallBack(bool checkboxState, String filterName) {
        checkboxState == true
            ? jobFilters.addToCategories("Unapplied", filterName)
            : jobFilters.removeFromCategories("Unapplied", filterName);
      }

      Function jobTypeCheckBoxCallBack(bool checkboxState, String filterName) {
        checkboxState == true
            ? jobFilters.addToJobTypes("Unapplied", filterName)
            : jobFilters.removeFromJobTypes("Unapplied", filterName);
      }

      return Container(
        color: Color(0xFF000000).withOpacity(0.5),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Icon(Icons.horizontal_rule),
                filterSwitch == "Default"
                    ? SizeProviderWidget(
                        child: Column(
                          children: [
                            FilterNamePanel(
                              filter: "Categories",
                              displayText: jobFilters.getCategories("Selected"),
                              callBack: () {
                                setState(() {
                                  filterSwitch = "Categories";
                                });
                              },
                            ),
                            FilterNamePanel(
                              filter: "Job Types",
                              displayText: jobFilters.getJobTypes("Selected"),
                              callBack: () {
                                setState(() {
                                  filterSwitch = "Job Types";
                                });
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                            ),
                            WideRoundedButton(
                              title: "Apply",
                              isEnabled: true,
                              onPressed: () {
                                jobFilters.applyFilters();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        onChildSize: (size) {
                          screenHeight = size.height;
                        },
                      )
                    : Container(
                        height: screenHeight,
                        color: Colors.white,
                        child: Column(
                          children: [
                            FilterTitleBar(
                              title: filterSwitch,
                              hasReset: false,
                              cancelCallBack: _cancelCallBack,
                              saveCallBack: () {
                                isCategories
                                    ? jobFilters.updateCategories("Unapplied")
                                    : isJobTypes
                                        ? jobFilters.updateJobTypes("Unapplied")
                                        : null;
                                setState(() {
                                  filterSwitch = "Default";
                                });
                              },
                            ),
                            (isCategories || isJobTypes)
                                ? Expanded(
                                    child: Consumer<AppInformation>(
                                      builder: (context, appData, child) {
                                        return ListView.builder(
                                            itemBuilder: (context, index) {
                                              final filterName = isCategories
                                                  ? AppInformation
                                                      .categories[index]
                                                  : AppInformation
                                                      .jobTypes[index];
                                              /*  : AppInformation
                                                      .jobTypes[index];*/
                                              return FilterTile(
                                                  taskTitle: filterName,
                                                  isChecked: isCategories
                                                      ? jobFilters.inCategories(
                                                          "Unapplied",
                                                          filterName)
                                                      : jobFilters.inJobTypes(
                                                          "Unapplied",
                                                          filterName),
                                                  checkboxCallback:
                                                      (checkboxState) {
                                                    isCategories
                                                        ? categoryCheckBoxCallBack(
                                                            checkboxState,
                                                            filterName)
                                                        : jobTypeCheckBoxCallBack(
                                                            checkboxState,
                                                            filterName);
                                                  });
                                            },
                                            itemCount: isCategories
                                                ? AppInformation
                                                    .categories.length
                                                : AppInformation
                                                    .jobTypes.length);
                                      },
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      )
              ],
            )),
      );
    });
  }
}

//        Provider.of<VenueFilters>(context, listen: false).setSport("Football");
