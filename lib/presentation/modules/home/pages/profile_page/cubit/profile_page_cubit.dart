import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project_name/data/local_storage/local_storage.dart';
import 'package:project_name/data/services/all_list_service.dart';
import 'package:project_name/data/services/user_service.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/cubit/profile_page_state.dart';

import '../../../../../../domain/models/all_list/list_model.dart';
import '../../../../../../domain/models/user.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit() : super(ProfilePageState.initial());

  final _userService = UserService(GetIt.I.get<Dio>());
  final _allListService = AllListService(GetIt.I.get<Dio>());

  //TODO: Add error handling

  Future<void> getProfileData() async {
    try {
      emit(
        ProfilePageState(
          data: ProfileStageData(userData: state.data.userData),
          eventState: ProfileDataLoading(),
        ),
      );

      final response = await _userService.getProfileData();
      final userData = UserData.fromJson(response.data);

      emit(
        ProfilePageState(
          data: ProfileStageData(userData: userData),
          eventState: ProfileDataLoaded(),
        ),
      );
    } catch (error) {
      emit(
        ProfilePageState(
          data: ProfileStageData(userData: state.data.userData),
          eventState: ProfileDataError(error.toString()),
        ),
      );
    }
  }

  Future<void> updateProfile(UserData newUser) async {
    // Update user data
    final updatedUserData = state.data.userData!.copyWith(
      first_name: newUser.first_name,
      last_name: newUser.last_name,
      second_name: newUser.second_name,
      phone: newUser.phone,
      file_check: newUser.file_check,
      email: newUser.email,
      sex: newUser.sex,
      birth_date: newUser.birth_date,
      marital_status: newUser.marital_status,
      passport: newUser.passport,
      address_regist: newUser.address_regist,
      address_fact: newUser.address_fact,
    );

    emit(ProfilePageState(
        data: state.data.copyWith(userData: newUser),
        eventState: ProfileDataSaving()));

    // try {
    await _userService.updateProfile(
      userData: updatedUserData,
    );

    await LocalStorage.setUser(updatedUserData);

    emit(
      ProfilePageState(
        data: state.data,
        eventState: ProfileDataLoaded(),
      ),
    );
    // } catch (e) {
    //   emit(ProfilePageState(
    //       data: state.data,
    //       eventState: ProfileDataError(
    //           'An error occurred while updating the profile.')));
    // }
  }

  void updateStateData({
    String? email,
    String? phone,
    String? firstName,
    String? lastName,
    String? secondName,
    String? sex,
    String? birthDate,
    String? maritalStatus,
    String? idDocSer,
    String? idDocNo,
    String? idDocDate,
    String? idDocInfo,
    String? oblast,
    String? region,
    String? locality,
    String? address,
    String? house,
    String? flat,
    String? oblast1,
    String? region1,
    String? locality1,
    String? address1,
    String? house1,
    String? flat1,
  }) {
    emit(
      ProfilePageState(
        data: state.data.copyWith(
            userData: state.data.userData!.copyWith(
          email: email,
          phone: phone,
          first_name: firstName,
          last_name: lastName,
          second_name: secondName,
          sex: sex,
          birth_date: birthDate,
          marital_status: maritalStatus,
          passport: state.data.userData!.passport.copyWith(
            id_doc_ser: idDocSer,
            id_doc_no: idDocNo,
            id_doc_date: idDocDate,
            id_doc_info: idDocInfo,
          ),
          address_regist: state.data.userData!.address_regist.copyWith(
            region_id_1: oblast,
            region_id_2: region,
            region_id_3: locality,
            address: address,
            house: house,
            flat: flat,
          ),
          address_fact: state.data.userData!.address_fact.copyWith(
            region_id_1: oblast1,
            region_id_2: region1,
            region_id_3: locality1,
            address: address1,
            house: house1,
            flat: flat1,
          ),
        )),
        eventState: ProfileDataLoaded(),
      ),
    );
  }

  // Loading List Data
  Future<void> getMaritalStatus(String sex) async {
    final response = await _allListService.getMaritalStatus(sex: sex);
    final statusList =
        response.data.map((item) => MaritalStatus.fromJson(item)).toList();

    emit(
      ProfilePageState(
        data: state.data.copyWith(status: statusList, selectedStatus: sex),
        eventState: ProfileListLoaded(),
      ),
    );
  }

  Future<void> getOblastList() async {
    final response = await _allListService.getOblast();
    final oblastList =
        response.items.map((item) => Oblast.fromJson(item)).toList();

    emit(
      ProfilePageState(
        data: state.data.copyWith(oblast: oblastList),
        eventState: ProfileListLoaded(),
      ),
    );
  }

  Future<void> getDistrictList(Oblast oblast) async {
    final response = await _allListService.getDistrict(oblastId: oblast.id);
    final districtList =
        response.data.map((item) => District.fromJson(item)).toList();

    emit(
      ProfilePageState(
        data: state.data.copyWith(district: districtList),
        eventState: ProfileListLoaded(),
      ),
    );
  }

  Future<void> getLocalityList(District district) async {
    final response = await _allListService.getLocality(districtId: district.id);
    final localityList =
        response.data.map((item) => Locality.fromJson(item)).toList();

    emit(
      ProfilePageState(
        data: state.data.copyWith(locality: localityList),
        eventState: ProfileListLoaded(),
      ),
    );
  }

  Future<void> getFactDistrictList(Oblast oblast) async {
    final response = await _allListService.getDistrict(oblastId: oblast.id);
    final factDistrictList =
        response.data.map((item) => District.fromJson(item)).toList();

    emit(
      ProfilePageState(
        data: state.data.copyWith(factDistrict: factDistrictList),
        eventState: ProfileListLoaded(),
      ),
    );
  }

  Future<void> getFactLocalityList(District district) async {
    final response = await _allListService.getLocality(districtId: district.id);
    final factLocalityList =
        response.data.map((item) => Locality.fromJson(item)).toList();

    emit(
      ProfilePageState(
        data: state.data.copyWith(factLocality: factLocalityList),
        eventState: ProfileListLoaded(),
      ),
    );
  }

  void selectedType(String value) {
    emit(
      ProfilePageState(
        data: state.data.copyWith(selectedTypeIssued: value),
        eventState: ProfileListLoaded(),
      ),
    );
  }

  void uploadPassport(File file, int type) async {
    emit(
      ProfilePageState(
        data: state.data,
        eventState: UploadPassportPhoto(),
      ),
    );

    try {
      await _userService.uploadFile(file: file, type: type);

      emit(
        ProfilePageState(
          data: state.data,
          eventState: UploadPassportPhotoSuccess(),
        ),
      );
    } catch (e) {
      emit(
        ProfilePageState(
          data: state.data,
          eventState: UploadPassportPhotoError(
              'An error occurred while uploading the passport photo.'),
        ),
      );
    }
  }
}
