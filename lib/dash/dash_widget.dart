import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DashWidget extends StatefulWidget {
  const DashWidget({Key? key}) : super(key: key);

  @override
  _DashWidgetState createState() => _DashWidgetState();
}

class _DashWidgetState extends State<DashWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MetricsRecord>>(
      stream: queryMetricsRecord(
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
        List<MetricsRecord> dashMetricsRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final dashMetricsRecord = dashMetricsRecordList.isNotEmpty
            ? dashMetricsRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'wdf199rk' /* Dashboard */,
              ),
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(18, 30, 18, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientText(
                            FFLocalizations.of(context).getText(
                              'a59v8wcu' /* Maintenance Reports */,
                            ),
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 30,
                                ),
                            colors: [
                              Color(0xFF3A24AA),
                              FlutterFlowTheme.of(context).campusRed
                            ],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Stack(
                            children: [
                              FlutterFlowPieChart(
                                data: FFPieChartData(
                                  values: [
                                    dashMetricsRecord!.myStatus.submitted!,
                                    dashMetricsRecord!.myStatus.pending!,
                                    dashMetricsRecord!.myStatus.completed!
                                  ],
                                  colors: [
                                    Color(0xFFCA370F),
                                    Color(0xFFEBAC04),
                                    Color(0xFF088200)
                                  ],
                                  radius: [100, 90, 100],
                                  borderWidth: [0, 0, 2],
                                  borderColor: [
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.white
                                  ],
                                ),
                                donutHoleRadius: 40,
                                donutHoleColor: Colors.white,
                                sectionLabelType:
                                    PieChartSectionLabelType.percent,
                                sectionLabelStyle: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFFFFDFD),
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0.75),
                                child: FlutterFlowChartLegendWidget(
                                  entries: [
                                    LegendEntry(
                                        Color(0xFFCA370F),
                                        FFLocalizations.of(context).getText(
                                          'm84kzjek' /* Submitted */,
                                        )),
                                    LegendEntry(
                                        Color(0xFFEBAC04),
                                        FFLocalizations.of(context).getText(
                                          'sztpydtz' /* Pending */,
                                        )),
                                    LegendEntry(
                                        Color(0xFF088200),
                                        FFLocalizations.of(context).getText(
                                          '3g9hs7ex' /* Completed */,
                                        )),
                                  ],
                                  width: 150,
                                  height: 60,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: Color(0xFFFFFFFE),
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textPadding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25, 40, 5, 0),
                                  borderWidth: 0,
                                  borderColor: Colors.transparent,
                                  indicatorSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFE),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: GradientText(
                                  FFLocalizations.of(context).getText(
                                    '78nv1r2b' /* daily */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  colors: [
                                    Color(0xFF3A24AA),
                                    FlutterFlowTheme.of(context).secondaryColor
                                  ],
                                  gradientDirection: GradientDirection.ltr,
                                  gradientType: GradientType.linear,
                                ),
                              ),
                            ),
                            Container(
                              width: 65,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFE),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: GradientText(
                                  FFLocalizations.of(context).getText(
                                    's833j868' /* Weekly */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  colors: [
                                    Color(0xFF3A24AA),
                                    FlutterFlowTheme.of(context).secondaryColor
                                  ],
                                  gradientDirection: GradientDirection.ltr,
                                  gradientType: GradientType.linear,
                                ),
                              ),
                            ),
                            Container(
                              width: 65,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFE),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: GradientText(
                                  FFLocalizations.of(context).getText(
                                    'qkby8cz5' /* Monthly */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  colors: [
                                    Color(0xFF3A24AA),
                                    FlutterFlowTheme.of(context).secondaryColor
                                  ],
                                  gradientDirection: GradientDirection.ltr,
                                  gradientType: GradientType.linear,
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFE),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: GradientText(
                                  FFLocalizations.of(context).getText(
                                    'lj4pmw3f' /* Yeraly */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  colors: [
                                    Color(0xFF3A24AA),
                                    FlutterFlowTheme.of(context).secondaryColor
                                  ],
                                  gradientDirection: GradientDirection.ltr,
                                  gradientType: GradientType.linear,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: 400,
                        height: 200,
                        child: FlutterFlowBarChart(
                          barData: [
                            FFBarChartData(
                              yData: List.generate(
                                  random_data.randomInteger(10, 10),
                                  (index) => random_data.randomInteger(1, 10)),
                              color: Color(0xFF088200),
                            ),
                            FFBarChartData(
                              yData: List.generate(
                                  random_data.randomInteger(10, 10),
                                  (index) => random_data.randomInteger(1, 10)),
                              color: Color(0xFFCA370F),
                            )
                          ],
                          xLabels: List.generate(
                              random_data.randomInteger(0, 0),
                              (index) => random_data.randomString(
                                    0,
                                    0,
                                    false,
                                    false,
                                    false,
                                  )),
                          barWidth: 20,
                          barBorderRadius: BorderRadius.circular(25),
                          barSpace: 10,
                          groupSpace: 5,
                          chartStylingInfo: ChartStylingInfo(
                            enableTooltip: true,
                            backgroundColor: Color(0x006757F1),
                            showGrid: true,
                            showBorder: false,
                          ),
                          axisBounds: AxisBounds(),
                          xAxisLabelInfo: AxisLabelInfo(
                            title: FFLocalizations.of(context).getText(
                              'querhto9' /* Buildings */,
                            ),
                            titleTextStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          yAxisLabelInfo: AxisLabelInfo(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
