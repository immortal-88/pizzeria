import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/common/common_widgets/custom_text_field.dart';
import 'package:pizzeria_app/src/utils/styles.dart';

openAddress(BuildContext context, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled:
        true, // Set to true for adjusting height according to content
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(Insets.med),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Insets.lg),
                          child: Text(
                            'Select address',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: FontSizes.s12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  HookBuilder(builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setModalState) {
                        return Theme(
                            data: ThemeData.dark().copyWith(
                              colorScheme: const ColorScheme.dark(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                surface: Colors.white,
                                onSurface: Colors.black,
                              ),
                              dialogBackgroundColor: Colors.black,
                            ),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Insets.medx,
                                      vertical: Insets.med),
                                  child: CustomTextField(
                                      withBorder: false, hintText: 'City'),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Insets.medx,
                                      vertical: Insets.med),
                                  child: CustomTextField(
                                      withBorder: false, hintText: 'Street'),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Insets.medx,
                                      vertical: Insets.med),
                                  child: CustomTextField(
                                      withBorder: false,
                                      hintText: 'House number'),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Insets.medx,
                                      vertical: Insets.med),
                                  child: CustomTextField(
                                      withBorder: false,
                                      hintText: 'Apartment number'),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Insets.medx,
                                      vertical: Insets.med),
                                  child: CustomTextField(
                                      withBorder: false, hintText: 'Code'),
                                ),
                              ],
                            ));
                      },
                    );
                  }),
                  SizedBox(height: Insets.medx),
                ],
              ),
              SizedBox(height: Insets.medx),
            ],
          ),
        ),
      );
    },
  );
}
