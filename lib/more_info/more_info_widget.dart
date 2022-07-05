import '../backend/backend.dart';
import '../chat_page/chat_page_widget.dart';
import '../components/empty_list_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MoreInfoWidget extends StatefulWidget {
  const MoreInfoWidget({
    Key key,
    this.jobStatus,
  }) : super(key: key);

  final MaintenanceRecord jobStatus;

  @override
  _MoreInfoWidgetState createState() => _MoreInfoWidgetState();
}

class _MoreInfoWidgetState extends State<MoreInfoWidget> {
  List<String> choiceChipsValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 54,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
          child: Text(
            widget.jobStatus.displayName,
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        actions: [
          FutureBuilder<List<UsersRecord>>(
            future: queryUsersRecordOnce(
              queryBuilder: (usersRecord) => usersRecord.where('email',
                  isEqualTo: widget.jobStatus.email != ''
                      ? widget.jobStatus.email
                      : null),
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: SpinKitPulse(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 60,
                    ),
                  ),
                );
              }
              List<UsersRecord> rowUsersRecordList = snapshot.data;
              // Return an empty Container when the document does not exist.
              if (snapshot.data.isEmpty) {
                return Container();
              }
              final rowUsersRecord = rowUsersRecordList.isNotEmpty
                  ? rowUsersRecordList.first
                  : null;
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: Icon(
                      FFIcons.kedit,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: ChatPageWidget(
                              chatUser: rowUsersRecord,
                            ),
                          ),
                        );
                      },
                      child: Badge(
                        badgeContent: Text(
                          FFLocalizations.of(context).getText(
                            'm1oke29u' /* 1 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                        ),
                        showBadge: true,
                        shape: BadgeShape.circle,
                        badgeColor: FlutterFlowTheme.of(context).campusRed,
                        elevation: 4,
                        padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                        position: BadgePosition.topEnd(),
                        animationType: BadgeAnimationType.scale,
                        toAnimate: true,
                        child: Icon(
                          FFIcons.kchatboxes,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: FlutterFlowTheme.of(context).primaryText,
                    labelStyle: FlutterFlowTheme.of(context).bodyText1,
                    indicatorColor: FlutterFlowTheme.of(context).primaryText,
                    indicatorWeight: 3,
                    tabs: [
                      Tab(
                        text: FFLocalizations.of(context).getText(
                          'ar2gbe1q' /* Details */,
                        ),
                      ),
                      Tab(
                        text: FFLocalizations.of(context).getText(
                          'w331zevs' /* Comments */,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if ((widget.jobStatus.photoUrl != null) &&
                                  (widget.jobStatus.photoUrl != ''))
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: CachedNetworkImage(
                                            imageUrl: valueOrDefault<String>(
                                              widget.jobStatus.photoUrl,
                                              'https://fmconline.org.uk/wp-content/uploads/2018/01/no-image.jpg',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: valueOrDefault<String>(
                                            widget.jobStatus.photoUrl,
                                            'https://fmconline.org.uk/wp-content/uploads/2018/01/no-image.jpg',
                                          ),
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: valueOrDefault<String>(
                                      widget.jobStatus.photoUrl,
                                      'https://fmconline.org.uk/wp-content/uploads/2018/01/no-image.jpg',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(2),
                                      child: CachedNetworkImage(
                                        imageUrl: valueOrDefault<String>(
                                          widget.jobStatus.photoUrl,
                                          'https://fmconline.org.uk/wp-content/uploads/2018/01/no-image.jpg',
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  elevation: 0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 8, 0, 8),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.jobStatus.issue,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  if ((widget.jobStatus.notes !=
                                                          null) &&
                                                      (widget.jobStatus.notes !=
                                                          ''))
                                                    Text(
                                                      widget.jobStatus.notes,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
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
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 4, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 0.3,
                                          decoration: BoxDecoration(
                                            color: Color(0x81464749),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 8, 0, 8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.jobStatus.building,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  'ROOM ${widget.jobStatus.room}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 0.3,
                                        decoration: BoxDecoration(
                                          color: Color(0x81464749),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '63mvhayu' /* Category */,
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
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 6, 0, 6),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.folder_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6, 0, 0, 0),
                                                        child: Text(
                                                          widget.jobStatus
                                                              .category,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                        Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 0.3,
                                        decoration: BoxDecoration(
                                          color: Color(0x81464749),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mnosb3cz' /* Status */,
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
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 6, 0, 6),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        FFIcons.klock,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6, 0, 0, 0),
                                                        child: Text(
                                                          widget
                                                              .jobStatus.status,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                        Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 0.3,
                                        decoration: BoxDecoration(
                                          color: Color(0x81464749),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6kfw4vzm' /* Assigned */,
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
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 6, 0, 6),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        FFIcons.kworker,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6, 0, 0, 0),
                                                        child: Text(
                                                          widget.jobStatus
                                                              .assigned,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                        Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 0.3,
                                        decoration: BoxDecoration(
                                          color: Color(0x81464749),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 15),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'he7db7lc' /* View Ratings */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 10, 0, 0),
                                                  child: Text(
                                                    '${dateTimeFormat('MMMMEEEEd', widget.jobStatus.createdTime)} at ${dateTimeFormat('jms', widget.jobStatus.createdTime)}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 10, 0, 0),
                                                  child: RatingBarIndicator(
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Icon(
                                                      Icons.star_rounded,
                                                      color: Color(0xFFEFB842),
                                                    ),
                                                    direction: Axis.horizontal,
                                                    rating: widget
                                                        .jobStatus.rating
                                                        .toDouble(),
                                                    unratedColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .campusGrey,
                                                    itemCount: 5,
                                                    itemSize: 25,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 10, 0, 0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '6h5c0r9t' /* Private Feedback */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(18, 20, 18, 0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 20,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12,
                                                                    30, 12, 20),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'b77vsr82' /* What was your most important c... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              20,
                                                                              0,
                                                                              20),
                                                                      child:
                                                                          FlutterFlowChoiceChips(
                                                                        initiallySelected: choiceChipsValues !=
                                                                                null
                                                                            ? choiceChipsValues
                                                                            : [],
                                                                        options: [
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'rez8w2p2' /* Time */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            '9qcsl926' /* Convinience */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            '23lrgihg' /* Cleanliness */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'sr39hfvu' /* Communication */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'j90vq57t' /* Quality */,
                                                                          ))
                                                                        ],
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => choiceChipsValues = val),
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              Color(0xFF141313),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: Color(0xFFF4F4F4),
                                                                              ),
                                                                          iconColor:
                                                                              Colors.white,
                                                                          iconSize:
                                                                              18,
                                                                          elevation:
                                                                              10,
                                                                        ),
                                                                        unselectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              Color(0xFFFFFEFE),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: Color(0xFF0D0909),
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                          iconColor:
                                                                              Color(0xFF323B45),
                                                                          iconSize:
                                                                              18,
                                                                          elevation:
                                                                              10,
                                                                        ),
                                                                        chipSpacing:
                                                                            20,
                                                                        multiselect:
                                                                            true,
                                                                        initialized:
                                                                            choiceChipsValues !=
                                                                                null,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          5,
                                                                          0),
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 0.2,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x81464749),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(18, 20, 18, 30),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'qivzxp4x' /* Your rating is really importan... */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
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
                        EmptyListWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
