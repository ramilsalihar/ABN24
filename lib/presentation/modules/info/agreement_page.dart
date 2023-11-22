import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/app_links_context.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';

@RoutePage()
class AgreementPage extends StatelessWidget {
  const AgreementPage({super.key});

  final String text =
      'Veniam velit velit dolor exercitation sint ea laboris. Esse consectetur consequat commodo aliquip. Aliqua amet irure aliqua ut mollit nostrud magna ex proident consectetur ad. Aliqua ipsum nostrud fugiat sunt et qui. Ipsum labore do laborum occaecat cupidatat officia sint. Consectetur dolore do aliqua nulla. Minim in nisi eu aliqua ipsum id non.'
      'Culpa ex esse ipsum sit irure in non excepteur ut in. Eu minim est do officia laboris dolore magna ullamco Lorem proident tempor reprehenderit sint ullamco. Eiusmod do nostrud mollit nisi elit excepteur duis dolor ex occaecat laborum do. Irure commodo deserunt minim consequat eu in et quis eiusmod occaecat et ut cillum consectetur. Aliquip magna consectetur adipisicing culpa dolore enim quis dolore. Ad reprehenderit occaecat ipsum fugiat minim occaecat magna. Commodo esse voluptate consequat consectetur';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: [
              Text(
                context.i10n.agreement,
                style: Theme.of(context).textTheme.displayMedium,
              ).padding(
                EdgeInsets.all(context.dimens.paddingSmall),
              ),
              Text(text),
              const Spacer(),
              TextButton(
                      onPressed: () {
                        context.appLinks.launchURL(context.appLinks.offertaUri);
                      },
                      child: Text(context.i10n.offerta_for_agreement))
                  .padding(
                EdgeInsets.all(context.dimens.paddingSmall),
              ),
            ],
          ).padding(EdgeInsets.all(context.dimens.paddingSmall)),
      ),
    );
  }
}
