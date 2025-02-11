import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/textfields_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Features/home/presentation/controller/home_controller.dart';

class HomeTopBarWidget extends GetView<HomeController> {
  const HomeTopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      initState: (_) => controller.init(),
      builder: (_) => Row(
        children: [
          Expanded(
            child: Obx(
              () => CustomSearchField(
                // icon: Iconsax.filter,
                controller: controller.searchInputController,
                secondIcon: controller.isSearchFieldEmpty.value
                    ? Iconsax.search_normal_14
                    : Iconsax.close_square,
                onIconPressed: controller.isSearchFieldEmpty.value
                    ? null
                    : () {
                        controller.searchInput = '';
                        controller.searchInputController.clear();
                        controller.isSearchFieldEmpty.value = true;
                        controller.search();
                      },
                onChanged: (newSearchValue) {
                  controller.isSearchFieldEmpty.value = newSearchValue.isEmpty;
                  return controller.searchInput = newSearchValue;
                },
                onDoneAction: () => controller.search(),
                keyboardType: TextInputType.text,
                labelText: AppStrings.findProjects.tr,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Get.toNamed(AppConfig().routes.notification),
            icon: Badge(
              backgroundColor: AppColors().redColor,
              smallSize: 12,
              isLabelVisible: controller.hasNewNotfications > 0,
              child: Icon(
                Iconsax.notification,
                color: AppConfig().colors.darkGrayColor,
                size: 30,
              ),
            ),
            padding: const EdgeInsets.all(0),
          )
        ],
      ),
    );
  }
}
