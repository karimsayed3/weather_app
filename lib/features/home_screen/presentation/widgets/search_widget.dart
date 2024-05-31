import 'package:flutter/material.dart';

import '../../business_logic/cubit/home_screen_cubit.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        top: height * .01,
        left: width * .05,
        right: width * .05,
      ),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          HomeScreenCubit.get(context)
              .getWeather(cityName: value);
          HomeScreenCubit.get(context)
              .getFiveDaysWeatherData(cityName: value);
        },
        decoration: InputDecoration(
          suffix: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintStyle: const TextStyle(color: Colors.white),
          hintText: 'SEARCH',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
