import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'detail_tile.dart';
import 'package:job_search/models/job.dart';
import 'package:job_search/screens/job_details_page.dart';

class JobCard extends StatelessWidget {
  final Job job;
  JobCard({Key key, this.job}) : super(key: key);

  TextStyle subTitleStyle = TextStyle(
    fontFamily: 'Chakra Petch',
    fontSize: 16,
    color: Colors.black54,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w700,
  );
  TextStyle titleStyle = TextStyle(
    fontFamily: 'Chakra Petch',
    fontSize: 22,
    color: const Color(0xff2b8116),
    letterSpacing: 1.5,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    DateTime datePosted = DateTime.parse(job.publicationDate);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => JobDetailsPage(
                job: job,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.87,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          job.jobTitle,
                          style: titleStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          job.companyName,
                          style: subTitleStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Table(
                        children: <TableRow>[
                          TableRow(children: <Widget>[
                            TableCell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: DetailTile(job.category, 20),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: DetailTile(job.jobType, 16),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: DetailTile(job.location, 16),
                              ),
                            ),
                          ])
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Posted on " +
                                DateFormat.yMMMMd('en_US').format(datePosted),
                            style: subTitleStyle,
                          ),
                          Text(
                            job.salary,
                            style: subTitleStyle,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
    ;
  }
}
