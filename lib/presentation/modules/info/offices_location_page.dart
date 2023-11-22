import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../domain/models/info/info_model.dart';

const backgroundAsset = 'assets/background/about_abn.svg';

@RoutePage()
class OfficesLocationPage extends StatelessWidget {
  const OfficesLocationPage({
    super.key,
    required this.title,
    required this.offices,
  });

  final String title;
  final List<LocationChild> offices;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      background: SvgPicture.asset(
        backgroundAsset,
        fit: BoxFit.cover,
      ),
      body: Padding(
          padding: EdgeInsets.all(context.dimens.paddingMedium),
          child: ListView.builder(
            itemCount: offices.length,
            itemBuilder: (context, index) => InkWell(
              child: ListTile(
                title: Text(offices[index].name),
                subtitle: Text(offices[index].address),
                trailing: const Icon(Icons.map),
              ),
              onTap: () {
                launchUrl(Uri.parse(offices[index].link));
              },
            ),
          )),
    );
  }
}
