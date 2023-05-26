import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Home/cardList.dart';
import 'package:market_app/Home/search.dart';
import 'package:market_app/ViewModel/Home/cubit.dart';
import 'package:market_app/ViewModel/Home/states.dart';

class FruitsPage extends StatefulWidget {
  const FruitsPage({super.key});

  @override
  State<FruitsPage> createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getData(),

      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 239, 239),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  //color: Color(0xFF69A03A),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Healthy Food",
                          style: TextStyle(
                            color: Color.fromARGB(255, 7, 117, 64),
                            fontSize: 30,
                            fontFamily: "Vina Sans",
                          ),
                        )),
                  ),
                ),
              ],
            ),
            BlocConsumer<HomeCubit, HomeStates>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            const Text(
                              "first line",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ).tr(),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return FuCard(
                                id: context.read<HomeCubit>().data0[index].id,
                                title: context
                                    .read<HomeCubit>()
                                    .data0[index]
                                    .title,
                                image: context
                                    .read<HomeCubit>()
                                    .data0[index]
                                    .image,
                                price: context
                                    .read<HomeCubit>()
                                    .data0[index]
                                    .price,
                                description: context
                                    .read<HomeCubit>()
                                    .data0[index]
                                    .description);
                          },
                          itemCount: context.read<HomeCubit>().data0.length,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 35.0,
                          ),
                          child: TextField(
                            onChanged: (val) {},
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "search".tr(),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 127, 173, 129),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            Text(
                              "meal".tr(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 340,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return FuCard(
                                id: context.read<HomeCubit>().data1[index].id,
                                title: context
                                    .read<HomeCubit>()
                                    .data1[index]
                                    .title,
                                image: context
                                    .read<HomeCubit>()
                                    .data1[index]
                                    .image,
                                price: context
                                    .read<HomeCubit>()
                                    .data1[index]
                                    .price,
                                description: context
                                    .read<HomeCubit>()
                                    .data1[index]
                                    .description);
                          },
                          itemCount: context.read<HomeCubit>().data1.length,
                        ),
                      ),
                    ],
                  );
                }
              },
              listener: (context, state) {},
            ),
          ],
        ),
      ),
      //   ),
      // ),
    );
  }
}
