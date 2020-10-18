import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/core/constant/app_icon.dart';
import 'package:provider_start/core/constant/theme.dart';
import 'package:provider_start/ui/views/drawer/sidebar_view_model.dart';
import 'package:provider_start/ui/widgets/stateless/custom_widget.dart';
import 'package:stacked/stacked.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({Key key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _SidebarMenuState createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  void _logOut() {
    // todo
  }

  ListTile _menuListRowButton(String title,
      {Function onPressed, int icon, bool isEnable = false}) {
    return ListTile(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      leading: icon == null
          ? null
          : Padding(
              padding: EdgeInsets.only(top: 5),
              child: CustomIcon(
                icon: icon,
                size: 25,
                color: isEnable ? AppColor.darkGrey : AppColor.lightGrey,
              ),
            ),
      title: CustomText(
        title: title,
        style: TextStyle(
          fontSize: 20,
          color: isEnable ? AppColor.secondary : AppColor.lightGrey,
        ),
      ),
    );
  }

  Positioned _footer() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        children: <Widget>[
          Divider(height: 0),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
                height: 45,
              ),
              CustomIcon(
                  icon: AppIcon.bulbOn,
                  size: 25,
                  color: TwitterColor.dodgetBlue),
              Spacer(),
              Image.asset(
                'assets/images/qr.png',
                height: 25,
              ),
              SizedBox(
                width: 10,
                height: 45,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SideBarViewModel>.reactive(
      viewModelBuilder: () => SideBarViewModel(),
      builder: (context, model, child) => Drawer(
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 45),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Container(
                      child: _MenuHeader(),
                    ),
                    Divider(),
                    _menuListRowButton('个人资料',
                        icon: AppIcon.profile, isEnable: true, onPressed: () {
                      //_navigateTo('ProfilePage');
                    }),
                    _menuListRowButton('列表', icon: AppIcon.lists),
                    _menuListRowButton('书签', icon: AppIcon.bookmark),
                    _menuListRowButton('瞬间', icon: AppIcon.moments),
                    Divider(),
                    _menuListRowButton('设置和隐私', isEnable: true, onPressed: () {
                      //_navigateTo('SettingsAndPrivacyPage');
                    }),
                    _menuListRowButton('帮助中心'),
                    Divider(),
                    _menuListRowButton('退出登录',
                        icon: null, onPressed: _logOut, isEnable: true),
                  ],
                ),
              ),
              _footer()
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuHeader extends ViewModelWidget<SideBarViewModel> {
  Widget _tappbleText(BuildContext context, int count, String text) {
    return InkWell(
      onTap: () {
        // var authstate = Provider.of<AuthState>(context,listen: false);
        // authstate.profileFollowingList = [];
        // authstate.getProfileUser();
        // _navigateTo(navigateTo);
      },
      child: Row(
        children: <Widget>[
          CustomText(
            title: '$count ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          CustomText(
            title: '$text',
            style: TextStyle(color: AppColor.darkGrey, fontSize: 17),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, SideBarViewModel model) {
    if (!model.isLogged) {
      return CustomInkWell(
        splashColor: Theme.of(context).primaryColorLight,
        onPressed: () {
          //  Navigator.of(context).pushNamed('/signIn');
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 200, minHeight: 100),
          child: Center(
            child: Text(
              'Login to continue',
              style: onPrimaryTitleText,
            ),
          ),
        ),
      );
    }

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setHeight(100),
            margin: EdgeInsets.only(
                left: ScreenUtil().setHeight(28),
                top: ScreenUtil().setHeight(20)),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white, width: ScreenUtil().setWidth(2)),
              borderRadius: BorderRadius.circular(28),
              image: DecorationImage(
                image: customAdvanceNetworkImage(
                  model.currentUser.avatar,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              //_navigateTo("ProfilePage");
            },
            title: Row(
              children: <Widget>[
                UrlText(
                  text: model.currentUser.email ?? 'none',
                  style: onPrimaryTitleText.copyWith(
                      color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  width: 3,
                ),
                CustomIcon(
                    icon: AppIcon.blueTick,
                    isTwitterIcon: true,
                    color: AppColor.primary,
                    size: ScreenUtil().setHeight(38),
                    paddingIcon: 3)
                /*
                  state.userModel.isVerified ?? false
                      ? CustomIcon(
                          icon: AppIcon.blueTick,
                          isTwitterIcon: true,
                          color: AppColor.primary,
                          size: 18,
                          paddingIcon: 3)
                      : SizedBox(
                          width: 0,
                        ),
                  */
              ],
            ),
            subtitle: CustomText(
              title: model.currentUser.name ?? '旧伯伯',
              style: onPrimarySubTitleText.copyWith(
                  color: Colors.black54, fontSize: 15),
            ),
            // trailing: CustomIcon(
            //     icon: AppIcon.arrowDown,
            //     color: AppColor.primary),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 17,
                ),
                _tappbleText(context, model.currentUser.follwers ?? 0, ' 关注者'),
                SizedBox(width: 10),
                _tappbleText(context, model.currentUser.follwing ?? 0, ' 正在关注'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
