

import 'package:car_rental_app/core/network/services/database.dart';
import 'package:car_rental_app/model/brand_model/brand_model.dart';
import 'package:flutter/material.dart';

void myBottomSheet({
  required BuildContext context,
  List<String>? items,
  required Function(String) onItemSelected,
}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return items != null 
        ? Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: items.map((item) {
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    onItemSelected(item);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        ): StreamBuilder<List<BrandModel>>(
          stream: DatabaseService().brands, 
          builder: (context, snapshot) {
            return snapshot.data == null
              ?  Center(child: CircularProgressIndicator())
              :  Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: snapshot.data!.map((item) {
                        return ListTile(
                          title: Text(item.name),
                          onTap: () {
                            onItemSelected(item.name);
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                );
          },
        );
      },
    );
  }