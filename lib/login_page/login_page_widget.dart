import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController textFieldEmailController;
  TextEditingController textFieldPassController;
  bool textFieldPassVisibility;
  TextEditingController textFieldEmailResetController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textFieldEmailController = TextEditingController();
    textFieldPassController = TextEditingController();
    textFieldPassVisibility = false;
    textFieldEmailResetController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 10, 40, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0x00EEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: Image.asset(
                            'assets/images/Consolidated+urban+logo+2018+.png',
                          ).image,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                    ),
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(17),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              TabBar(
                                isScrollable: true,
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                indicatorWeight: 3,
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'u7vmnj8a' /* Sign In */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '8jvjimcm' /* Sign Up */,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 20,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(18, 0, 18, 0),
                                                child: TextFormField(
                                                  controller:
                                                      textFieldEmailController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    'textFieldEmailController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'x622u3gc' /* Enter Student Your Email */,
                                                    ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '5ogj9pc4' /* Enter Student Your Email */,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .campusGrey,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .campusGrey,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                25, 25, 25, 25),
                                                    prefixIcon: Icon(
                                                      Icons.alternate_email,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(18, 22, 18, 0),
                                                child: TextFormField(
                                                  controller:
                                                      textFieldPassController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    'textFieldPassController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  obscureText:
                                                      !textFieldPassVisibility,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'xy7pklso' /* Enter Your Password */,
                                                    ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '1ov9dee0' /* Enter Your Password */,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .campusGrey,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .campusGrey,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                25, 25, 25, 25),
                                                    prefixIcon: Icon(
                                                      FFIcons.klock,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 20,
                                                    ),
                                                    suffixIcon: InkWell(
                                                      onTap: () => setState(
                                                        () => textFieldPassVisibility =
                                                            !textFieldPassVisibility,
                                                      ),
                                                      focusNode: FocusNode(
                                                          skipTraversal: true),
                                                      child: Icon(
                                                        textFieldPassVisibility
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(25, 30, 25, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final user =
                                                        await signInWithEmail(
                                                      context,
                                                      textFieldEmailController
                                                          .text,
                                                      textFieldPassController
                                                          .text,
                                                    );
                                                    if (user == null) {
                                                      return;
                                                    }

                                                    await Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .bottomToTop,
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        reverseDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    300),
                                                        child: NavBarPage(
                                                            initialPage:
                                                                'onboarding'),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'hvms4lhd' /* Sign In */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 55,
                                                    color: Color(0xFF181818),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: Colors.white,
                                                        ),
                                                    elevation: 40,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 12,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    if (textFieldEmailController
                                                        .text.isEmpty) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Email required!',
                                                          ),
                                                        ),
                                                      );
                                                      return;
                                                    }
                                                    await resetPassword(
                                                      email:
                                                          textFieldEmailController
                                                              .text,
                                                      context: context,
                                                    );
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8hj2kqou' /* Forgot Password? */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  22, 50, 22, 0),
                                          child: TextFormField(
                                            controller:
                                                textFieldEmailResetController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              'textFieldEmailResetController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '79xzjtu0' /* Enter Student Your Email */,
                                              ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'tsswo6fw' /* Enter Student Your Email */,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .campusGrey,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .campusGrey,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(25, 25, 25, 25),
                                              prefixIcon: Icon(
                                                Icons.alternate_email,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 30, 25, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (textFieldEmailResetController
                                                  .text.isEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Email required!',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }
                                              await resetPassword(
                                                email:
                                                    textFieldEmailResetController
                                                        .text,
                                                context: context,
                                              );
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'vm9mkveh' /* Create account */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 50,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
