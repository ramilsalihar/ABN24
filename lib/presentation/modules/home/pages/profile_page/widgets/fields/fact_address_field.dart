import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../domain/models/all_list/list_model.dart';
import '../../../../../../core/widgets/drop_down_field.dart';
import '../../../../../../core/widgets/register_field.dart';
import '../../cubit/profile_page_cubit.dart';
import '../../cubit/profile_page_state.dart';

class FactAdress extends StatefulWidget {
  const FactAdress({super.key});

  @override
  State<FactAdress> createState() => _FactAdressState();
}

class _FactAdressState extends State<FactAdress> {
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  bool factOblastLoaded = false;
  bool factDistrictLoaded = false;
  String hintOblast = 'Чуйская область';
  String hintDistrict = 'Чуйский район';
  String hintLocality = 'Аламединский район';
  String hintStreet = '9 - мкр';
  String hintHouse = '2';
  String hintFlat = '1';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilePageCubit, ProfilePageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // Showing hintText
        String? oblastState = state.data.userData!.address_fact.region_id_1;
        hintOblast =  oblastState == '' ? hintOblast : oblastState!;
        String? districtState = state.data.userData!.address_fact.region_id_2;
        hintDistrict =  districtState == '' ? hintDistrict : districtState!;
        String? localityState = state.data.userData!.address_fact.region_id_3;
        hintLocality =  localityState == '' ? hintLocality : localityState!;
        String? streetState = state.data.userData!.address_fact.address;
        hintStreet =  streetState == '' ? hintStreet : streetState;
        String? houseState = state.data.userData!.address_fact.house;
        hintHouse =  houseState == '' ? hintHouse : houseState;
        String? flatState = state.data.userData!.address_fact.flat;
        hintFlat =  flatState == '' ? hintFlat : flatState;

        if(state.data.userData?.address_fact.region_id_1 != ''){
          factOblastLoaded = true;
        }
        if(state.data.userData?.address_fact.region_id_2 != ''){
          factDistrictLoaded = true;
        }
        if(state.eventState is ProfileListLoaded ||
            state.eventState is ProfileDataLoaded &&
                state.data.oblast != null){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropDownField<Oblast>(
                hintText: hintOblast,
                itemWidgets: state.data.oblast!.map((object) {
                  return DropdownMenuItem<String>(
                    value: object.region_name,
                    child: Text(object.region_name),
                  );
                }).toList(),
                updateData: (Oblast value) async {
                  await BlocProvider.of<ProfilePageCubit>(context)
                      .getFactDistrictList(value);
                  BlocProvider.of<ProfilePageCubit>(context)
                      .updateStateData(oblast1: value.region_name);
                },
                valueToString: (Oblast value) {
                  return value.region_name;
                },
                stringToValue: (String value) {
                  return state.data.oblast!.firstWhere(
                          (element) => element.region_name == value);
                },
              ),
              factOblastLoaded
                  ? DropDownField<District>(
                hintText: hintDistrict,
                itemWidgets: state.data.district!.map((object) {
                  return DropdownMenuItem<String>(
                    value: object.name,
                    child: Text(object.name),
                  );
                }).toList(),
                updateData: (District value) async {
                  await BlocProvider.of<ProfilePageCubit>(context)
                      .getFactLocalityList(value);
                  BlocProvider.of<ProfilePageCubit>(context)
                      .updateStateData(region1: value.name);
                },
                valueToString: (District value) {
                  return value.name;
                },
                stringToValue: (String value) {
                  return state.data.district!.firstWhere(
                          (element) => element.name == value);
                },
              )
                  : const SizedBox(),
              factDistrictLoaded
                  ? DropDownField<Locality>(
                hintText: hintLocality,
                itemWidgets: state.data.locality!.map((object) {
                  return DropdownMenuItem<String>(
                    value: object.name,
                    child: Text(object.name),
                  );
                }).toList(),
                updateData: (Locality value) {
                  BlocProvider.of<ProfilePageCubit>(context)
                      .updateStateData(locality1: value.name);
                },
                valueToString: (Locality value) {
                  return value.name;
                },
                stringToValue: (String value) {
                  return state.data.locality!.firstWhere(
                          (element) => element.name == value);
                },
              )
                  : const SizedBox(),
              RegisterField(
                hintText: hintStreet,
                borderColor: Colors.green,
                keyboardType: TextInputType.text,
                controller: a,
                onCompleted: () =>
                  BlocProvider.of<ProfilePageCubit>(context)
                      .updateStateData(address1: a.text),
              ),
              RegisterField(
                hintText: hintHouse,
                borderColor: Colors.green,
                keyboardType: TextInputType.text,
                controller: b,
                onCompleted: () =>
                  BlocProvider.of<ProfilePageCubit>(context)
                      .updateStateData(house1: b.text),
              ),
              RegisterField(
                hintText: hintFlat,
                borderColor: Colors.green,
                keyboardType: TextInputType.text,
                controller: c,
                onCompleted: () =>
                  BlocProvider.of<ProfilePageCubit>(context)
                      .updateStateData(flat1: c.text),
              ),
            ],
          );}
        return const Center(
          child: Text('Unknown state'),
        );
      },
    );
  }
}