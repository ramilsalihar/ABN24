import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:project_name/presentation/modules/info/info_cubit/info_cubit.dart';
import 'offices_location_page.dart';

const backgroundAsset = 'assets/background/about_abn.svg';

@RoutePage()
class ABNOffices extends StatelessWidget {
  const ABNOffices({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(context.i10n.abn_offices),
      ),
      body: _body(context),
      background: SvgPicture.asset(
        backgroundAsset,
        fit: BoxFit.cover,
      ),
    );
  }
}


Widget _body(BuildContext context) {
  return BlocBuilder<InfoCubit, InfoState>(
      builder: (context, state) {
        if(state.eventState is InfoLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.eventState is InfoError){
          return Center(
            child: Text('Error occurred, ${state.eventState}'),
          );
        } else {
          final item = state.data.locationData;
          return Padding(
              padding: EdgeInsets.all(context.dimens.paddingSmall),
              child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    var location = item[index];
                    return ListTile(
                      title: Text(location.name),
                      trailing: IconButton(
                        onPressed: () {
                          //TODO: add navigation to offices location page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OfficesLocationPage(
                                      title: location.name,
                                      offices: location.childs)));
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  }));
        }
      });
}
