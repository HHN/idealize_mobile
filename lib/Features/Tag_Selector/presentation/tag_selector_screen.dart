import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/add_new_tag_bottomsheet_widget.dart';
import 'package:idealize_new_version/Core/Components/buttons_widget.dart';
import 'package:idealize_new_version/Core/Components/textfields_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Features/tag_selector/presentation/controller/tag_selector_controller.dart';

class TagSelectorScreen extends StatelessWidget {
  final List<Tag> initialChipData;
  final List<Tag> initialSelectedChipData;
  final Function(List<Tag>)? onChipSelectedList;
  final VoidCallback? onTapedSavedButton;
  final TagType tagType;

  TagSelectorScreen({
    super.key,
    required this.initialChipData,
    required this.initialSelectedChipData,
    required this.tagType,
    this.onChipSelectedList,
    this.onTapedSavedButton,
  });

  final controller = Get.put(TagSelectorController());

  @override
  Widget build(BuildContext context) {
    controller.init(
      initialChipDataList: initialChipData,
      initialSelectedChipDataList: initialSelectedChipData,
      typeValue: tagType,
    );

    TextTheme textStyles = Theme.of(context).textTheme;
    return Obx(
      () => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        child: SizedBox(
          child: ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: AppConfig().dimens.medium.allPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppConfig().dimens.small),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CustomSearchField(
                      secondIcon: Iconsax.search_normal_14,
                      labelText: "Suche",
                      controller: controller.searchCtrl,
                      onChanged: controller.search,
                    ),
                  ),
                  Gap(AppConfig().dimens.medium),
                  Expanded(
                    child: controller.tags.value.isNotEmpty
                        ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: controller.tags.value.map((entry) {
                                bool isSelected = controller.selectedTags.value
                                        .indexWhere((element) =>
                                            element.id == entry.id) >
                                    -1;

                                return ChoiceChip(
                                  checkmarkColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: isSelected
                                          ? AppConfig().colors.greenColor
                                          : AppConfig().colors.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        AppConfig().dimens.small),
                                  ),
                                  selectedColor: AppConfig().colors.greenColor,
                                  label: Text(entry.tagName),
                                  labelStyle: isSelected
                                      ? textStyles.titleMedium!
                                          .copyWith(color: Colors.white)
                                      : textStyles.titleMedium!.copyWith(
                                          color:
                                              AppConfig().colors.primaryColor),
                                  selected: isSelected,
                                  onSelected: (bool selected) {
                                    _updateTagSelection(entry, selected);
                                  },
                                );
                              }).toList(),
                            ),
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.info_circle,
                                  size: 70,
                                  color: Colors.grey[400],
                                ),
                                Gap(AppConfig().dimens.small),
                                const Text(
                                  'It is empty here!',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                Gap(AppConfig().dimens.extraLarge),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      backgroundColor: Colors.white,
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AddNewTagBottomsheetWidget(
                                        onAddedTagName: controller.addNewTag,
                                        tagName: controller.searchCtrl.text,
                                      ),
                                    );
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: "Click  ",
                                      style: textStyles.titleMedium!.copyWith(
                                        color:
                                            AppConfig().colors.lightGrayColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "here\n",
                                          style:
                                              textStyles.titleMedium!.copyWith(
                                            color: AppConfig()
                                                .colors
                                                .secondaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: AppConfig()
                                                .colors
                                                .secondaryColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "  to add new Course or Tag.",
                                          style:
                                              textStyles.titleMedium!.copyWith(
                                            color: AppConfig()
                                                .colors
                                                .lightGrayColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                  Gap(AppConfig().dimens.medium),
                  CustomIconButton(
                    color: AppConfig().colors.secondaryColor,
                    title: "Save",
                    txtColor: AppColors().primaryColor,
                    onTap: () {
                      Get.back();
                      onTapedSavedButton?.call();
                    },
                  ),
                  Gap(AppConfig().dimens.medium),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateTagSelection(Tag tag, bool isSelected) {
    if (isSelected) {
      controller.selectedTags.value.add(tag);
    } else {
      controller.selectedTags.value.removeWhere((elem) => elem.id == tag.id);
    }

    controller.selectedTags.refresh();

    onChipSelectedList?.call(controller.selectedTags);
  }
}
