import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/ViewModel/About/cubit.dart';
import 'package:market_app/ViewModel/About/states.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCubit()..getData(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 7, 117, 64),
          title: Text(
            "About Us".tr(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              BlocConsumer<AboutCubit, AboutStates>(
                builder: (context, state) {
                  //
                  if (state is AboutLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                        child: Text(
                          context.read<AboutCubit>().datadesc[0].desc!,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    );
                  }
                },
                listener: (context, state) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
