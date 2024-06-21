import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/common/app_state.dart';
import 'package:pizzeria_app/src/common/common_widgets/big_button.dart';
import 'package:pizzeria_app/src/features/auth/presentation/controllers/login_controller.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:pizzeria_app/src/utils/text_utils.dart';
import 'package:sizer/sizer.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(loginControllerProvider.notifier);
    final appState = ref.watch(appStateProvider);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              left: Insets.lg,
              right: Insets.lg,
              top: Insets.lg,
              bottom: Insets.lg),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                GoRouter.of(context).push('/profile');
              },
              child: appState is Authorized
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.green.shade300,
                              backgroundImage: appState.login.photoUrl != null
                                  ? NetworkImage(appState.login.photoUrl!)
                                  : null, // Set to null when photoUrl is null
                              child: appState.login.photoUrl == null
                                  ? Text(
                                      TextUtils.getInitials(
                                          '${appState.login.firstName} ${appState.login.lastName}'),
                                      style: TextStyle(
                                          fontSize: FontSizes.s24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : null, // Show Text only when photoUrl is null
                            ),
                            SizedBox(width: 3.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, ${appState.login.firstName}',
                                  style: TextStyle(
                                      fontSize: FontSizes.s14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Show profile',
                                  style: TextStyle(
                                      fontSize: FontSizes.s10,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              GoRouter.of(context).push('/profile');
                            },
                            icon: const Icon(
                              FontAwesomeIcons.chevronRight,
                              size: 14,
                              color: Colors.black38,
                            ))
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/images/pizza_logo.jpg',
                                  fit: BoxFit.contain),
                            ),
                            SizedBox(width: 3.w),
                            Text('My Pizzeria',
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: FontSizes.s16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: Insets.lg),
                        SizedBox(
                          width: double.infinity,
                          child: BigButton(
                            text: 'Login',
                            onTap: () {
                              GoRouter.of(context).push('/login');
                            },
                            isGradient: true,
                            icon: FontAwesomeIcons.unlock,
                            gradientColors: [
                              Colors.orange.shade500,
                              Colors.red.shade300,
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(height: 1.h),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     Text('Want to start your own business?',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             fontSize: FontSizes.s10,
            //             fontWeight: FontWeight.w500)),
            //     SizedBox(height: 1.h),
            //     BigButton(
            //         text: 'Become a Pro',
            //         isGradient: true,
            //         onTap: () {}),
            //   ],
            // ),
            SizedBox(height: 5.h),
            Expanded(
              child: ListView(
                children: [
                  ProfileItem(
                    icon: FontAwesomeIcons.language,
                    title: 'Language',
                    onTap: () {},
                  ),
                  ProfileItem(
                    icon: FontAwesomeIcons.shop,
                    title: 'Pizzerias',
                    onTap: () {},
                  ),
                  ProfileItem(
                    icon: FontAwesomeIcons.briefcase,
                    title: 'Work and Careers',
                    onTap: () {},
                  ),
                  ProfileItem(
                    icon: FontAwesomeIcons.trademark,
                    title: 'Franchising',
                    onTap: () {},
                  ),
                  ProfileItem(
                    icon: FontAwesomeIcons.peopleGroup,
                    title: 'Domino\'s Club',
                    onTap: () {},
                  ),
                  ProfileItem(
                    icon: FontAwesomeIcons.bookOpenReader,
                    title: 'Leave Feedback',
                    onTap: () {},
                  ),
                  ProfileItem(
                    icon: FontAwesomeIcons.newspaper,
                    title: 'News',
                    onTap: () {},
                  ),
                  ProfileItem(
                    icon: FontAwesomeIcons.rightFromBracket,
                    title: 'Log out',
                    onTap: () {
                      auth.logout();
                      GoRouter.of(context).replace('/login');
                    },
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class ProfileItem extends ConsumerWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  const ProfileItem(
      {required this.onTap,
      required this.icon,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
          ),
        ],
      ),
      title: Text(title),
      trailing: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.chevronRight,
            size: 14,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
