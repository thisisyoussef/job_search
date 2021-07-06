import 'screens/jobCardsScreen.dart';
import 'package:flutter/material.dart';
import 'data/job_data.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
        ),
      ),
    );
  }

  void getLocation() async {
    JobData weatherModel = JobData();
    var jobData = await weatherModel.getJobData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return JobCardsScreen(
        jobData: jobData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }
}
