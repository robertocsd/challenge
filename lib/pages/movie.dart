import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_study/bloc/bloc/short_bloc.dart';
import 'package:to_study/models/short_response_model.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    final shortBloc = BlocProvider.of<ShortBloc>(context);

    return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 100),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    width: 300,
                    child: TextField(
                      onChanged: (data) {
                        // print(data + 'dd');
                        BlocProvider.of<ShortBloc>(context).add(OnGettingShortURL(data));
                    
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 95, 95, 95)),
                        hintText: "Write your shortened URL",
                        fillColor: const Color.fromARGB(255, 214, 207, 207),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                       BlocProvider.of<ShortBloc>(context).add(OnGetShortURLEvent());
                  
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      height: 60,
                      width: 85,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 214, 207, 207),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: const Icon(Icons.send),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(right: 180, top: 50),
                child: const Text(
                  'Recently shortened URLs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              BlocBuilder<ShortBloc, ShortenedState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 500,
                    width: 500,
                    child: ListView.builder(
                      
                      itemCount: state.model.shortList.isNotEmpty
                          ? state.model.shortList.length
                          : 0,
                      itemBuilder: (context, int index) {
                        return ListTile(title: Text(state.model.shortList[index].links!.self!), subtitle: Text(state.model.shortList[index].links!.short!));
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
    
  }
}
