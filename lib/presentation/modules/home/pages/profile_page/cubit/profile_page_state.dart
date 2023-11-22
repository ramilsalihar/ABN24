import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_name/domain/models/all_list/list_model.dart';
import '../../../../../../domain/models/user.dart';

class ProfileStageData {
  final UserData? userData;
  final List<MaritalStatus>? status;
  final List<Oblast>? oblast;
  final List<Locality>? locality;
  final List<District>? district;
  final List<Locality>? factLocality;
  final List<District>? factDistrict;
  String? selectedStatus;
  String? selectedTypeIssued;

  ProfileStageData copyWith({
    UserData? userData,
    List<MaritalStatus>? status,
    List<Oblast>? oblast,
    List<Locality>? locality,
    List<District>? district,
    List<Locality>? factLocality,
    List<District>? factDistrict,
    String? selectedStatus,
    String? selectedTypeIssued,
  }) {
    return ProfileStageData(
      userData: userData ?? this.userData,
      status: status ?? this.status,
      locality: locality ?? this.locality,
      oblast: oblast ?? this.oblast,
      district: district ?? this.district,
      factLocality: factLocality ?? this.factLocality,
      factDistrict: factDistrict ?? this.factDistrict,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      selectedTypeIssued: selectedTypeIssued ?? this.selectedTypeIssued,
    );
  }

  ProfileStageData({
    this.userData,
    this.status,
    this.oblast,
    this.locality,
    this.district,
    this.factLocality,
    this.factDistrict,
    this.selectedStatus,
    this.selectedTypeIssued,
  });
}

@immutable
class ProfilePageState {
  late final ProfileStageData data;
  late final ProfileEventState eventState;

  ProfilePageState({
    required this.data,
    required this.eventState,
  });

  ProfilePageState.initial() {
    data = ProfileStageData();
    eventState = ProfilePageInitial();
  }
}

abstract class ProfileEventState {}

class ProfilePageInitial extends ProfileEventState {}

class ProfileDataLoading extends ProfileEventState {}

class ProfileDataLoaded extends ProfileEventState {}

class ProfileDataSaving extends ProfileEventState {}

class ProfileListLoaded extends ProfileEventState {}

class ProfileDataError extends ProfileEventState {
  final String message;

  ProfileDataError(this.message);
}

class UploadPassportPhoto extends ProfileEventState {}

class UploadPassportPhotoSuccess extends ProfileEventState {}

class UploadPassportPhotoError extends ProfileEventState {
  final String message;

  UploadPassportPhotoError(this.message);
}
