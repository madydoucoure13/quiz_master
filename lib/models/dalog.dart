// ignore_for_file: use_build_context_synchronously

library clean_dialog;

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_master/services/api_service.dart';

/// A Clean and minimalist Flutter Dialog
/***
 * CleanDialog(
    title: 'Error',
    content: 'We were not able to update your information.',
    backgroundColor: const Color(0XFFbe3a2c),
    titleTextStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
    contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
    actions: [
        CleanDialogActionButtons(
            actionTitle: 'Cancel',
            onPressed: () => Navigator.pop(context),
        ),
        CleanDialogActionButtons(
            actionTitle: 'Try again',
            textColor: const Color(0XFF27ae61),
            onPressed: () {},
        ),
    ],
    ),
 */
///
class CleanDialog extends StatelessWidget {
  const CleanDialog({
    super.key,
    required this.backgroundColor,
    required this.actions,
    required this.title,
    required this.content,
    this.titleTextStyle,
    this.contentTextStyle,
    this.titleTextAlign,
    this.contentTextAlign,
  });

  /// Color to be displayed in the background of the Dialog
  final Color backgroundColor;

  /// The String to be displayed as title for the Dialog
  final String title;

  /// The dialog's text content
  final String content;

  /// The list of Buttons that will be displayed in the Dialog
  final List<CleanDialogActionButtons> actions;

  /// The title text alignement default value is TextAlign.Center
  final TextAlign? titleTextAlign;

  /// The content text alignement default value is TextAlign.Center
  final TextAlign? contentTextAlign;

  /// The content text style default value is TextStyle(fontWeight: FontWeight.bold, fontSize: 23)
  final TextStyle? titleTextStyle;

  /// The content text style default value is TextStyle(fontSize: 16)
  final TextStyle? contentTextStyle;

  /// Used to transfer backgroundColor to buttons textColor.
  List<CleanDialogActionButtons> _buildStyledActionButtons() => actions
      .map((e) => e.copyWith(textColor: e.textColor ?? backgroundColor))
      .toList();

  @override
  Widget build(BuildContext context) {
    final List<CleanDialogActionButtons> actions = _buildStyledActionButtons();

    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        textAlign: titleTextAlign ?? TextAlign.center,
                        style: titleTextStyle ??
                            const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ),
                    Text(
                      content,
                      textAlign: contentTextAlign ?? TextAlign.center,
                      style: contentTextStyle ?? const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => actions.elementAt(index),
              separatorBuilder: (context, _) => Divider(
                color: backgroundColor.withOpacity(.5),
                height: 1,
              ),
              itemCount: actions.length,
            )
          ],
        ),
      ),
    );
  }
}

class CleanDialogActionButtons extends StatelessWidget {
  const CleanDialogActionButtons(
      {super.key,
      required this.actionTitle,
      required this.onPressed,
      this.textColor});

  /// The String text that will be displayed for the action.
  final String actionTitle;

  /// The action that will be executed once the button tapped.
  final VoidCallback onPressed;

  /// Optional Color that will override the default parent `backgoundColor`.
  final Color? textColor;

  CleanDialogActionButtons copyWith({
    String? actionTitle,
    VoidCallback? onPressed,
    Color? textColor,
  }) =>
      CleanDialogActionButtons(
        actionTitle: actionTitle ?? this.actionTitle,
        onPressed: onPressed ?? this.onPressed,
        textColor: textColor ?? this.textColor,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: textColor?.withOpacity(.1),
      highlightColor: textColor?.withOpacity(.2),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          actionTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor ?? Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
// :::::::::::::::::::::::::::::::::::::::::;

// class PopupController extends StatefulWidget {
//   const PopupController({super.key});

//   @override
//   State<PopupController> createState() => _PopupControllerState();
// }

// class _PopupControllerState extends State<PopupController> {
//   @override

//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
class Popup {
  final TextEditingController _emailController2 = TextEditingController();
  final TextEditingController _emailController3 = TextEditingController();
  ServiceLoger service = ServiceLoger();
  final _formkey = GlobalKey<FormState>();

  void dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
              child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 160, 159, 159)),
                ),
                const Text("  Forget Password  "),
                Container(
                  height: 1,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 160, 159, 159)),
                ),
              ],
            ),
            content: Container(
              height: 220,
              // width: 200,
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const Text(
                      "Entrez votre mail pour la  reuitialisation  de votre mot de passe",
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(width: 0.5, color: Colors.grey))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: _emailController2,
                        decoration: const InputDecoration(
                          labelText: "Email *",
                          hintText: "Entree votre adresse mail",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              await service
                                  .verifyUserEmail(_emailController2.text)
                                  .then((value) {
                                dialogConfirmCode(context, value);
                              }).catchError((onError) {
                                // ignore: prefer_interpolation_to_compose_strings
                                throw ("erreur : " + onError);
                              });
                            }
                          },
                          child: const Text("Envoyer")),
                    )
                  ],
                ),
              ),
            ),
            // actions: [],
          ));
        });
  }

  void dialogConfirmCode(BuildContext context, String code) {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
              child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: 30,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 160, 159, 159)),
                ),
                const Text("  CONFIRMER CODE  "),
                Container(
                  height: 1,
                  width: 30,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 160, 159, 159)),
                ),
              ],
            ),
            content: Container(
              height: 220,
              width: 200,
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const Text(
                      "Entrez votre code de confirmation",
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(width: 0.5, color: Colors.grey))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: _emailController3,
                        decoration: const InputDecoration(
                          // labelText: "",
                          hintText: "Entree votre code",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              if(_emailController3.text == code){
                                // ::::doit ce rediriger vers la page de modification de password
                              }
                            }
                          },
                          child: const Text("Envoyer")),
                    )
                  ],
                ),
              ),
            ),
            // actions: [],
          ));
        });
  }
}
