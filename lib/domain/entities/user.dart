// lib/domain/entities/user.dart

import 'package:equatable/equatable.dart';

enum UserType { student, university, admin }

enum UserBadge { newbie, active, expert, hero, legend }

enum AchievementType { postCreator, issueResolver, helpfulVoter, trendSetter }

enum Department {
  cse,
  swe,
  eee,
  civil,
  bba,
  english,
  law,
  pharmacy,
  architecture,
  other
}

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String universityId;
  final bool isVerified;
  final UserType userType;
  final String profilePictureUrl;
  final String? gender;

  // Engagement metrics
  final int postCount;
  final int commentCount;
  final int resolvedIssuesCount;
  final int receivedVotesCount;
  final int givenVotesCount;
  final double reputationScore;
  final UserBadge currentBadge;
  final List<AchievementType> achievements;
  final int streakDays;
  final Map<String, int> activityLog; // Monthly activity tracking

  // Optional student-specific fields
  final String? studentId;
  final DateTime? dateOfBirth;
  final String? phoneNumber;
  final List<String>? clubNames;
  final Department? department;
  final int? batch;
  final double? cgpa;
  final String? currentSemester;
  final String? bloodGroup;
  final String? address;
  final String? guardianPhone;
  final List<String>? skills;
  final List<String>? interests;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.universityId,
    this.gender,
    this.isVerified = false,
    required this.userType,
    required this.profilePictureUrl,
    this.postCount = 0,
    this.commentCount = 0,
    this.resolvedIssuesCount = 0,
    this.receivedVotesCount = 0,
    this.givenVotesCount = 0,
    this.reputationScore = 0.0,
    this.currentBadge = UserBadge.newbie,
    this.achievements = const [],
    this.streakDays = 0,
    this.activityLog = const {},
    // Student-specific fields
    this.studentId,
    this.dateOfBirth,
    this.phoneNumber,
    this.clubNames,
    this.department,
    this.batch,
    this.cgpa,
    this.currentSemester,
    this.bloodGroup,
    this.address,
    this.guardianPhone,
    this.skills,
    this.interests,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? universityId,
    UserType? userType,
    String? profilePictureUrl,
    String? phoneNumber,
    String? address,
    String? guardianPhone,
    List<String>? skills,
    List<String>? interests,
    double? cgpa,
    String? currentSemester,
    String? bloodGroup,
    String? studentId,
    int? batch,
    DateTime? dateOfBirth,
    Department? department,
    String? gender,
    bool? isVerified,
    int? postCount,
    int? commentCount,
    int? resolvedIssuesCount,
    int? receivedVotesCount,
    int? givenVotesCount,
    double? reputationScore,
    UserBadge? currentBadge,
    List<AchievementType>? achievements,
    int? streakDays,
    Map<String, int>? activityLog,
    List<String>? clubNames,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      universityId: universityId ?? this.universityId,
      isVerified: isVerified ?? this.isVerified,
      userType: userType ?? this.userType,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      postCount: postCount ?? this.postCount,
      commentCount: commentCount ?? this.commentCount,
      resolvedIssuesCount: resolvedIssuesCount ?? this.resolvedIssuesCount,
      receivedVotesCount: receivedVotesCount ?? this.receivedVotesCount,
      givenVotesCount: givenVotesCount ?? this.givenVotesCount,
      reputationScore: reputationScore ?? this.reputationScore,
      currentBadge: currentBadge ?? this.currentBadge,
      achievements: achievements ?? this.achievements,
      streakDays: streakDays ?? this.streakDays,
      activityLog: activityLog ?? this.activityLog,
      // Student-specific fields
      studentId: studentId ?? this.studentId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      clubNames: clubNames ?? this.clubNames,
      department: department ?? this.department,
      batch: batch ?? this.batch,
      cgpa: cgpa ?? this.cgpa,
      currentSemester: currentSemester ?? this.currentSemester,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      address: address ?? this.address,
      guardianPhone: guardianPhone ?? this.guardianPhone,
      skills: skills ?? this.skills,
      interests: interests ?? this.interests,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        universityId,
        isVerified,
        userType,
        gender,
        profilePictureUrl,
        postCount,
        commentCount,
        resolvedIssuesCount,
        receivedVotesCount,
        givenVotesCount,
        reputationScore,
        currentBadge,
        achievements,
        streakDays,
        activityLog,
        // Student-specific fields
        studentId,
        dateOfBirth,
        phoneNumber,
        clubNames,
        department,
        batch,
        cgpa,
        currentSemester,
        bloodGroup,
        address,
        guardianPhone,
        skills,
        interests,
      ];
}
