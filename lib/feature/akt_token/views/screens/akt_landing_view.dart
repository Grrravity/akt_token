import 'package:akt_token/feature/akt_token/views/bloc/akt_token_bloc/akt_token_export_bloc.dart';
import 'package:akt_token/feature/akt_token/views/components/display/size_error_display.dart';
import 'package:akt_token/feature/akt_token/views/components/widget/loading_widget.dart';
import 'package:akt_token/feature/akt_token/views/screens/akt_token_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class AktLanding extends StatelessWidget {
  const AktLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AktTokenBloc>(),
      child: Container(
          alignment: Alignment.center,
          child: BlocBuilder<AktTokenBloc, AktTokenState>(
            builder: (context, state) {
              if (state is Loading) {
                return LoadingWidget();
              } else if (state is Loaded) {
                if (kIsWeb &&
                    (MediaQuery.of(context).size.width < 311 ||
                        MediaQuery.of(context).size.height < 500)) {
                  return SizeError();
                } else {
                  if (kIsWeb)
                    return AspectRatio(
                        aspectRatio: 4 / 3,
                        child: AktTokenList(cryptoEntity: state.data));
                  else
                    return AktTokenList(cryptoEntity: state.data);
                }
              } else {
                BlocProvider.of<AktTokenBloc>(context).add(ViewCreation());
                return LoadingWidget();
              }
            },
          )),
    );
  }
}
