class Job {
  final String jobTitle;
  final String companyName;
  final String category;
  final String jobType;
  final String publicationDate;
  final String location;
  final String salary;
  final String description;
  final List<dynamic> tags;
  final DateTime publicationDateTime;

  Job(
      {this.publicationDateTime,
      this.jobTitle,
      this.companyName,
      this.category,
      this.jobType,
      this.publicationDate,
      this.location,
      this.salary,
      this.description,
      this.tags});
}
