import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/controller/create_new_project_controller.dart';
import 'package:idealize_new_version/Features/create_new_project/presentation/widgets/tag_container_widget.dart';
import '../../../../Core/Components/textfields_widget.dart';

class CreateNewProjectStepOneScreen
    extends GetView<CreateNewProjectController> {
  const CreateNewProjectStepOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().colors.backGroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: AppConfig().dimens.medium,
            right: AppConfig().dimens.medium,
            bottom: AppConfig().dimens.medium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.projectTitle.tr,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Gap(AppConfig().dimens.small),
              CustomTextField(
                labelText: AppStrings.projectTitleHint.tr,
                controller: controller.titleCtrl,
                onChanged: controller.updateTitle,
              ),
              Gap(AppConfig().dimens.medium),
              Text(
                AppStrings.desciption.tr,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Gap(AppConfig().dimens.small),
              CustomMultiLineTextField(
                controller: controller.descriptionCtrl,
                onChanged: controller.updateDescription,
              ),
              Gap(AppConfig().dimens.medium),
              TagsContainer(
                selectedTags: controller.selectedTags,
                onTagsChanged: (newTags) {
                  controller.selectedTags.clear();
                  controller.selectedTags.addAll(newTags);
                  controller.update();
                },
              ),
              Gap(AppConfig().dimens.large),
              Text(AppStrings.thisFieldAreRequired.tr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppConfig().colors.txtColor,
                  )),
              Gap(AppConfig().dimens.medium),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppConfig().dimens.medium,
          right: AppConfig().dimens.medium,
          bottom: AppConfig().dimens.large,
          top: AppConfig().dimens.small,
        ),
        child: GetBuilder<CreateNewProjectController>(
          init: controller,
          builder: (_) => Row(
            children: [
              Expanded(
                child: CustomOutlineIconButton(
                  title: (controller.updateProjectModel == null)
                      ? AppStrings.saveAsDraft.tr
                      : (controller.routeFrom == "add-project")
                          ? "Save as Draft"
                          : "Edit and Save",
                  onTap: (controller.titleCtrl.text.isNotEmpty &&
                          controller.descriptionCtrl.text.isNotEmpty &&
                          controller.selectedTags.isNotEmpty)
                      ? (controller.updateProjectModel != null
                          ? () => controller.updateProject(
                              isDraft: controller.updateProjectModel!.isDraft)
                          : controller.createNewProjectAsDraft)
                      : null,
                ),
              ),
              Gap(AppConfig().dimens.small),
              Expanded(
                child: CustomIconButton(
                  color: AppConfig().colors.primaryColor,
                  title: AppStrings.next.tr,
                  txtColor: Colors.white,
                  onTap: ((controller.titleCtrl.text.isEmpty ||
                              controller.descriptionCtrl.text.isEmpty) ||
                          controller.loading.value ||
                          controller.selectedTags.isEmpty)
                      ? null
                      : controller.createNewProjectStep2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
