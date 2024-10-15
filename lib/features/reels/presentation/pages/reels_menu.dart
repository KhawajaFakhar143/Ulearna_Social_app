import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearna_social_app/core/app_strings/app_strings.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_bloc.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_event.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_state.dart';
import 'package:ulearna_social_app/features/reels/presentation/pages/reels_player_page.dart';
import 'package:ulearna_social_app/features/reels/presentation/widgets/text_widget.dart';
import 'package:ulearna_social_app/features/reels/presentation/widgets/thumnail_widget.dart';

class ReelsMenuPage extends StatelessWidget {
  const ReelsMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TextWidget(text: AppStrings.reelMenuTitleText),
        ),
        body: BlocBuilder<ReelsBloc, ReelsState>(
          builder: (context, state) {
            if (state is ReelsFetchingFailed) {
              return const BuildError();
            } else if (state is ReelsFetchedData) {
              return const BuildData();
            } else {
              return const BuildData();
            }
          },
        ));
  }
}

class BuildData extends StatefulWidget {
  const BuildData({
    super.key,
  });

  @override
  State<BuildData> createState() => _BuildDataState();
}

class _BuildDataState extends State<BuildData> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      BlocProvider.of<ReelsBloc>(context).add(FetchReels());
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = context.read<ReelsBloc>().reelsData;
    return data.isNotEmpty
        ? ListView.builder(
            controller: _scrollController,
            itemCount: data.length + 1,
            itemBuilder: (context, index) {
              if (index > data.length - 1) {
                return const ThumnailWidget(
                  isLoading: true,
                );
              } else {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReelsPage(
                            initialVideoIndex: index,
                          ),
                        ));
                  },
                  child: ThumnailWidget(
                    data: data[index],
                  ),
                );
              }
            },
          )
        : const SizedBox();
  }
}

class BuildError extends StatelessWidget {
  const BuildError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [TextWidget(text: AppStrings.reelMenuTextUnableToFetchReels)],
    );
  }
}

class BuildLoading extends StatelessWidget {
  const BuildLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [CircularProgressIndicator()],
    );
  }
}
