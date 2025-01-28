import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_group_flutter/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:study_group_flutter/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return controller.isLoading
            ? Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF00623B),
                  ),
                ),
              )
            : Scaffold(
                body: SafeArea(
                  child: RefreshIndicator.adaptive(
                    onRefresh: () async {
                      controller.getProduct();
                      controller.getProductCategoryList();
                    },
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.menu_rounded),
                              ),
                              Image.asset(
                                'assets/icons/ic_logo.png',
                                height: kToolbarHeight - 16.h,
                                fit: BoxFit.contain,
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(Routes.CART);
                                },
                                icon: const Icon(
                                  Icons.shopping_bag_outlined,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'Our way of loving \nyou back',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 25.sp),
                          ),
                          const SizedBox(height: 30),
                          SearchBar(
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            elevation: const WidgetStatePropertyAll(0),
                            leading: const Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Icon(
                                Icons.search,
                                color: Color(0xFF868A91),
                              ),
                            ),
                            hintText: 'Search',
                            hintStyle: const WidgetStatePropertyAll(
                              TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            backgroundColor: const WidgetStatePropertyAll(
                              Color(0xFFF2F2F2),
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            height: 40.h,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              clipBehavior: Clip.none,
                              // itemCount: DataDummy.listDummyCategories.length,
                              itemCount: controller.categoryList.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                final String data =
                                    controller.categoryList[index];
                                // DataDummy.listDummyCategories[index];

                                return InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () => controller.filterProducts(data),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 4,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: controller.selectedCategory == data
                                          ? const Color(0xFF00623B)
                                          : const Color(0xFFF2F2F2),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Text(
                                      data,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            color:
                                                controller.selectedCategory ==
                                                        data
                                                    ? Colors.white
                                                    : const Color(0xFF4D4D4D),
                                          ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Our Best Seller',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 20.sp,
                                ),
                          ),
                          const SizedBox(height: 20),
                          GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.67,
                            ),
                            itemCount: controller.product.products?.length ?? 0,
                            itemBuilder: (context, index) {
                              final data = controller.product.products?[index];

                              return InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  Get.toNamed(
                                    Routes.DETAIL_PRODUCT,
                                    arguments: {"id": data?.id},
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFFFCFFFE),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 5,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          imageUrl: data?.thumbnail ??
                                              "https://example.com/placeholder.png",
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(
                                            color: Color(0xFF00623B),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data?.title ?? "",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '\$${data?.price}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        color: const Color(
                                                            0xFF00623B),
                                                      ),
                                                ),
                                                Obx(() {
                                                  return IconButton(
                                                    onPressed: () {
                                                      controller.toggleFavorite(
                                                          data.id!);
                                                    },
                                                    icon: Icon(
                                                      controller.isFavorite(
                                                              data!.id)
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      color:
                                                          controller.isFavorite(
                                                                  data.id)
                                                              ? Colors.red
                                                              : Colors.grey,
                                                    ),
                                                  );
                                                }),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
