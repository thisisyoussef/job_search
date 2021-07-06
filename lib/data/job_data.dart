import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_search/data/app_information.dart';
import 'package:job_search/data/job_filters.dart';
import 'package:job_search/models/job.dart';

List<Job> jobList = [];
List<Job> jobListEarliest = [];
List<Job> jobListLatest = [];
List<String> jobCategories = [];
List<String> jobTypes = [];

class JobData {
  Future getJobData() async {
    Uri requestURL = Uri.https("remotive.io", "/api/remote-jobs");
    http.Response response = await http.get(requestURL);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    if (response.statusCode == 200) {
      int jobCount = decodedData['job-count'];
      print(jobCount.toString());
      for (int i = 0; i < jobCount; i++) {
        dynamic jobData = decodedData['jobs'][i];
        String jobCategory;
        jobData['job_type'] == "full_time"
            ? jobData['job_type'] = "Full-time"
            : jobData['job_type'] == "part_time"
                ? jobData['job_type'] = "Part-time"
                : jobData['job_type'] == "contract"
                    ? jobData['job_type'] = "Contract"
                    : jobData['job_type'] == "internship"
                        ? jobData['job_type'] = "Internship"
                        : jobData['job_type'] == "freelance"
                            ? jobData['job_type'] = "Freelance"
                            : jobData['job_type'] == "other"
                                ? jobData['job_type'] = "Other"
                                : print("null");
        if (jobCategories.contains(jobData['category']) == false) {
          jobCategories.add(jobData['category']);
        }
        if (jobTypes.contains(jobData['job_type']) == false) {
          jobTypes.add(jobData['job_type']);
        }
        DateTime datePosted = DateTime.parse(jobData['publication_date']);
        jobList.add(Job(
          publicationDateTime: datePosted,
          jobType: jobData['job_type'],
          description: jobData['description'],
          companyName: jobData['company_name'],
          location: jobData['candidate_required_location'],
          category: jobData['category'],
          jobTitle: jobData['title'],
          salary: jobData['salary'],
          publicationDate: jobData['publication_date'],
          tags: jobData['tags'],
        ));
      }
      jobListEarliest = List.from(jobList);
      jobListEarliest.sort(
          (a, b) => a.publicationDateTime.compareTo(b.publicationDateTime));
      jobListLatest = List.from(jobListEarliest);
      jobListLatest.sort(
          (a, b) => b.publicationDateTime.compareTo(a.publicationDateTime));

      AppInformation.categories = jobCategories;
      AppInformation.jobTypes = jobTypes;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }

    return jobList;
  }
}
