import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../more_info/more_info_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String choiceChipsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: NavBarPage(initialPage: 'MessagesPage'),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.edit_outlined,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CircularPercentIndicator(
                                                  percent: 0.75,
                                                  radius: 42.5,
                                                  lineWidth: 15,
                                                  animation: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                  backgroundColor:
                                                      Color(0xFFF1F4F8),
                                                  center: Text(
                                                    'Tasks ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 10,
                                                        ),
                                                  ),
                                                  startAngle: 360,
                                                ),
                                                Wrap(
                                                  spacing: 0,
                                                  runSpacing: 0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 8, 0, 0),
                                                      child: Text(
                                                        'Completed',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 4),
                                                  child: Text(
                                                    dateTimeFormat('MMMMEEEEd',
                                                        getCurrentTimestamp),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 4),
                                                  child: Text(
                                                    dateTimeFormat('jm',
                                                        getCurrentTimestamp),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: FlutterFlowChoiceChips(
                                      initiallySelected:
                                          choiceChipsValue != null
                                              ? [choiceChipsValue]
                                              : ['49 Jorissen'],
                                      options: [
                                        ChipData('49 Jorissen'),
                                        ChipData('80 Jorissen'),
                                        ChipData('Braamlofts'),
                                        ChipData('Dunvista'),
                                        ChipData('126 Siemert'),
                                        ChipData('Wynton Joy'),
                                        ChipData('Rennie House'),
                                        ChipData('YMCA')
                                      ],
                                      onChanged: (val) => setState(
                                          () => choiceChipsValue = val.first),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0xFF040404),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 0,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10, 4, 10, 4),
                                        elevation: 4,
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF262D34),
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        iconSize: 18,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10, 4, 10, 4),
                                        elevation: 4,
                                      ),
                                      chipSpacing: 18,
                                      rowSpacing: 10,
                                      multiselect: false,
                                      initialized: choiceChipsValue != null,
                                      alignment: WrapAlignment.start,
                                    ),
                                  ),
                                ],
                              ),
                              if ((currentUserDocument?.role) == 'Admin')
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 0),
                                    child: AuthUserStreamWidget(
                                      child: DefaultTabController(
                                        length: 3,
                                        initialIndex: 0,
                                        child: Column(
                                          children: [
                                            TabBar(
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              unselectedLabelColor:
                                                  Color(0xFF6E6E6E),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              tabs: [
                                                Tab(
                                                  text: 'Submitted',
                                                ),
                                                Tab(
                                                  text: 'Pending',
                                                ),
                                                Tab(
                                                  text: 'Completed',
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    12, 16, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Search results',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  MaintenanceRecord>>(
                                                            stream:
                                                                queryMaintenanceRecord(
                                                              queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                  .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'Submitted')
                                                                  .where(
                                                                      'building',
                                                                      isEqualTo:
                                                                          choiceChipsValue)
                                                                  .orderBy(
                                                                      'created_time',
                                                                      descending:
                                                                          true),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 60,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<MaintenanceRecord>
                                                                  listViewMaintenanceRecordList =
                                                                  snapshot.data;
                                                              if (listViewMaintenanceRecordList
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/undraw_no_data_re_kwbl.png',
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.5,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                );
                                                              }
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewMaintenanceRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewMaintenanceRecord =
                                                                      listViewMaintenanceRecordList[
                                                                          listViewIndex];
                                                                  return InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        PageTransition(
                                                                          type:
                                                                              PageTransitionType.bottomToTop,
                                                                          duration:
                                                                              Duration(milliseconds: 300),
                                                                          reverseDuration:
                                                                              Duration(milliseconds: 300),
                                                                          child:
                                                                              MoreInfoWidget(
                                                                            jobStatus:
                                                                                listViewMaintenanceRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child:
                                                                        Slidable(
                                                                      actionPane:
                                                                          const SlidableScrollActionPane(),
                                                                      secondaryActions: [
                                                                        IconSlideAction(
                                                                          caption:
                                                                              'Complete',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).campusRed,
                                                                          icon:
                                                                              Icons.library_add_check,
                                                                          onTap:
                                                                              () async {
                                                                            final maintenanceUpdateData =
                                                                                createMaintenanceRecordData(
                                                                              status: 'Pending',
                                                                              assigned: currentUserDisplayName,
                                                                            );
                                                                            await listViewMaintenanceRecord.reference.update(maintenanceUpdateData);
                                                                          },
                                                                        ),
                                                                      ],
                                                                      child:
                                                                          ListTile(
                                                                        title:
                                                                            Text(
                                                                          listViewMaintenanceRecord
                                                                              .issue,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title3
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        subtitle:
                                                                            Text(
                                                                          listViewMaintenanceRecord
                                                                              .room,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle2,
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .arrow_forward_ios,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        tileColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        dense:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    12, 16, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Search results',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  MaintenanceRecord>>(
                                                            stream:
                                                                queryMaintenanceRecord(
                                                              queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                  .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'Pending')
                                                                  .where(
                                                                      'building',
                                                                      isEqualTo:
                                                                          choiceChipsValue)
                                                                  .orderBy(
                                                                      'created_time',
                                                                      descending:
                                                                          true),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 60,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<MaintenanceRecord>
                                                                  listViewMaintenanceRecordList =
                                                                  snapshot.data;
                                                              if (listViewMaintenanceRecordList
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/undraw_no_data_re_kwbl.png',
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.5,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                );
                                                              }
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewMaintenanceRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewMaintenanceRecord =
                                                                      listViewMaintenanceRecordList[
                                                                          listViewIndex];
                                                                  return InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        PageTransition(
                                                                          type:
                                                                              PageTransitionType.bottomToTop,
                                                                          duration:
                                                                              Duration(milliseconds: 300),
                                                                          reverseDuration:
                                                                              Duration(milliseconds: 300),
                                                                          child:
                                                                              MoreInfoWidget(
                                                                            jobStatus:
                                                                                listViewMaintenanceRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        listViewMaintenanceRecord
                                                                            .issue,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title3
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        listViewMaintenanceRecord
                                                                            .room,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle2
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      dense:
                                                                          false,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    12, 16, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Search results',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  MaintenanceRecord>>(
                                                            stream:
                                                                queryMaintenanceRecord(
                                                              queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                  .where(
                                                                      'building',
                                                                      isEqualTo:
                                                                          choiceChipsValue)
                                                                  .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'Completed')
                                                                  .orderBy(
                                                                      'created_time',
                                                                      descending:
                                                                          true),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 60,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<MaintenanceRecord>
                                                                  listViewMaintenanceRecordList =
                                                                  snapshot.data;
                                                              if (listViewMaintenanceRecordList
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/undraw_no_data_re_kwbl.png',
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.5,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                );
                                                              }
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewMaintenanceRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewMaintenanceRecord =
                                                                      listViewMaintenanceRecordList[
                                                                          listViewIndex];
                                                                  return InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        PageTransition(
                                                                          type:
                                                                              PageTransitionType.bottomToTop,
                                                                          duration:
                                                                              Duration(milliseconds: 300),
                                                                          reverseDuration:
                                                                              Duration(milliseconds: 300),
                                                                          child:
                                                                              MoreInfoWidget(
                                                                            jobStatus:
                                                                                listViewMaintenanceRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        listViewMaintenanceRecord
                                                                            .issue,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title3
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        listViewMaintenanceRecord
                                                                            .room,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle2,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      dense:
                                                                          false,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
