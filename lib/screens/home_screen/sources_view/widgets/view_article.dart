import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/constants_manager.dart';
import 'package:news/core/widgets/custom_button.dart';
import 'package:news/models/articles_response/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewFullArticle extends StatelessWidget {
  const ViewFullArticle({super.key, required this.article});

  final Article article;

  void _launchUrl(String url) async {
    Uri url = Uri.parse(article.url!);
    if (!await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.platformDefault,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          ConstantsManager.getContrastingColor(Theme.of(context).primaryColor),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: REdgeInsets.only(bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  width: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Text(
              article.description ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  text: AppLocalizations.of(context)!.view_full_article,
                  onPressed: () {
                    _launchUrl(article.url ?? '');
                    Navigator.pop(context);
                  },
                  backGroundColor: Theme.of(context).primaryColor,
                  foreGroundColor: ConstantsManager.getContrastingColor(
                      Theme.of(context).primaryColor),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
