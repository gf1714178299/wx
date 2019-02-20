import 'package:flutter/material.dart';
import './contacts_page.dart' show Constants,AppColors;
enum ActionItems{
  GROUP_CHAT,ADD_FAMILY,SCAN_IT,RECEIVE_PAYMENT,HELP_AND_FEEDBACK
}
class NavigationIconView{
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key,String title, IconData icon, IconData activeIcon}):
    _title = title,
    _icon = icon,
    _activeIcon = activeIcon,
    item =  BottomNavigationBarItem(
      icon: Icon(icon,color: Color(AppColors.TabIconNormal)),
      activeIcon: Icon(activeIcon,color: Color(AppColors.TabIconActive),),
      title: Text(title,style: TextStyle(
        fontSize: 14.0,
        color: Color(AppColors.TabIconNormal)
      ),),
      backgroundColor: Colors.white
    );

}

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

  void initState(){
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe601,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe656,
          fontFamily: Constants.IconFontFamily,
        )
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe671,
          fontFamily: Constants.IconFontFamily,
        )
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe6c0,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
    ];
  }

  _buildPopupMenuItem(int iconName,String title){
    return Row(
      children: <Widget>[
        Icon(IconData(
            iconName,
            fontFamily:Constants.IconFontFamily,
            ),
            size: 22.0,
            color: Color(AppColors.AppBarPopupMenuColor)
          ),
        Container(width: 12.0),
        Text(title,style: TextStyle(color:const Color(AppColors.AppBarPopupMenuColor)),)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        print('点击的是第$index个tab');
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: new Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(IconData(
              0xe65e,
              fontFamily: Constants.IconFontFamily,
            ), size: 22.0),
            onPressed: () { print('点击搜索'); },
          ),
          Container(width: 16.0),
          //添加列表
          PopupMenuButton(
            itemBuilder: (BuildContext context){
              return  <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe69e, "发起群聊"),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe638, "添加朋友"),
                  value: ActionItems.ADD_FAMILY,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe61b, "扫一扫"),
                  value: ActionItems.SCAN_IT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe62a, "收付款"),
                  value: ActionItems.RECEIVE_PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe63d, "帮助与反馈"),
                  value: ActionItems.HELP_AND_FEEDBACK,
                ),
              ];
            },
            icon: Icon(IconData(
              0xe658,
              fontFamily: Constants.IconFontFamily
            ),size: 22.0),
            onSelected: (ActionItems selected){print('点击的是$selected');},
          ),
          Container(width: 16.0),
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}