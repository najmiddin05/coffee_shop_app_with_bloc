import 'package:coffee_shop_app_with_bloc/blocs/cart/bloc/cart_bloc.dart';
import 'package:coffee_shop_app_with_bloc/models/cart_item.dart';
import 'package:coffee_shop_app_with_bloc/models/coffee_model.dart';
import 'package:coffee_shop_app_with_bloc/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../constants/constants.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/gif/lottie.json",
                  height: 200, width: MediaQuery.sizeOf(context).width),
              const SizedBox(
                height: 20,
              ),
              Text(
                Strings.uhuPedidoConfirmado,
                style: textStyleForBaloo_2W700(
                  color: CustomColors.yellowDark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  Strings.agora,
                  textAlign: TextAlign.center,
                  style: textStyleForRobotoW700(
                    fontSize: 13,
                    color: CustomColors.gray_400,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 55,
                width: MediaQuery.sizeOf(context).width / 1.7,
                child: FilledButton(
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context).add(
                      ItemDeleteAllEvent(
                        item: CartItem(
                          id: 1,
                          coffeeModel: CoffeeModel(
                              id: '1',
                              title: 'title',
                              description: 'description',
                              price: 9.00,
                              assetImage: CustomIcons.arrowBack,
                              type: CoffeeType.doces),
                          size: CoffeeSize.max,
                          quantity: 1,
                          total: 1,
                        ),
                      ),
                    );
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(CustomColors.purpleDark),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    Strings.home.toUpperCase(),
                    style: textStyleForRobotoW700(
                      color: CustomColors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
