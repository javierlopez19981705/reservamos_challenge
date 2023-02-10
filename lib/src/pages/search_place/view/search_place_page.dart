import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos_challenge/src/pages/home/cubit/home_cubit.dart';
import 'package:reservamos_challenge/src/utils/utils_widgets.dart';
import 'package:reservamos_challenge/src/widgets/card_place_search.dart';
import 'package:reservamos_challenge/src/widgets/custom_text_form_field.dart';

import '../../../utils/debouncer.dart';

class SearchPlacePage extends StatelessWidget {
  const SearchPlacePage({
    required this.isFrom,
    super.key,
  });

  final bool isFrom;

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().resetSearch();
    return Scaffold(
      appBar: AppBar(),
      body: SearchPlacesView(isFrom: isFrom),
    );
  }
}

class SearchPlacesView extends StatelessWidget {
  SearchPlacesView({required this.isFrom, super.key});
  final bool isFrom;

  final Debouncer _onSearchDebouncer = Debouncer(
    delay: const Duration(
      seconds: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          CustomTextFormField(
            icon: Icons.place,
            textEnd: '',
            label: 'Busca un destino',
            onChanged: (val) => _onSearchDebouncer.debounce(
              () {
                context.read<HomeCubit>().initSearch(
                      query: val,
                      isFrom: isFrom,
                    );
              },
            ),
          ),
          spaceVertical(),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                switch (state.searchStatus) {
                  case SearchStatus.init:
                    return const SizedBox();
                  case SearchStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case SearchStatus.sucess:
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final place = state.search[index];
                        return CardPlaceSearch(
                          place: place,
                          isFrom: isFrom,
                          onPressed: () {
                            context.read<HomeCubit>().placeSelectSearch(
                                place: place, isFrom: isFrom);
                            Navigator.pop(context);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => spaceVertical(),
                      itemCount: state.search.length,
                      physics: const BouncingScrollPhysics(),
                    );
                  case SearchStatus.error:
                    return const Text('HA OCURRIDO UN ERROR');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
