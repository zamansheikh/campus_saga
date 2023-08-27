import 'package:Campus_Saga/app/data/models/university_model.dart';
import 'package:get/get.dart';


class RankingController extends GetxController {
  RxList<UniversityModel> universities = <UniversityModel>[].obs;

  @override
  void onInit() {
    fetchUniversities(); // Fetch universities when controller initializes
    super.onInit();
  }

  void fetchUniversities() {
    // Simulate fetching universities from a service
    // Replace this with your actual data fetching logic
    // For now, let's populate some dummy data
    universities.assignAll([
      UniversityModel(name: 'University 1', score: 100, id: '', logoUrl: ''),
      UniversityModel(name: 'University 2', score: 90, id: '', logoUrl: ''),
      UniversityModel(name: 'University 3', score: 85, id: '', logoUrl: ''),
      // ... add more universities
    ]);
  }

  void viewUniversityDetails(UniversityModel university) {}
}
