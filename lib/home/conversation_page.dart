import 'package:flutter/material.dart';
import '../contacts_page.dart' show AppColors, AppStyles, Constants;
import '../model/conversation.dart' show Conversation, mockConversations,Device;



class _ConversationItem extends StatelessWidget {
  const _ConversationItem({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    // 根据图片的获取方式初始化头像组件
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      avatar = Image.network(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    } else {
      avatar = Image.asset(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    }

    Widget avatarContainer;
    if (conversation.unreadMsgCount > 0) {
      //未读消息角标
      Widget unreadMsgCountText = Container(
        width: Constants.UnreadMsgNotifyDotSize,
        height: Constants.UnreadMsgNotifyDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(Constants.UnreadMsgNotifyDotSize / 2.0),
          color: Color(AppColors.NotifyDotBg),
        ),
        child: Text(conversation.unreadMsgCount.toString(),
            style: AppStyles.UnreadMsgCountDotStyle),
      );

      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            right: -6.0,
            top: -6.0,
            child: unreadMsgCountText,
          ),
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    //勿扰模式图标
    var _rightArea = <Widget>[
      Text(conversation.updateAt, style: AppStyles.DesStyle),
      SizedBox(height: 10.0)
    ];

    if (conversation.isMute) {
      _rightArea.add(Icon(
          IconData(
            0xe755,
            fontFamily: Constants.IconFontFamily,
          ),
          color: Color(AppColors.ConversationMuteIcon),
          size: Constants.ConversationMuteIconSize));
    } else {
      _rightArea.add(Icon(
          IconData(
            0xe755,
            fontFamily: Constants.IconFontFamily,
          ),
          color: Colors.transparent,
          size: Constants.ConversationMuteIconSize));
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(AppColors.ConversationItemBg),
        border: Border(
          bottom: BorderSide(
              color: Color(AppColors.DividerColor),
              width: Constants.DividerWidth),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Container(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(conversation.title, style: AppStyles.TitleStyle),
                Text(conversation.des, style: AppStyles.DesStyle),
              ],
            ),
          ),
          Column(
            children: _rightArea,
          ),
        ],
      ),
    );
  }
}

class _DeviceInfoItem extends StatelessWidget {
  final Device device;
  const _DeviceInfoItem({this.device:Device.WIN}) : assert(device != null);

  int get iconName{
    return device ==Device.WIN ? 0x375e : 0xe640;
  }

  String get deviceName{
     return device ==Device.WIN ? 'Windows':'Mac';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 24.0, top: 10.0, right: 24.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                width: Constants.DividerWidth,
                color: Color(AppColors.DividerColor))),
        color: Color(AppColors.DeviceInfoItemBg),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(IconData(this.iconName, fontFamily: Constants.IconFontFamily),
              size: 24.0,color: Color(AppColors.DeviceInfoItemIcon)),
          SizedBox(width: 16.0),
          Text('$deviceName 微信已登录，手机通知已关闭。', style: AppStyles.DeviceInfoItemTextStyle),
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _DeviceInfoItem(device:Device.MAC);
        }
        return _ConversationItem(conversation: mockConversations[index]);
      },
      itemCount: mockConversations.length,
    );
  }
}
