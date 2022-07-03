import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/presentation/widgets/load_button/bloc/load_button_cubit.dart';
import 'package:appsfactory_test/presentation/widgets/load_button/bloc/load_button_state.dart';
import 'package:appsfactory_test/presentation/widgets/loading_indicator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadButton extends StatelessWidget {
  const LoadButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final Future<Either<Failure, void>> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoadButtonCubit(onPressed),
      child: BlocListener<LoadButtonCubit, LoadButtonState>(
        listener: (BuildContext context, LoadButtonState state) {
          if(state is LoadButtonError){
            showErrorFlushbar(context, state.error);
          }
        },
        child: BlocBuilder<LoadButtonCubit, LoadButtonState>(
          builder: (BuildContext context, LoadButtonState state){
            final cubit = context.read<LoadButtonCubit>();
            final theme = Theme.of(context);

            if(state is LoadButtonInitial){
              return IconButton(
                icon: Icon(icon, color: theme.textTheme.caption?.color),
                onPressed: cubit.action,
              );
            }

            if(state is LoadButtonError){
              return IconButton(
                icon: const Icon(Icons.replay, color: Colors.red,),
                onPressed: cubit.action,
              );
            }

            if(state is LoadButtonLoading){
              return IconButton(
                icon: LoadingIndicator(
                  size: 20,
                  strokeWidth: 2,
                  color: theme.textTheme.caption?.color,
                ),
                onPressed: null, 
              );
            }

            return const SizedBox(
              width: 24,
              height: 24,
            );
          },
        ),
      ),
    );
  }
}
