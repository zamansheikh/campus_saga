import 'package:Campus_Saga/app/data/models/university_model.dart';
import 'package:get/get.dart';

class UniversityService extends GetxService {
  // Simulated list of universities (replace with actual API calls)
  final List<UniversityModel> _universities = [
    UniversityModel(id: '1', name: 'University A', logoUrl: '', score: 10),
    UniversityModel(id: '2', name: 'University A', logoUrl: '', score: 10),
    UniversityModel(id: '3', name: 'University A', logoUrl: '', score: 10),
    // Add more universities as needed
  ];

  List<UniversityModel> get universities => _universities;

  // Simulated method to fetch universities (replace with actual API call)
  Future<void> fetchUniversities() async {
    // Simulated delay to mimic API call
    await Future.delayed(Duration(seconds: 2));

    // Update universities list with actual data from API
    // For example:
    // _universities = await yourApiCallToGetUniversities();
  }

  // Other methods related to university data can be added here
}
