import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ozet_haber/constants/images_const.dart';
import 'package:ozet_haber/constants/titles_const.dart';
import 'package:ozet_haber/router/app_router.dart';
import 'package:ozet_haber/widgets/text/medium_text.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(child: 
      ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: 
            Container(decoration: 
              BoxDecoration(image: 
                DecorationImage(image: 
                  AssetImage(ImagesConst.appIconPng)
                )
              ),
            )
          ),
    
          ListTile(
            leading: const Icon(Icons.home),
            title: MediumText(TitlesConst.homeViewTitle),
            onTap: (){
              context.router.pop();
              context.router.replace(HomeRoute());
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: MediumText(TitlesConst.settingsViewTitle),
            onTap: (){
              context.router.pop();
              context.router.replace(SettingsRoute());
            },
          )
        ],
      ),);
  }
}