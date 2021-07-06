import 'package:flutter/material.dart';
import 'package:job_search/data/job_filters.dart';
import 'package:provider/provider.dart';

class FilterNamePanel extends StatelessWidget {
  const FilterNamePanel({
    Key key,
    @required this.filter,
    @required this.displayText,
    this.callBack,
  }) : super(key: key);

  final String filter;
  final String displayText;
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: const Color(0xFF707070),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  filter,
                  style: TextStyle(
                    fontFamily: 'Chakra Petch',
                    fontSize: 15,
                    color: const Color(0xff707070),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                child: Row(
                  children: [
                    Text(
                      filter == "Categories"
                          ? Provider.of<JobFilters>(context)
                              .getCategories("Selected")
                              .toString()
                          : filter == "Job Types"
                              ? Provider.of<JobFilters>(context)
                                  .getJobTypes("Selected")
                                  .toString()
                              : "",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: filter == "Categories" &&
                                    (Provider.of<JobFilters>(context)
                                            .getCategories("Selected")
                                            .length >
                                        3) ||
                                filter == "Job Types" &&
                                    (Provider.of<JobFilters>(context)
                                            .getJobTypes("Selected")
                                            .length >
                                        3)
                            ? 14
                            : 16,
                        color: const Color(0xff2b8116),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff2b8116),
                    )
                  ],
                ),
                onTap: callBack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
