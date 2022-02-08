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
      backgroundColor: FlutterFlowTheme.tertiaryColor,
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
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.edit_outlined,
          color: FlutterFlowTheme.tertiaryColor,
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
                  color: FlutterFlowTheme.tertiaryColor,
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
                            color: FlutterFlowTheme.tertiaryColor,
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
                                      color: FlutterFlowTheme.tertiaryColor,
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
                                                        FlutterFlowTheme
                                                            .campusRed,
                                                    backgroundColor:
                                                        Color(0xFFF1F4F8),
                                                    center: Text(
                                                      'Tasks ',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Roboto',
                                                        color: FlutterFlowTheme
                                                            .primaryColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    startAngle: 360),
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
                                                        style: FlutterFlowTheme
                                                            .title1
                                                            .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              FlutterFlowTheme
                                                                  .campusGrey,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                    style: FlutterFlowTheme
                                                        .subtitle1
                                                        .override(
                                                      fontFamily: 'Roboto',
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
                                                    style: FlutterFlowTheme
                                                        .subtitle1
                                                        .override(
                                                      fontFamily: 'Roboto',
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
                                        12, 10, 4, 0),
                                    child: Wrap(
                                      spacing: 0,
                                      runSpacing: 0,
                                      alignment: WrapAlignment.spaceAround,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.up,
                                      clipBehavior: Clip.none,
                                      children: [
                                        FlutterFlowChoiceChips(
                                          initialOption: choiceChipsValue ??=
                                              '49 Jorissen',
                                          options: [
                                            ChipData('49 Jorissen'),
                                            ChipData('80 Jorissen'),
                                            ChipData('Braamlofts'),
                                            ChipData('Dunvista'),
                                            ChipData('126 Siemert'),
                                            ChipData('Wynton Joy'),
                                            ChipData('Rennie House')
                                          ],
                                          onChanged: (val) => setState(
                                              () => choiceChipsValue = val),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor: Color(0xFF262D34),
                                            textStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Roboto',
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
                                            textStyle: FlutterFlowTheme
                                                .bodyText2
                                                .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF262D34),
                                            ),
                                            iconColor: Color(0xFF262D34),
                                            iconSize: 18,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 4, 10, 4),
                                            elevation: 4,
                                          ),
                                          chipSpacing: 18,
                                        ),
                                      ],
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
                                                  FlutterFlowTheme.primaryColor,
                                              unselectedLabelColor:
                                                  Color(0xFF6E6E6E),
                                              labelStyle:
                                                  FlutterFlowTheme.bodyText1,
                                              indicatorColor: FlutterFlowTheme
                                                  .secondaryColor,
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
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .bodyText2,
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
                                                                  .where(
                                                                      'isDone',
                                                                      isEqualTo:
                                                                          false)
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
                                                                      color: FlutterFlowTheme
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
                                                                              FlutterFlowTheme.campusRed,
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
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Status has been changed successfully',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.tertiaryColor,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: FlutterFlowTheme.campusGrey,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                      child:
                                                                          ListTile(
                                                                        title:
                                                                            Text(
                                                                          listViewMaintenanceRecord
                                                                              .issue,
                                                                          style: FlutterFlowTheme
                                                                              .title3
                                                                              .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                        ),
                                                                        subtitle:
                                                                            Text(
                                                                          listViewMaintenanceRecord
                                                                              .room,
                                                                          style:
                                                                              FlutterFlowTheme.subtitle2,
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .arrow_forward_ios,
                                                                          color:
                                                                              Color(0xFF303030),
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        tileColor:
                                                                            Color(0xFFF5F5F5),
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
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .bodyText2,
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
                                                                  .where(
                                                                      'isDone',
                                                                      isEqualTo:
                                                                          false)
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
                                                                      color: FlutterFlowTheme
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
                                                                        style: FlutterFlowTheme
                                                                            .title3
                                                                            .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        listViewMaintenanceRecord
                                                                            .room,
                                                                        style: FlutterFlowTheme
                                                                            .subtitle2,
                                                                      ),
                                                                      tileColor:
                                                                          Color(
                                                                              0xFFF5F5F5),
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
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .bodyText2,
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
                                                                      'isDone',
                                                                      isEqualTo:
                                                                          true)
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
                                                                      color: FlutterFlowTheme
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
                                                                  return Slidable(
                                                                    actionPane:
                                                                        const SlidableScrollActionPane(),
                                                                    secondaryActions: [
                                                                      IconSlideAction(
                                                                        caption:
                                                                            'Close',
                                                                        color: FlutterFlowTheme
                                                                            .primaryColor,
                                                                        icon: Icons
                                                                            .auto_awesome_motion,
                                                                        onTap:
                                                                            () async {
                                                                          if ((currentUserEmail) ==
                                                                              'frans@conurban.co.za') {
                                                                            final maintenanceUpdateData =
                                                                                createMaintenanceRecordData(
                                                                              status: 'Closed',
                                                                            );
                                                                            await listViewMaintenanceRecord.reference.update(maintenanceUpdateData);
                                                                          }
                                                                        },
                                                                      ),
                                                                    ],
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        listViewMaintenanceRecord
                                                                            .issue,
                                                                        style: FlutterFlowTheme
                                                                            .title3
                                                                            .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        listViewMaintenanceRecord
                                                                            .room,
                                                                        style: FlutterFlowTheme
                                                                            .subtitle2,
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_forward_ios,
                                                                        color: Color(
                                                                            0xFF303030),
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      tileColor:
                                                                          Color(
                                                                              0xFFF5F5F5),
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
