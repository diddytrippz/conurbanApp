import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../login_page/login_page_widget.dart';
import '../../more_info/more_info_widget.dart';
import '../../edit_profile/edit_profile_widget.dart';
import '../../chat_page/chat_page_widget.dart';
import '../../verify/verify_widget.dart';
import '../../create_group/create_group_widget.dart';
import '../../add_chat_members/add_chat_members_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.mellow,
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/Consolidated+urban+logo+2018+.png',
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'loginPage': (data) async => LoginPageWidget(),
  'homePage': (data) async => NavBarPage(initialPage: 'HomePageWidget'),
  'settingsPage': (data) async => NavBarPage(initialPage: 'SettingsPageWidget'),
  'moreInfo': (data) async => MoreInfoWidget(
        jobStatus: await getDocumentParameter(
            data, 'jobStatus', MaintenanceRecord.serializer),
      ),
  'editProfile': (data) async => EditProfileWidget(),
  'ChatPage': (data) async => ChatPageWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'MessagesPage': (data) async => NavBarPage(initialPage: 'MessagesPageWidget'),
  'verify': (data) async => VerifyWidget(),
  'members': (data) async => NavBarPage(initialPage: 'MembersWidget'),
  'createGroup': (data) async => CreateGroupWidget(),
  'addChatMembers': (data) async => AddChatMembersWidget(
        chat: await getDocumentParameter(data, 'chat', ChatsRecord.serializer),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
