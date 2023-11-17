import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/core/links.dart';

class AgoraController extends GetxController {
  String channelName = "flutterTest";
  String name = Get.arguments['name'];
  ClientRole clientRole = Get.arguments['role'];
  List users = <int>[];
  List infoString = <String>[];
  bool muted = false;
  bool viewPanel = false;
  late RtcEngine engine;

  initialize() async {
    if (appId.isEmpty) {
      update();
      infoString.add("please add appId");
      infoString.add("engine doesn't work");
    }
    engine = await RtcEngine.create(appId);
    await engine.enableVideo();
    await engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await engine.setClientRole(clientRole);
    addAgoraHandlers();
    VideoEncoderConfiguration configure = VideoEncoderConfiguration();
    configure.dimensions = VideoDimensions(width: 1920, height: 1080);
    await engine.setVideoEncoderConfiguration(configure);
    await engine.joinChannel(token, channelName, null, 0);
  }

  addAgoraHandlers() {
    engine.setEventHandler(RtcEngineEventHandler(
      error: (code) {
        String error = "error $code";
        infoString.add(error);
        update();
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        final info = "Join channel : $channel , uid : $uid";
        infoString.add(info);
        update();
      },
      leaveChannel: (stats) {
        infoString.add("Some one leave");
        users.clear();
      },
      userJoined: (uid, elapsed) {
        final info = "user : $uid joined";
        infoString.add(info);
        users.add(uid);
      },
      userOffline: (uid, reason) {
        final info = "User $uid Offline";
        infoString.add(info);
        users.remove(uid);
        update();
      },
      firstRemoteVideoFrame: (uid, width, height, elapsed) {
        final info = "First Remote video $uid ${width} x ${height}";
        infoString.add(info);
        update();
      },
    ));
  }

  muteVoice() {
    muted = !muted;
    engine.muteLocalAudioStream(muted);
    update();
  }

  enablePanel() {
    viewPanel = !viewPanel;
    update();
  }

  @override
  void dispose() {
    users.clear();
    engine.leaveChannel();
    engine.destroy();
    super.dispose();
  }

  @override
  void onInit() {
    initialize();
    super.onInit();
  }
}
