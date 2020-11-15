import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_start/core/constant/app_icon.dart';
import 'package:provider_start/core/constant/theme.dart';
import 'package:provider_start/core/utils/utility.dart';
import 'package:provider_start/ui/widgets/stateless/custom_widget.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:provider_start/ui/widgets/stateless/ripple_button.dart';
import 'package:provider_start/ui/widgets/stateless/title_text.dart';
import 'package:stacked/stacked.dart';

import 'chat_list_view_model.dart';

class ChatListView extends StatefulWidget {
  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatListViewModel>.reactive(
      viewModelBuilder: () => ChatListViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: customTitleText('chat_list'),
          cupertino: (_, __) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
        ),
        body: model.isBusy
            ? _LoadingAnimation()
            : model.contacts.users.isNotEmpty
                ? _ChatListBody()
                : _NoChatList(),
      ),
    );
  }
}

class _ChatListBody extends ViewModelWidget<ChatListViewModel> {
  Widget _userCard(ChatListViewModel model, int index) {
    return Container(
      color: Colors.white,
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          onTap: model.pushChatScreen,
          leading: RippleButton(
            onPressed: () => {},
            borderRadius: BorderRadius.circular(28),
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(28),
                image: DecorationImage(
                    image: customAdvanceNetworkImage(
                      model.contacts.users[index].avatar ?? dummyProfilePic,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          title: TitleText(
            model.contacts.users[index].nickname ?? 'NA',
            fontSize: 16,
            fontWeight: FontWeight.w800,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: CustomText(
            title: model.contacts.users[index].nickname,
            style: onPrimarySubTitleText.copyWith(color: Colors.black54),
          ),
          trailing: Text(
            getChatTime('2020-10-27 20:05:09').toString(),
          )),
    );
  }

  @override
  Widget build(BuildContext context, ChatListViewModel model) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: model.contacts.users.length,
      itemBuilder: (context, index) => _userCard(model, index),
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
        );
      },
    );
  }
}

class _NoChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('no chat list'),
    );
  }
}

class _LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimation(),
    );
  }
}
