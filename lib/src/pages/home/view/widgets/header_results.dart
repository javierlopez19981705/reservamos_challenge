import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos_challenge/src/utils/navigation_pages.dart';
import 'package:reservamos_challenge/src/utils/utils_widgets.dart';

import '../../../../widgets/custom_text_form_field.dart';
import '../../cubit/home_cubit.dart';

class HeaderResult extends StatelessWidget {
  const HeaderResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const HeaderResultsView();
  }
}

class HeaderResultsView extends StatelessWidget {
  const HeaderResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // spaceVertical(),
            // _fieldFrom(context: context),
            CustomTextFormField(
              label: 'Origen',
              controller: context.read<HomeCubit>().fromController,
              icon: Icons.place,
              textEnd: 'Limpiar',
              onlyRead: true,
              onTap: () {
                NavigationPages.searchPlaces(context: context);
              },
              onTapEnd: () {
                context.read<HomeCubit>().unselectFrom();
              },
            ),
            spaceVertical(),
            CustomTextFormField(
              label: 'Destino',
              controller: context.read<HomeCubit>().toController,
              icon: Icons.place,
              textEnd: 'Limpiar',
              onlyRead: true,
              onTap: () {
                NavigationPages.searchPlaces(context: context, isFrom: false);
              },
              onTapEnd: () {
                context.read<HomeCubit>().unselectTo();
              },
            ),
            ElevatedButton(
              onPressed: state.from != null && state.to != null ? () {} : null,
              child: const Text('Buscar'),
            )
          ],
        );
      },
    );
  }

  // Widget _fieldFrom({required BuildContext context}) {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     child: Row(
  //       children: [
  //         CustomTextFormField(
  //           label: 'Origen',
  //           controller: context.read<HomeCubit>().fromController,
  //           readOnly: true,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
