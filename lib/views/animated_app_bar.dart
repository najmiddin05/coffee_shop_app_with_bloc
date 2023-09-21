import 'package:coffee_shop_app_with_bloc/blocs/cart/bloc/cart_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';
import '../pages/pages.dart';
import 'widgets.dart';

class AnimetedAppBarWidget extends StatelessWidget {
  const AnimetedAppBarWidget({
    super.key,
    required Animation<double> animationScale,
    required AnimationController controllerScale,
  })  : _animationScale = animationScale,
        _controllerScale = controllerScale;

  final Animation<double> _animationScale;
  final AnimationController _controllerScale;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationScale,
      builder: (context, child) {
        return Transform.scale(
          scale: _controllerScale.value,
          child: SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconImageButton(
                        assetImage: CustomIcons.location,
                        onPressed: () {},
                      ),
                      Text(
                        Strings.porto,
                        style: textStyleForRobotoW400(
                            color: CustomColors.white, fontSize: 14),
                      )
                    ],
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20, top: 5),
                        child: Badge(
                          alignment: Alignment.topRight,
                          backgroundColor: CustomColors.purple,
                          largeSize: 20,
                          smallSize: 20,
                          label: Text(state.items.length.toString()),
                          child: IconImageButton(
                            assetImage: CustomIcons.cartKorzinka,
                            onPressed: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => const ShopPage(),
                                ),
                              );
                            },
                            iconSize: 38,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
