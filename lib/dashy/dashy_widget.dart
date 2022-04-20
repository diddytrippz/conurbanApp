import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DashyWidget extends StatefulWidget {
  const DashyWidget({
    Key key,
    this.listOf,
  }) : super(key: key);

  final MaintenanceRecord listOf;

  @override
  _DashyWidgetState createState() => _DashyWidgetState();
}

class _DashyWidgetState extends State<DashyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: custom_widgets.PieChartSample1(
                      width: MediaQuery.of(context).size.width,
                      height: 280,
                      backgroundColor: Colors.transparent,
                      title1: 'Closed',
                      title1Color: Color(0xFF3A8551),
                      title2: 'In Review',
                      title2Color: Color(0xFFEFB842),
                      title3: 'Open',
                      title3Color: Color(0xFFB82925),
                      title4: 'Unknown',
                      title4Color: Color(0xFF040404),
                      value1: 299.0,
                      value2: 46.0,
                      value3: 132.0,
                      value4: 0.0,
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
