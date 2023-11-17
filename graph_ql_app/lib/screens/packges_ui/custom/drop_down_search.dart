import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/controller/ui/ui_controller.dart';

class DropDownSearchWidget extends StatelessWidget {
  DropDownSearchWidget({super.key});
  final UiController controller = Get.put(UiController());
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      // dropdownButtonProps: DropdownButtonProps(
      //     color: Colors.amber, icon: Icon(Icons.arrow_circle_down_rounded)),
      clearButtonProps: ClearButtonProps(color: Colors.red),
      enabled: true,
      popupProps: PopupProps.menu(
          searchFieldProps: TextFieldProps(
              autofillHints: [
                "Brazil",
                "Italia (Disabled)",
                "Tunisia",
                'Canada'
              ],
              autofocus: true,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: 'Search ...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(12)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              )),
          showSelectedItems: true,
          showSearchBox: true,
          menuProps: MenuProps(backgroundColor: Colors.white70, elevation: 4),
          itemBuilder: (context, item, isSelected) {
            return Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.flag)),
                Text(item),
              ],
            );
          },
          searchDelay: Duration(milliseconds: 200),
          disabledItemFn: (String s) => s.startsWith('I'),
          constraints: BoxConstraints(
            maxHeight: 300,
          )),
      items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: TextStyle(color: Colors.black, fontSize: 14),
        dropdownSearchDecoration: InputDecoration(
          enabled: false,
          // labelText: "Select Value",
          // labelStyle: TextStyle(color: Colors.blue, fontSize: 14),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(12)),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          hintText: "select value",
        ),
      ),
      onChanged: (val) {
        controller.selectValue(val!);
        log(val.toString());
      },
      selectedItem: controller.selectedValue,
    );
  }
}
