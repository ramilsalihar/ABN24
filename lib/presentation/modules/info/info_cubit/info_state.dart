part of 'info_cubit.dart';

class InfoData {
  final List<CreditData> creditData;
  final List<Location> locationData;
  final List<Account> accountData;
  final List<ContactItem> contactData;

  const InfoData({
    this.creditData = const [],
    this.locationData = const [],
    this.accountData = const [],
    this.contactData = const [],
  });

  InfoData copyWith({
    List<CreditData>? creditData,
    List<Location>? locationData,
    List<Account>? accountData,
    List<ContactItem>? contactData,
  }) {
    return InfoData(
      creditData: creditData ?? this.creditData,
      locationData: locationData ?? this.locationData,
      accountData: accountData ?? this.accountData,
      contactData: contactData ?? this.contactData,
    );
  }
}

@immutable
class InfoState {
  final InfoData data;
  final InfoEventState eventState;

  const InfoState({
    required this.data,
    required this.eventState,
  });

  InfoState.initial()
      : data = const InfoData(),
        eventState = InfoInitial();
}

abstract class InfoEventState {}

class InfoInitial extends InfoEventState {}

class InfoLoading extends InfoEventState {}

class InfoLoaded extends InfoEventState {}

class InfoError extends InfoEventState {}
