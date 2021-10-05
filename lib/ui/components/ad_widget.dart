import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../service/http_handler.dart';
import '../../internacionalization/word.dart';
import '../../models/ad.dart';
import '../../ui/dialogs/ad_clicked.dart';
import '../../utils/utils.dart';

class AdWidget extends StatelessWidget {
  final Ad ad;
  const AdWidget(this.ad, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpHandler httpHandler = Provider.of<HttpHandler>(context);

    return GestureDetector(
      onTap: () async {
        final result = await httpHandler.sendAdClick(ad);
        showMyDialog(context: context, child: AdClickDialog(Word.ad_click));
      },
      child: Container(
        width: 430,
        height: 120,
        child: Card(
          elevation: 1,
          clipBehavior: Clip.hardEdge,
          child: CachedNetworkImage(
            imageUrl: ad.picture,
            placeholder: (context, url) =>
                Center(child: CupertinoActivityIndicator()),
            errorWidget: (context, url, error) =>
                Icon(CupertinoIcons.clear_circled),
            width: 430,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
