import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/view_component_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../more_info/more_info_widget.dart';
import '../report/report_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String? choiceChipsValue;
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
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
              reverseDuration: Duration(milliseconds: 0),
              child: ReportWidget(),
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
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                        child: FlutterFlowChoiceChips(
                          initiallySelected: [
                            FFLocalizations.of(context).getText(
                              'bi8ilzh4' /* 49 Jorissen */,
                            )
                          ],
                          options: [
                            ChipData(FFLocalizations.of(context).getText(
                              'whhs6e39' /* 49 Jorissen */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'm2aya14q' /* 80 Jorissen */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'w66ko3ya' /* Braamlofts */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              '4nw3mbzz' /* Dunvista */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'sjw248l8' /* 126 Siemert */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'k69s2u9x' /* Wynton Joy */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'oufn4av2' /* Rennie House */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'e1mtxgnq' /* YMCA */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'asufi84p' /* 277 Bree Street */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              '5f4jqyoh' /* 279 Bree Street */,
                            ))
                          ],
                          onChanged: (val) =>
                              setState(() => choiceChipsValue = val?.first),
                          selectedChipStyle: ChipStyle(
                            backgroundColor: Color(0xFF040404),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                            iconColor: Colors.white,
                            iconSize: 0,
                            labelPadding:
                                EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                            elevation: 4,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: Colors.white,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF262D34),
                                    ),
                            iconColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            iconSize: 18,
                            labelPadding:
                                EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                            elevation: 4,
                          ),
                          chipSpacing: 12,
                          rowSpacing: 6,
                          multiselect: false,
                          initialized: choiceChipsValue != null,
                          alignment: WrapAlignment.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            elevation: 0,
          )
        ],
        body: Builder(
          builder: (context) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (valueOrDefault(currentUserDocument?.role, '') ==
                                'Admin')
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      1, 0, 0, 0),
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
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'dqbmn08s' /* Submitted */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0q7rrff7' /* Pending */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '82351dvu' /* Completed */,
                                                ),
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 8, 16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '6kd5l1dm' /* Search results */,
                                                            ),
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
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: StreamBuilder<
                                                            List<
                                                                MaintenanceRecord>>(
                                                          stream:
                                                              queryMaintenanceRecord(
                                                            queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                .where('status',
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
                                                                child: Center(
                                                                  child:
                                                                      ViewComponentWidget(),
                                                                ),
                                                              );
                                                            }
                                                            List<MaintenanceRecord>
                                                                listViewMaintenanceRecordList =
                                                                snapshot.data!;
                                                            if (listViewMaintenanceRecordList
                                                                .isEmpty) {
                                                              return Center(
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/undraw_no_data_re_kwbl.png',
                                                                  width: MediaQuery.of(
                                                                              context)
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
                                                              itemBuilder: (context,
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
                                                                        type: PageTransitionType
                                                                            .bottomToTop,
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
                                                                            FFLocalizations.of(context).getText(
                                                                          'ocojyy0t' /* Complete */,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .campusRed,
                                                                        icon: Icons
                                                                            .library_add_check,
                                                                        onTap:
                                                                            () async {
                                                                          final maintenanceUpdateData =
                                                                              createMaintenanceRecordData(
                                                                            status:
                                                                                'Pending',
                                                                            assigned:
                                                                                currentUserDisplayName,
                                                                            myStatus:
                                                                                createStatusStruct(
                                                                              fieldValues: {
                                                                                'pending': FieldValue.increment(1),
                                                                              },
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                          );
                                                                          await listViewMaintenanceRecord
                                                                              .reference
                                                                              .update(maintenanceUpdateData);
                                                                        },
                                                                      ),
                                                                    ],
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        listViewMaintenanceRecord
                                                                            .issue!,
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
                                                                            .room!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle2,
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_forward_ios,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'e35hx1xk' /* Search results */,
                                                            ),
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
                                                                .fromSTEB(
                                                                    0, 8, 0, 0),
                                                        child: StreamBuilder<
                                                            List<
                                                                MaintenanceRecord>>(
                                                          stream:
                                                              queryMaintenanceRecord(
                                                            queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                .where('status',
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
                                                                    ViewComponentWidget(),
                                                              );
                                                            }
                                                            List<MaintenanceRecord>
                                                                listViewMaintenanceRecordList =
                                                                snapshot.data!;
                                                            if (listViewMaintenanceRecordList
                                                                .isEmpty) {
                                                              return Center(
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/undraw_no_data_re_kwbl.png',
                                                                  width: MediaQuery.of(
                                                                              context)
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
                                                              itemBuilder: (context,
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
                                                                        type: PageTransitionType
                                                                            .bottomToTop,
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
                                                                    title: Text(
                                                                      listViewMaintenanceRecord
                                                                          .issue!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title3
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      listViewMaintenanceRecord
                                                                          .room!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                    ),
                                                                    tileColor: FlutterFlowTheme.of(
                                                                            context)
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
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 0, 0),
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
                                                                .where('status',
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
                                                                    ViewComponentWidget(),
                                                              );
                                                            }
                                                            List<MaintenanceRecord>
                                                                listViewMaintenanceRecordList =
                                                                snapshot.data!;
                                                            if (listViewMaintenanceRecordList
                                                                .isEmpty) {
                                                              return Center(
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/undraw_no_data_re_kwbl.png',
                                                                  width: MediaQuery.of(
                                                                              context)
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
                                                              itemBuilder: (context,
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
                                                                        type: PageTransitionType
                                                                            .bottomToTop,
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
                                                                    title: Text(
                                                                      listViewMaintenanceRecord
                                                                          .issue!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title3
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      listViewMaintenanceRecord
                                                                          .room!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2,
                                                                    ),
                                                                    tileColor: FlutterFlowTheme.of(
                                                                            context)
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
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
