import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ulearna_social_app/core/utils/utils.dart';
import 'package:ulearna_social_app/features/reels/domain/entities/reels_entity.dart';
import 'package:ulearna_social_app/features/reels/presentation/widgets/place_holder_image_widget.dart';
import 'package:ulearna_social_app/features/reels/presentation/widgets/text_widget.dart';

class ThumnailWidget extends StatelessWidget {
  const ThumnailWidget({super.key, this.data, this.isLoading = false});

  final ReelsEntity? data;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.30,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      child: !isLoading
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: SizedBox(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: SizedBox(
                              
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: data?.thumbnailUrl.isNotEmpty ?? false
                                      ? CachedNetworkImage(
                                          imageUrl: data!.thumbnailUrl,
                                          errorWidget: (context, url, error) =>
                                              const PlaceHolderImage(),
                                          progressIndicatorBuilder:
                                              (context, url, progress) =>
                                                  const Center(
                                            child: SizedBox(
                                              height: 10,
                                              width: 10,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        )
                                      : const PlaceHolderImage()),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: SizedBox(
                                                child: TextWidget(
                                                  text: data?.title ?? "",
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  maxLines: 2,
                                                  overFlow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: data?.language ?? "",
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: convertDate(data?.createdAt),
                                          color: Colors.blue,
                                        ),
                                      ],
                                    ),
                                  )),

                                  Expanded(
                                      child: SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: formatDuration(data?.duration),
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ))
                ],
              ),
            )
          : const Center(
              child: SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )),
    );
  }
}
