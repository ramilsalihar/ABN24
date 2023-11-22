import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/services/info_service.dart';
import '../../../../domain/models/app_response.dart';
import '../../../../domain/models/info/info_model.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(InfoState.initial());

  final _infoService = InfoService(GetIt.I.get<Dio>());

  Future<void> getCreditInfo() async {
    emit(InfoState(data: state.data, eventState: InfoLoading()));
    try {
      final response = await _infoService.getCreditInfo();

      if (response.response.statusCode == 200) {
        final String data =
            response.response.data.replaceAll(RegExp(r'\s+'), ' ');

        final creditInfo = jsonDecode(data);
        final creditData = AppResponse.fromJson(creditInfo);

        final List<CreditData> creditDataList =
            creditData.data.map((item) => CreditData.fromJson(item)).toList();

        emit(InfoState(
            data: state.data.copyWith(creditData: creditDataList),
            eventState: InfoLoaded()));
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getAboutAbn() async {
    emit(InfoState(data: state.data, eventState: InfoLoading()));

    try {
      final response = await _infoService.aboutAbn();

      final List<Location> locationData =
          response.data.map((item) => Location.fromJson(item)).toList();

      emit(
        InfoState(
          data: state.data.copyWith(
            locationData: locationData,
          ),
          eventState: InfoLoaded(),
        ),
      );
    } catch (e) {
      emit(
        InfoState(
          data: state.data,
          eventState: InfoError(),
        ),
      );
    }
  }

  Future<void> getAccountDetails() async {
    emit(
      InfoState(
        data: state.data,
        eventState: InfoLoading(),
      ),
    );
    try {
      final response = await _infoService.getAccountDetails();

      final List<Account> accountData =
          response.data.map((item) => Account.fromJson(item)).toList();

      emit(
        InfoState(
          data: state.data.copyWith(accountData: accountData),
          eventState: InfoLoaded(),
        ),
      );
    } catch (e) {
      emit(
        InfoState(
          data: state.data,
          eventState: InfoError(),
        ),
      );
    }
  }

  Future<void> getContacts() async {
    emit(
      InfoState(
        data: state.data,
        eventState: InfoLoading(),
      ),
    );

    try {
      final response = await _infoService.getContacts();

      final List<ContactItem> items =
          response.data.map((item) => ContactItem.fromJson(item)).toList();

      emit(
        InfoState(
          data: state.data.copyWith(contactData: items),
          eventState: InfoLoaded(),
        ),
      );
    } catch (e) {
      emit(
        InfoState(
          data: state.data,
          eventState: InfoError(),
        ),
      );
    }
  }
}
