import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:study_group_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:study_group_flutter/app/routes/app_pages.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  controller.getFavorites();
                },
                child: Obx(() {
                  // Ambil produk favorit yang disimpan
                  final favoriteProductIds = controller.favoriteProducts;
                  if (favoriteProductIds.isEmpty) {
                    return const Center(child: Text('No favorite products'));
                  }

                  // Mengambil data produk dari HomeController
                  final products = Get.find<HomeController>().product.products;

                  // Filter produk berdasarkan ID yang ada di favoriteProductIds
                  final favoriteProducts = products?.where((product) {
                    return favoriteProductIds.contains(product.id);
                  }).toList();

                  return SingleChildScrollView(
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
                        const SizedBox(height: 20),
                        Text(
                          'Your Favorite Products',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 20),
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
                          itemCount: favoriteProducts?.length ?? 0,
                          itemBuilder: (context, index) {
                            final data = favoriteProducts![index];

                            return InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_PRODUCT,
                                  arguments: {"id": data.id},
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
                                        imageUrl: data.thumbnail ??
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
                                            data.title ?? "",
                                            style: const TextStyle(
                                                color: Colors.black),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$${data.price}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                      color: const Color(
                                                          0xFF00623B),
                                                    ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  controller
                                                      .toggleFavorite(data.id!);
                                                },
                                                icon: Icon(
                                                  controller.isFavorite(data.id)
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: controller
                                                          .isFavorite(data.id)
                                                      ? Colors.red
                                                      : Colors.grey,
                                                ),
                                              ),
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
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
  }
}
