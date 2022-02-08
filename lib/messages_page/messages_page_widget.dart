import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../chat_page/chat_page_widget.dart';
import '../components/empty_list_widget.dart';
import '../create_group/create_group_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesPageWidget extends StatefulWidget {
  const MessagesPageWidget({Key key}) : super(key: key);

  @override
  _MessagesPageWidgetState createState() => _MessagesPageWidgetState();
}

class _MessagesPageWidgetState extends State<MessagesPageWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: ToggleIcon(
          onPressed: () async {
            setState(() => FFAppState().isPressed = !FFAppState().isPressed);
          },
          value: FFAppState().isPressed,
          onIcon: Icon(
            Icons.search_sharp,
            color: Colors.black,
            size: 25,
          ),
          offIcon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Stack(
          children: [
            if (!(FFAppState().isPressed) ?? true)
              TextFormField(
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Search',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.bodyText1,
                keyboardType: TextInputType.name,
              ),
            if (FFAppState().isPressed ?? true)
              Text(
                'Inbox',
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                ),
              ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 18, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: CreateGroupWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.group_add,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: StreamBuilder<List<ChatsRecord>>(
              stream: queryChatsRecord(
                queryBuilder: (chatsRecord) => chatsRecord
                    .where('users', arrayContains: currentUserReference)
                    .orderBy('last_message_time', descending: true),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: SpinKitPulse(
                        color: FlutterFlowTheme.primaryColor,
                        size: 60,
                      ),
                    ),
                  );
                }
                List<ChatsRecord> listViewChatsRecordList = snapshot.data;
                if (listViewChatsRecordList.isEmpty) {
                  return EmptyListWidget();
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewChatsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewChatsRecord =
                        listViewChatsRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                      child: StreamBuilder<FFChatInfo>(
                        stream: FFChatManager.instance
                            .getChatInfo(chatRecord: listViewChatsRecord),
                        builder: (context, snapshot) {
                          final chatInfo =
                              snapshot.data ?? FFChatInfo(listViewChatsRecord);
                          return FFChatPreview(
                            onTap: chatInfo != null
                                ? () => Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: ChatPageWidget(
                                          chatUser:
                                              chatInfo.otherUsers.length == 1
                                                  ? chatInfo
                                                      .otherUsersList.first
                                                  : null,
                                          chatRef:
                                              chatInfo.chatRecord.reference,
                                        ),
                                      ),
                                    )
                                : null,
                            lastChatText: chatInfo.chatPreviewMessage(),
                            lastChatTime: listViewChatsRecord.lastMessageTime,
                            seen: listViewChatsRecord.lastMessageSeenBy
                                .contains(currentUserReference),
                            title: chatInfo.chatPreviewTitle(),
                            userProfilePic: chatInfo.chatPreviewPic(),
                            color: FlutterFlowTheme.tertiaryColor,
                            unreadColor: Color(0xFF1785BF),
                            titleTextStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            dateTextStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: Color(0x73000000),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                            previewTextStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: Color(0x73000000),
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                            borderRadius: BorderRadius.circular(0),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}