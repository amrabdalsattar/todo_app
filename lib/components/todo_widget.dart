import 'package:assignment_five_flutter/models/data_model.dart';
import 'package:assignment_five_flutter/utils/app_theme.dart';
import 'package:assignment_five_flutter/utils/assets.dart';
import 'package:assignment_five_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoWidget extends StatelessWidget {
  final TodoDM dataModel;
  const TodoWidget({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 30),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: AppColor.red,

            icon: Icons.delete,
            label: "delete",),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          // margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 30),
          height: MediaQuery.of(context).size.height * 0.15,

          child: Row(
            children: [
              const VerticalDivider(),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      dataModel.title,
                      style: AppThemes.textDescriptionTextStyle,
                    ),
                    Text(
                      dataModel.description,
                      style: AppThemes.textDescriptionDateTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(15)),
                  child: const ImageIcon(AssetImage(AppAssets.iconCheck)))
            ],
          ),
        ),
      ),
    );
  }
}
