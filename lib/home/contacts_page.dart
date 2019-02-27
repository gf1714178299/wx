import 'package:flutter/material.dart';
import '../model/contacts.dart' show ContactsPageData, Contact;
import '../contacts_page.dart' show Constants, AppColors,AppStyles;
import 'dart:math';

class _ContactItem extends StatelessWidget {
  _ContactItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle,
    this.onPressed,
  });

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  bool get _isAvatarFromNet {
    return this.avatar.startsWith('http') || this.avatar.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    //左边的图标
    Widget _avaratIcon;
    if (_isAvatarFromNet) {
      _avaratIcon = Image.network(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    } else {
      _avaratIcon = Image.asset(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    }
    //列表项主体部分
    Widget _button = Container(
      padding: const EdgeInsets.only(left:16.0 ,right: 16.0, top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: Constants.DividerWidth,
              color: const Color(AppColors.DividerColor)),
        ),
      ),
      child: Row(
        children: <Widget>[_avaratIcon, SizedBox(width: 10.0), Text(title)],
      ),
    );

    //分组标签
    Widget _itemBody;
    if (this.groupTitle != null) {
      _itemBody = Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
            color: const Color(AppColors.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(this.groupTitle, style: AppStyles.GroupTitleItemTextStyle),
          ),
          _button,
        ],
      );
    } else {
      _itemBody = _button;
    }
    return _itemBody;
  }
}

class ContactsPage extends StatefulWidget {
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactsPageData data = ContactsPageData.mock();
  final List<Contact> _constacts = [];
  final List<_ContactItem> _functionButtons = [
    _ContactItem(
      avatar: 'assets/images/ic_new_friend.png',
      title: '新的朋友',
      onPressed: () {
        print('添加新朋友。');
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_group_chat.png',
      title: '群聊',
      onPressed: () {
        print('群聊');
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_tag.png',
      title: '标签',
      onPressed: () {
        print('标签');
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_public_account.png',
      title: '公众号',
      onPressed: () {
        print('公众号');
      },
    ),
  ];

  @override
  void initState() {
    super.initState();
    _constacts
      ..addAll(data.contacts)
      ..addAll(data.contacts)
      ..addAll(data.contacts);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index < _functionButtons.length) {
          return _functionButtons[index];
        }
        int _contactIndex = index - _functionButtons.length;
        Contact _contact = _constacts[index];
        return _ContactItem(
            avatar: _contact.avatar,
            title: _contact.name,
            groupTitle: _contact.nameIndex);
      },
      itemCount: _constacts.length + _functionButtons.length,
    );
  }
}
