import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../internacionalization/app_language.dart';
import '../../ui/components/my_dialog.dart';
import '../../utils/color_palette.dart';

class AdClickDialog extends StatefulWidget {
  Word word;
  AdClickDialog(this.word);

  @override
  _AdClickDialogState createState() => _AdClickDialogState();
}

class _AdClickDialogState extends State<AdClickDialog> {
  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<AppLanguage>(context, listen: false);

    return MyDialog(
      width: 480,
      height: 483,
      child: child(context, lang),
    );
  }

  final frases = [Word.frase1, Word.frase2, Word.frase3];
  Random random = new Random();
  Word frase;
  Widget child(BuildContext context, AppLanguage lang) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/dialogs/confirm_orders.png",
              height: 252,
            ),
            SizedBox(
              width: 460,
              child: Text(
                lang.w(frase),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "TimesBold",
                    fontSize: 30,
                    color: ColorPalette.gray),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: SizedBox(
                width: 332,
                child: Text(
                  lang.w(widget.word),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "SofiaProBold",
                      fontSize: 17,
                      color: ColorPalette.gray2),
                ),
              ),
            ),
            Divider(
              height: 1,
            ),
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 173,
                    offset: Offset(0, 9),
                    color: ColorPalette.gray.withOpacity(0.4))
              ]),
              child: RaisedButton(
                color: Colors.white,
                elevation: 0,
                highlightColor: ColorPalette.melon,
                child: Text(
                  lang.w(Word.thanks),
                  style: TextStyle(fontFamily: "SofiaProBold", fontSize: 17),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        Align(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/home_icons/close.png",
                width: 31,
                height: 31,
              ),
            ),
          ),
          alignment: Alignment.topRight,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    frase = frases[random.nextInt(frases.length)];
  }
}
