import 'package:flutter/material.dart';
class AppColors{
  static const AppBarColor = 0xff303030;
  static const TabIconActive = 0xff46c11b;
  static const TabIconNormal = 0xff999999;
  static const AppBarPopupMenuColor = 0xffffffff;
  static const ConversationItemBg = 0xffffffff;
  static const TitleTextColor = 0xff353535;
  static const DesTextColor = 0xff9e9e9e;
  static const DividerColor = 0xff9d9d9d;
  static const NotifyDotBg = 0xffff3e3e;
  static const NotifyDotText = 0xffffffff;
  static const ConversationMuteIcon = 0xffd8d8d8;
  static const DeviceInfoItemBg = 0xfff5f5f5;
  static const DeviceInfoItemText = 0xff606062;
  static const DeviceInfoItemIcon = 0xff606062;
  static const ContactGroupTitleBg = 0xffebebeb;
  static const ContactGroupTitleText = 0xff888888;
  
}

class AppStyles {
  static const TitleStyle = TextStyle(
    fontSize:14.0,
    color: Color(AppColors.TitleTextColor),
  );
  static const DesStyle = TextStyle(
    fontSize:12.0,
    color: Color(AppColors.DesTextColor),
  );
  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize:12.0,
    color: Color(AppColors.NotifyDotText),
  );
  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize:13.0,
    color: Color(AppColors.DeviceInfoItemText),
  );
  static const GroupTitleItemTextStyle = TextStyle(
    fontSize:14.0,
    color: Color(AppColors.ContactGroupTitleText),
  );

}

class Constants{
  static const IconFontFamily = "appIconFont";
  static const ConversationAvatarSize = 48.0;
  static const DividerWidth = 1.0;
  static const UnreadMsgNotifyDotSize = 20.0;
  static const ConversationMuteIconSize = 18.0;
  static const ContactAvatarSize = 36.0;

}