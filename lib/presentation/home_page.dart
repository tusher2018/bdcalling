import 'package:bdcalling/controller/home_controller.dart';
import 'package:bdcalling/res/commnText.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow_container/glow_container.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = [
    'Action',
    'Anime',
    'Sci-fi',
    'Thriller',
    'Action',
    'Anime',
    'Sci-fi',
    'Thriller',
    'Action',
    'Anime',
    'Sci-fi',
    'Thriller'
  ];

  final Map<String, List<Map<String, String>>> movieSections = {
    'Trending Movies': [
      {
        'title': 'Yes I Do',
        'imageUrl':
            'https://th.bing.com/th/id/OIP.1umjRUVLTbPQCPVU_q1HPgHaK-?rs=1&pid=ImgDetMain'
      },
      {
        'title': 'Inside Out 2',
        'imageUrl':
            'https://th.bing.com/th/id/OIP.1umjRUVLTbPQCPVU_q1HPgHaK-?rs=1&pid=ImgDetMain'
      },
      {
        'title': 'Babylon',
        'imageUrl':
            'https://th.bing.com/th/id/OIP.1umjRUVLTbPQCPVU_q1HPgHaK-?rs=1&pid=ImgDetMain'
      }
    ],
    'Continue Watching': [
      {
        'title': 'Wednesday I Season - 1I Episode - 3',
        'imageUrl':
            'https://th.bing.com/th/id/OIP.1umjRUVLTbPQCPVU_q1HPgHaK-?rs=1&pid=ImgDetMain',
        'watch': "0.7"
      },
      {
        'title': 'Emily in Paris I Season - 1I Episode - 1',
        'imageUrl':
            'https://th.bing.com/th/id/OIP.1umjRUVLTbPQCPVU_q1HPgHaK-?rs=1&pid=ImgDetMain',
        'watch': "0.5"
      }
    ],
    'Recommended For You': [
      {
        'title': 'Double Love',
        'imageUrl':
            'https://th.bing.com/th/id/OIP.1umjRUVLTbPQCPVU_q1HPgHaK-?rs=1&pid=ImgDetMain'
      },
      {
        'title': 'Sunita',
        'imageUrl':
            'https://th.bing.com/th/id/OIP.1umjRUVLTbPQCPVU_q1HPgHaK-?rs=1&pid=ImgDetMain'
      },
      {
        'title': 'Pokemon: Detective Pikachu',
        'imageUrl':
            'https://th.bing.com/th/id/OIP.1umjRUVLTbPQCPVU_q1HPgHaK-?rs=1&pid=ImgDetMain'
      }
    ]
  };

  final homePageController = Get.put(HomePageController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText('Hello Rafsan', fontSize: 20),
                      commonText("Let's watch today",
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ],
                  ),
                  GlowContainer(
                    glowRadius: 30,
                    gradientColors: const [Colors.blue],
                    containerOptions: const ContainerOptions(
                        borderRadius: 50, margin: EdgeInsets.only(right: 16)),
                    child: const CircleAvatar(
                      radius: 30, // Adjust size as needed
                      backgroundImage: CachedNetworkImageProvider(
                        'https://th.bing.com/th/id/OIP.XK5zP9GXT6GWYa8_HgWM6QAAAA?rs=1&pid=ImgDetMain',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              //Search Field
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText('Categories',
                      fontSize: 16, fontWeight: FontWeight.w600),
                  commonText('See More'),
                ],
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories
                      .asMap()
                      .map((index, category) {
                        return MapEntry(
                            index,
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Obx(() {
                                bool isSelected = homePageController
                                        .selectedCategoryIndex.value ==
                                    index;
                                return GestureDetector(
                                  onTap: () {
                                    homePageController
                                        .selectedCategoryIndex.value = index;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.grey.shade900,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: commonText(category,
                                        fontSize: 14,
                                        color: isSelected
                                            ? Colors.grey.shade900
                                            : Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                );
                              }),
                            ));
                      })
                      .values
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //thamble image
              Container(
                height: 180,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: CachedNetworkImageProvider(
                            "https://th.bing.com/th/id/OIP.1umjRUVLTbPQCPVU_q1HPgHaK-?rs=1&pid=ImgDetMain"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(16)),
              ),
              const SizedBox(height: 16),

              _buildSection(
                context,
                "Trending Movies",
                movieSections["Trending Movies"]!,
              ),
              _buildSection(context, "Continue Watching",
                  movieSections["Continue Watching"]!,
                  continuewatching: true, width: 160, height: 100),
              _buildSection(
                context,
                "Recommended For You",
                movieSections["Recommended For You"]!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<Map<String, String>> items,
      {double height = 150,
      double width = 100,
      bool continuewatching = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: commonText(title,
                    fontSize: 16, fontWeight: FontWeight.w600)),
            commonText('See More'),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: height + 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: height,
                      width: width,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: items[index]['imageUrl']!,
                              height: height,
                              width: width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (continuewatching)
                            LinearProgressIndicator(
                              value: double.parse(items[index]['watch']!),
                              backgroundColor: Colors.transparent,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.red),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      constraints: BoxConstraints(maxWidth: width),
                      child: commonText(
                        maxLines: 2,
                        items[index]['title']!,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
