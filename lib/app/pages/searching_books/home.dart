import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_study/app/pages/searching_books/bloc/home_bloc.dart';
import 'package:to_study/app/pages/searching_books/childrens/book_info.dart';
import 'package:to_study/app/pages/searching_books/widgets/buttons/send_button.dart';
import 'package:to_study/app/pages/searching_books/widgets/inputs/generic_input.dart';
import 'package:to_study/app/utils/texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final texts = AppTexts();
    final blocHome = BlocProvider.of<ShortBloc>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<ShortBloc, ShortenedState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        width: width * 0.8,
                        height: height * 0.15,
                        child: GenerinInputWidget(
                          onWrite: (data) {
                            blocHome.add(OnGettingShortURL(data));
                          },
                          hintText: texts.writeYourURL,
                          onError: state is ErrorInputURLState
                              ? texts.notAValidUrl
                              : null,
                        )),
                    state is LoadingState
                        ? Padding(
                            padding: Platform.isAndroid
                                ? const EdgeInsets.only(
                                    bottom: 30, left: 5, right: 30)
                                : const EdgeInsets.only(
                                    bottom: 50, left: 5, right: 30),
                            child: const CupertinoActivityIndicator())
                        : Padding(
                            padding: !Platform.isAndroid
                                ? const EdgeInsets.only(bottom: 70)
                                : const EdgeInsets.only(bottom: 40),
                            child: SendButton(
                              onPress: () {
                                blocHome.add(OnGetShortURLEvent());
                              },
                            ),
                          ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 180, top: 5),
                  child: Text(
                    texts.recentlyShorted,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                BlocBuilder<ShortBloc, ShortenedState>(
                  builder: (context, state) {
                    return state is ShortInitialState
                        ? Container(
                            padding: const EdgeInsets.symmetric(vertical: 100),
                            child: Text(texts.writeSomethingtoStart))
                        : state.model.shortList.isEmpty == true
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.2,
                                    horizontal: width * 0.15),
                                child: Text(AppTexts().noResults))
                            : SizedBox(
                                key: const Key('List'),
                                height: height * 0.6,
                                width: double.infinity,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.model.shortList.isNotEmpty
                                      ? state.model.shortList.length
                                      : 0,
                                  itemBuilder: (context, int index) {
                                    return ListTile(
                                      onTap: (){
                                        showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const BookInfo();
                    });
                                      },
                                        title: Text(
                                            state.model.shortList[index].title),
                                        subtitle: Text(state.model
                                            .shortList[index].authorName[0]));
                                  },
                                ),
                              );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
