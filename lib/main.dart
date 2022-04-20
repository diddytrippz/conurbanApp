import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:consolidated_urban_management/login_page/login_page_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'onboarding/onboarding_widget.dart';
import 'home_page/home_page_widget.dart';
import 'messages_page/messages_page_widget.dart';
import 'members/members_widget.dart';
import 'settings_page/settings_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  Stream<ConsolidatedUrbanManagementFirebaseUser> userStream;
  ConsolidatedUrbanManagementFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  void initState() {
    super.initState();
    userStream = consolidatedUrbanManagementFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consolidated Urban Management',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Container(
              color: FlutterFlowTheme.of(context).mellow,
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
          : currentUser.loggedIn
              ? PushNotificationsHandler(child: NavBarPage())
              : LoginPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'onboarding';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'onboarding': OnboardingWidget(),
      'homePage': HomePageWidget(),
      'MessagesPage': MessagesPageWidget(),
      'members': MembersWidget(),
      'settingsPage': SettingsPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) =>
            setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        color: FlutterFlowTheme.of(context).campusGrey,
        activeColor: Color(0xFFF5F4F4),
        tabBackgroundColor: Color(0xFFE97A36),
        tabBorderRadius: 25,
        tabMargin: EdgeInsetsDirectional.fromSTEB(6, 12, 6, 14),
        padding: EdgeInsetsDirectional.fromSTEB(14, 12, 4, 12),
        gap: 6,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        duration: Duration(milliseconds: 1000),
        haptic: true,
        tabs: [
          GButton(
            icon: FFIcons.khome3,
            text: '',
            iconSize: 24,
          ),
          GButton(
            icon: FFIcons.kapps,
            text: '',
            iconSize: 20,
          ),
          GButton(
            icon: FFIcons.kmessage3,
            text: '',
            textStyle: TextStyle(
              color: FlutterFlowTheme.of(context).tertiaryColor,
            ),
            iconSize: 24,
          ),
          GButton(
            icon: FFIcons.kaddGroup,
            text: '',
            iconSize: 25,
          ),
          GButton(
            icon: FFIcons.kprofile,
            text: '',
            iconSize: 24,
          )
        ],
      ),
    );
  }
}
