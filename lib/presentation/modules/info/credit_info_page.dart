import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_name/core/extensions/app_links_context.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:project_name/presentation/modules/info/info_cubit/info_cubit.dart';

const backgroundAsset = 'assets/background/credits_page.svg';

@RoutePage()
class CreditPage extends StatefulWidget {
  const CreditPage({super.key});

  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await BlocProvider.of<InfoCubit>(context).getCreditInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.dimens.paddingSmall),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  context.i10n.credit_products,
                  style: Theme.of(context).textTheme.displayLarge,
                )),
          ),
          const Align(
              alignment: Alignment.center,
              child: Text(
                'Используя АБН-онлайн Вы можете подать заявку\n и получить кредиты',
                textAlign: TextAlign.center,
              )),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Expanded(child: _infoCard(context)),
          // const Spacer(),
          _footer(context, context.i10n.more_info_about_credits)
        ],
      ).padding(
        EdgeInsets.only(
          left: context.dimens.paddingMedium,
          right: context.dimens.paddingMedium,
        ),
      ),
      background: SvgPicture.asset(
        backgroundAsset,
        fit: BoxFit.cover,
      ),
    );
  }
}

Widget _infoCard(BuildContext context) {
  return BlocConsumer<InfoCubit, InfoState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.eventState is InfoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.eventState is InfoLoaded) {
          final info = state.data.creditData;
          return ListView.builder(
            itemCount: info.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = info[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                      children: [
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                        ),
                        Html(data: item.description),
                      ],
                    ).padding(const EdgeInsets.all(5.0)),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('Error occurred'),
          );
        }
      });
}

Widget _footer(BuildContext context, String text) {
  return Padding(
    padding: EdgeInsets.all(context.dimens.paddingSmall),
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: context.appLinks.tezakchaUri.toString(),
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () =>
                  context.appLinks.launchURL(context.appLinks.tezakchaUri),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    ),
  );
}
