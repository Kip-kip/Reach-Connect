import 'dart:math';

import 'package:bridgme/models/article/article_category_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../models/appointment/health_category.dart';




class HealthConcernItem extends StatelessWidget {
  final ArticleCategoryEntity articleCategory;
  final void Function() onTap;
  final images = [
    "love.png",
    "brain.png",
    "healthcare-and-medical.png",
    "icon_pill_bottle.png",
    "medicine.png"
  ];

  HealthConcernItem({
    Key? key,
    required this.articleCategory,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                backgroundImage: AssetImage('assets/images/${images[Random().nextInt(5)]}',),
                radius: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  articleCategory.title??"",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
