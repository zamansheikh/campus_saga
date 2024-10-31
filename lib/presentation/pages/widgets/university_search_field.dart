// lib/presentation/widgets/university_search_field.dart

import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class UniversitySearchField extends StatelessWidget {
  final TextEditingController controller;
  final List<String> universityList;

  const UniversitySearchField({
    Key? key,
    required this.controller,
    required this.universityList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchField(
      maxSuggestionsInViewPort: 5,
      controller: controller,
      suggestions: universityList
          .map((university) => SearchFieldListItem(university))
          .toList(),
      searchInputDecoration: SearchInputDecoration(
        prefixIcon: Icon(
          Icons.school,
          size: 20,
          color: Colors.black,
        ),
        hintText: "Search University",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
