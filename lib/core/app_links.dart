import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLinks {
  static const offerta = 'https://abn.kg/oferta/';
  static const abn = 'https://abn.kg/';
  static const tezakcha = 'https://tezakcha.kg/';

  Uri get offertaUri => Uri.parse(offerta);
  Uri get abnUri => Uri.parse(abn);
  Uri get tezakchaUri => Uri.parse(tezakcha);

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(content: Text('URL launched successfully')),
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}