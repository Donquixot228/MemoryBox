import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/cubits/collections_builder_cubit/collections_builder_cubit.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCollectionPage extends StatelessWidget {
  const CreateCollectionPage();

  static const String routeName = '/createCollectionPage';

  static Widget create() {
    return const CreateCollectionPage();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<CollectionsBuilderCubit, CollectionsBuilderState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.whiteColor,
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/images/backgroundVector/PodborkiVector.svg',
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: kToolbarHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: IconButton(
                          onPressed: () {
                            //setIndex(1);
                          },
                          icon:
                              SvgPicture.asset(AppIcons.Back_Arrow_Collection),
                        ),
                      ),
                      Text(
                        "Создание",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 36),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () {


                        },
                        child: Text(
                          'Готово',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.19,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          cursorColor: Colors.white,
                          cursorWidth: 3,
                          maxLength: 23,
                          textAlign: TextAlign.center,
                          onChanged: context
                              .read<CollectionsBuilderCubit>()
                              .setCollectionName,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: AppColors.whiteColor),
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: AppColors.whiteColor),
                            hintText: 'Введите название...',
                            isCollapsed: true,
                          ),
                        ),
                      ),
                    ),
                    BuildImageCard(
                      height: height,
                      width: width,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.12,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 3),
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          physics: const BouncingScrollPhysics(),
                          child: TextField(
                            cursorColor: Colors.black,
                            cursorWidth: 3,
                            textAlign: TextAlign.start,
                            onChanged: context
                                .read<CollectionsBuilderCubit>()
                                .setCollectionDescription,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: AppColors.textColor,
                                      fontSize: 20,
                                    ),
                            maxLines: null,
                            decoration: InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: AppColors.textColor),
                              hintText: 'Введите описание...',
                              isCollapsed: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextButton(
                      onPressed: () {
                        //   setIndex(9);
                      },
                      child: Text('Добавить аудиофайл',
                          style: Theme.of(context).textTheme.headline5!),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
