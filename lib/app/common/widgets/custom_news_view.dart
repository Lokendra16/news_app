import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';
import 'package:news_app/app/networking/models/news_response/news_response.dart';

class CustomNewsView extends StatelessWidget {
  final Size screenSize;
  final Data newsData;
  final HomeController homeController;

 const CustomNewsView({
    Key? key,
    required this.newsData,
    required this.screenSize, required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: newsData.imageUrl!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image_rounded),
                height: screenSize.height * 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,24,0,24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      newsData.title!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      homeController.bookmarkNews(newsData);
                    },
                    child: SizedBox(
                      height: 36,
                      width: 36,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)
                        ),

                          child: const Icon(Icons.bookmark)),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(child: Text(newsData.content!)),
          ],
        ),
      ),
    );
  }
}
