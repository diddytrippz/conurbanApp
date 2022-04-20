import '../backend/backend.dart';
import '../components/empty_inbox_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    Key key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord chatUser;
  final DocumentReference chatRef;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  FFChatInfo _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 50,
              icon: Icon(
                FFIcons.kback,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        title: Text(
          widget.chatUser.displayName,
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: FlutterFlowExpandedImageView(
                      image: Image.network(
                        valueOrDefault<String>(
                          widget.chatUser.photoUrl,
                          'https://www.pngitem.com/pimgs/m/348-3483562_fox-icon-png-transparent-png.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                      allowRotation: false,
                      tag: valueOrDefault<String>(
                        widget.chatUser.photoUrl,
                        'https://www.pngitem.com/pimgs/m/348-3483562_fox-icon-png-transparent-png.png',
                      ),
                      useHeroAnimation: true,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: valueOrDefault<String>(
                  widget.chatUser.photoUrl,
                  'https://www.pngitem.com/pimgs/m/348-3483562_fox-icon-png-transparent-png.png',
                ),
                transitionOnUserGestures: true,
                child: Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.chatUser.photoUrl,
                      'https://www.pngitem.com/pimgs/m/348-3483562_fox-icon-png-transparent-png.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: StreamBuilder<FFChatInfo>(
          stream: FFChatManager.instance.getChatInfo(
            otherUserRecord: widget.chatUser,
            chatReference: widget.chatRef,
          ),
          builder: (context, snapshot) => snapshot.hasData
              ? FFChatPage(
                  chatInfo: snapshot.data,
                  allowImages: true,
                  backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                  timeDisplaySetting: TimeDisplaySetting.alwaysVisible,
                  currentUserBoxDecoration: BoxDecoration(
                    color: Color(0xFF1785BF),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  otherUsersBoxDecoration: BoxDecoration(
                    color: Color(0xFFF6F4F4),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  currentUserTextStyle: GoogleFonts.getFont(
                    'Roboto',
                    color: Color(0xFFF7F7F7),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                  ),
                  otherUsersTextStyle: GoogleFonts.getFont(
                    'Roboto',
                    color: Color(0x8C000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  inputHintTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Color(0xFF95A1AC),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  inputTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  emptyChatWidget: Center(
                    child: EmptyInboxWidget(),
                  ),
                )
              : Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: SpinKitPulse(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 60,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
