import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobFilters extends ChangeNotifier {
  List<String> _categories = [];
  List<String> _unappliedCategories = [];
  List<String> _selectedCategories = [];
  List<String> _jobTypes = [];
  List<String> _unappliedJobTypes = [];
  List<String> _selectedJobTypes = [];

  void applyFilters() {
    _categories = List.from(_selectedCategories);
    _jobTypes = List.from(_selectedJobTypes);
    notifyListeners();
  }

  bool inCategories(String stage, String area) {
    if (stage == "Unapplied" && _unappliedCategories.isNotEmpty) {
      return _unappliedCategories.contains(area);
    } else if (stage == "Selected" && _selectedCategories.isNotEmpty) {
      return _selectedCategories.contains(area);
    } else if (stage == "Applied" && _categories.isNotEmpty) {
      return _categories.contains(area);
    } else {
      return false;
    }
  }

  void addToCategories(String stage, String area) {
    if (stage == "Unapplied") {
      _unappliedCategories.add(area);
    } else if (stage == "Selected") {
      _selectedCategories.add(area);
    } else if (stage == "Applied") {
      _categories.add(area);
    }
    notifyListeners();
  }

  void removeFromCategories(String stage, String area) {
    if (stage == "Unapplied") {
      _unappliedCategories.remove(area);
    } else if (stage == "Selected") {
      _selectedCategories.remove(area);
    } else if (stage == "Applied") {
      _categories.remove(area);
    }
    notifyListeners();
  }

  void updateCategories(String stage) {
    if (stage == "Unapplied") {
      _selectedCategories = List.from(_unappliedCategories);
      notifyListeners();
    } else if (stage == "Selected") {
      _categories = List.from(_selectedCategories);
      //_selectedAreas.clear();
      notifyListeners();
    }
  }

  String getCategories(String stage) {
    if (stage == "Unapplied") {
      return _unappliedCategories
          .toString()
          .substring(1, _selectedCategories.toString().length - 1);
    } else if (stage == "Selected") {
      return _selectedCategories
          .toString()
          .substring(1, _selectedCategories.toString().length - 1);
    } else if (stage == "Applied") {
      return _categories
          .toString()
          .substring(1, _categories.toString().length - 1);
    }
  }

  bool inJobTypes(String stage, String area) {
    if (stage == "Unapplied" && _unappliedJobTypes.isNotEmpty) {
      return _unappliedJobTypes.contains(area);
    } else if (stage == "Selected" && _selectedJobTypes.isNotEmpty) {
      return _selectedJobTypes.contains(area);
    } else if (stage == "Applied" && _jobTypes.isNotEmpty) {
      return _jobTypes.contains(area);
    } else {
      return false;
    }
  }

  void addToJobTypes(String stage, String area) {
    if (stage == "Unapplied") {
      _unappliedJobTypes.add(area);
    } else if (stage == "Selected") {
      _selectedJobTypes.add(area);
    } else if (stage == "Applied") {
      _jobTypes.add(area);
    }
    notifyListeners();
  }

  void removeFromJobTypes(String stage, String area) {
    if (stage == "Unapplied") {
      _unappliedJobTypes.remove(area);
    } else if (stage == "Selected") {
      _selectedJobTypes.remove(area);
    } else if (stage == "Applied") {
      _jobTypes.remove(area);
    }
    notifyListeners();
  }

  void updateJobTypes(String stage) {
    if (stage == "Unapplied") {
      _selectedJobTypes = List.from(_selectedJobTypes);
      notifyListeners();
    } else if (stage == "Selected") {
      _categories = List.from(_selectedJobTypes);
      //_selectedAreas.clear();
      notifyListeners();
    }
  }

  String getJobTypes(String stage) {
    if (stage == "Unapplied") {
      return _unappliedJobTypes
          .toString()
          .substring(1, _selectedJobTypes.toString().length - 1);
    } else if (stage == "Selected") {
      return _selectedJobTypes
          .toString()
          .substring(1, _selectedJobTypes.toString().length - 1);
    } else if (stage == "Applied") {
      return _jobTypes.toString().substring(1, _jobTypes.toString().length - 1);
    }
  }
}
