import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ozet_haber/constants/images_const.dart';
import 'package:ozet_haber/constants/titles_const.dart';
import 'package:ozet_haber/router/app_router.dart';

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
            title: Text(TitlesConst.homePageTitle),
            onTap: (){
              context.router.pop();
              context.router.replace(HomeRoute());
            },
          )
        ],
      ),);
  }
}