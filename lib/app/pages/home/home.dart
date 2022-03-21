import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_study/app/pages/home/bloc/home_bloc.dart';
import 'package:to_study/app/pages/home/widgets/send_button.dart';
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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: width * 0.8,
                      child: TextField(
                        onChanged: (data) {
                          blocHome.add(OnGettingShortURL(data));
                        },
                        decoration: InputDecoration(
                          errorText: state is ErrorInputURLState
                              ? texts.notAValidUrl
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 95, 95, 95)),
                          hintText: texts.writeYourURL,
                          fillColor: const Color.fromARGB(255, 214, 207, 207),
                        ),
                      ),
                    ),
                    state is LoadingState
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: const CupertinoActivityIndicator())
                        : SendButton(
                            onPress: () {
                              blocHome.add(OnGetShortURLEvent());
                            },
                          ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 180, top: 50),
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
                        : SizedBox(
                            height: height * 0.65,
                            width: double.infinity,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.model.shortList.isNotEmpty
                                  ? state.model.shortList.length
                                  : 0,
                              itemBuilder: (context, int index) {
                                return ListTile(
                                    title: Text(
                                        state.model.shortList[index].alias!),
                                    subtitle: Text(state
                                        .model.shortList[index].links!.self!));
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
