import 'package:flutter/material.dart';
import 'package:ulearna_social_app/features/reels/domain/entities/reels_entity.dart';
import 'package:ulearna_social_app/features/reels/presentation/widgets/place_holder_image_widget.dart';

class ThumnailWidget extends StatelessWidget {
  const ThumnailWidget({super.key, this.data});

  final ReelsEntity? data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.16,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: SizedBox(
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        // Image Section
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: data?.thumbnailUrl.isNotEmpty ?? false
                                ? Image.network(
                                  data!.thumbnailUrl,
                                  fit: BoxFit.contain,
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
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: SizedBox(
                                          child: TextWidget(
                                            text: widget.item.name,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            maxLines: 1,
                                            overFlow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: InkWell(
                                          onTap: () async {
                                            bool delete =
                                                await showConfirmationDialogue(
                                              context,
                                              tr.appTextAreYouSureToDelete,
                                            );
                                            widget.deleteItem!(delete);
                                          },
                                          child: const Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(Icons.delete_outline),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: !widget.item.isFoc
                                  ? SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text:
                                                "${tr.appTextWidgetBarcode} ${widget.item.barcode}",
                                            color: Colors.blue,
                                          ),
                                          widget.updateRemarks != null
                                              ? Expanded(
                                                  child: SizedBox(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        widget.updateRemarks!();
                                                      },
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Icon(
                                                          Icons.edit,
                                                          color: widget
                                                                  .remarksColored
                                                              ? Colors.amber
                                                              : null,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                            Expanded(
                              child: !widget.item.isFoc
                                  ? SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text:
                                                "${tr.appTextRate} ${widget.item.price}",
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    !widget.item.isFoc
                                        ? TextWidget(
                                            text: counterValue != null
                                                ? "${CurrencyConfig.currencySymbol}: $counterValue"
                                                : "${CurrencyConfig.currencySymbol}: ${widget.item.totalPrice}",
                                            color: Colors.blue,
                                          )
                                        : TextWidget(
                                            text: tr.appTextFreeOfCost,
                                            color: Colors.blue,
                                          ),
                                    ItemPlusMinusWidget(
                                      quantity: widget.item.quantity,
                                      appliedDiscount: widget.appliedDiscount,
                                      removeDiscount: (value) =>
                                          widget.removeDiscount != null
                                              ? widget.removeDiscount!(value)
                                              : null,
                                      valueChanged: (value) {
                                        if (!widget.item.isFoc) {
                                          counterValue = (widget.item.price
                                                      .toString()
                                                      .toDouble() *
                                                  value.toString().toDouble())
                                              .toConfigueParseString();
                                          if (value > 0) {
                                            widget.onQuantityChanged!(
                                                widget.item.name ?? "",
                                                widget.item.price!,
                                                value.toString(),
                                                counterValue!);
                                          }
                                        } else {
                                          widget.onFocQuantityChanged!(value);
                                        }

                                        setState(() {});
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
    ;
  }
}
