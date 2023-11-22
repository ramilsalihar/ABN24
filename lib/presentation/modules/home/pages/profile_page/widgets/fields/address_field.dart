import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../domain/models/all_list/list_model.dart';
import '../../../../../../core/widgets/drop_down_field.dart';
import '../../../../../../core/widgets/register_field.dart';
import '../../cubit/profile_page_cubit.dart';
import '../../cubit/profile_page_state.dart';
import 'fact_address_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressField extends StatefulWidget {
  const AddressField({super.key});

  @override
  State<AddressField> createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  bool factAddress = false;
  bool oblastLoaded = false;
  bool districtLoaded = false;
  String hintOblast = 'Чуйская область';
  String hintDistrict = 'Чуйский район';
  String hintLocality = 'Аламединский район';
  String hintStreet = '9 - мкр';
  String hintHouse = '2';
  String hintFlat = '1';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return FutureBuilder(
        future: BlocProvider.of<ProfilePageCubit>(context).getOblastList(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return BlocConsumer<ProfilePageCubit, ProfilePageState>(
              listener: (context, state) {},
              builder: (context, state) {
                // Showing hintText
                String? oblastState =
                    state.data.userData!.address_regist.region_id_1;
                hintOblast = oblastState == '' ? hintOblast : oblastState!;
                String? districtState =
                    state.data.userData!.address_regist.region_id_2;
                hintDistrict =
                    districtState == '' ? hintDistrict : districtState!;
                String? localityState =
                    state.data.userData!.address_regist.region_id_3;
                hintLocality =
                    localityState == '' ? hintLocality : localityState!;
                String? streetState =
                    state.data.userData!.address_regist.address;
                hintStreet = streetState == '' ? hintStreet : streetState;
                String? houseState = state.data.userData!.address_regist.house;
                hintHouse = houseState == '' ? hintHouse : houseState;
                String? flatState = state.data.userData!.address_regist.flat;

                if (state.eventState is ProfileListLoaded ||
                    state.eventState is ProfileDataLoaded &&
                        state.data.oblast != null) {
                  if (state.data.userData?.address_regist.region_id_1 != '') {
                    oblastLoaded = true;
                  }
                  if (state.data.userData?.address_regist.region_id_2 != '') {
                    districtLoaded = true;
                  }
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
                                .getDistrictList(value);
                            BlocProvider.of<ProfilePageCubit>(context)
                                .updateStateData(oblast: value.region_name);
                          },
                          valueToString: (Oblast value) {
                            return value.region_name;
                          },
                          stringToValue: (String value) {
                            return state.data.oblast!.firstWhere(
                                (element) => element.region_name == value);
                          },
                        ),
                        oblastLoaded
                            ? DropDownField<District>(
                                hintText: hintDistrict,
                                itemWidgets: state.data.district!.map((object) {
                                  return DropdownMenuItem<String>(
                                    value: object.name,
                                    child: Text(object.name),
                                  );
                                }).toList(),
                                updateData: (District value) async {
                                  await BlocProvider.of<ProfilePageCubit>(
                                          context)
                                      .getLocalityList(value);
                                  BlocProvider.of<ProfilePageCubit>(context)
                                      .updateStateData(region: value.name);
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
                        districtLoaded
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
                                      .updateStateData(locality: value.name);
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
                                .updateStateData(address: a.text)
                        ),
                        RegisterField(
                          hintText: hintHouse,
                          borderColor: Colors.green,
                          keyboardType: TextInputType.text,
                          controller: b,
                          onCompleted: () =>
                            BlocProvider.of<ProfilePageCubit>(context)
                                .updateStateData(house: b.text),
                        ),
                        RegisterField(
                          hintText: hintFlat,
                          borderColor: Colors.green,
                          keyboardType: TextInputType.text,
                          controller: c,
                          onCompleted: () =>
                            BlocProvider.of<ProfilePageCubit>(context)
                                .updateStateData(flat: c.text),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: factAddress,
                                  onChanged: (value) {
                                    setState(() {
                                      factAddress = value!;
                                    });
                                  }),
                              Text(loc.fact_address_of_living),
                            ],
                          ),
                        ),
                        if (factAddress) const FactAdress(),
                      ]);
                }
                return const Center(
                  child: Text('Loading data'),
                );
              });
        });
  }
}
