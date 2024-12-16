import 'package:flutter/material.dart';
import 'package:study_group_flutter/models/product_model.dart';
import 'package:study_group_flutter/pages/product_detail_page.dart';
import 'package:study_group_flutter/utils/data_dummy.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFFFE),
      body: SafeArea(
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
                    height: kToolbarHeight - 16,
                    fit: BoxFit.contain,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Our way of loving \nyou back',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
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
                height: 40,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    // ini ngambil dari data dummy dari utils data dummy
                    final String data = DataDummy.listDummyCategories[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 4,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          data,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4D4D4D),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: DataDummy.listDummyCategories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Our Best Seller',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.67,
                ),
                itemCount: DataDummy.listDummyProducts.length,
                itemBuilder: (context, index) {
                  // ngambil datanya dari utils
                  final ProductModel data = DataDummy.listDummyProducts[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDetailPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 120,
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
                            child: Image.asset(
                              data.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              top: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data.title,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${data.price}',
                                      style: const TextStyle(
                                        color: Color(0xFF00623B),
                                        fontSize: 18,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite,
                                        color: data.isFavorite
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
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
    );
  }
}
