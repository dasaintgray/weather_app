import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weatherapp/services/constant/service_constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final hc = Get.find<HomeController>();
  final tecLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: hc.isLoading.value
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.all(10),
                color: Colors.lightBlue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: TextField(
                        controller: tecLocation,
                        cursorWidth: 1.0,
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: const Padding(
                            padding: EdgeInsetsDirectional.only(start: 2.0, end: 2.0),
                            child: Icon(
                              Icons.location_city,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          // suffixIcon: const Icon(MdiIcons.cameraOutline, color: HenryColors.warmOrange),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          hintText: 'Enter Location',
                        ),
                        onSubmitted: (value) async {
                          hc.isLoading.value = true;
                          final result = await hc.fetchWeather(location: tecLocation.text);
                          if (result!) {
                            hc.weatherList.refresh();
                            hc.isLoading.value = false;
                          }
                          
                        },
                      ),
                    ),
                    Text('JSON FORMAT '),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 7,
                            child: Image.network(
                              // height: MediaQuery.sizeOf(context).height / 5,
                              '${ServiceConstant.weatherImage}${hc.weatherList.first.weather.first.icon}.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 5,
                            child: RichText(
                              text: TextSpan(
                                text: '${hc.weatherList.first.main.temp.toStringAsFixed(0)}°\n',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${hc.weatherList.first.name.capitalizeFirst}\n',
                                  ),
                                  TextSpan(
                                    text: '${hc.weatherList.first.weather.first.description.capitalizeFirst}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // TextSpan(
                                  //   text:
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('XML FORMAT'),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 7,
                            child: Image.network(
                              // height: MediaQuery.sizeOf(context).height / 5,
                              '${ServiceConstant.weatherImage}${hc.weatherList.first.weather.first.icon}.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 5,
                            child: RichText(
                              text: TextSpan(
                                text: '${hc.weatherList.first.main.temp.toStringAsFixed(0)}°\n',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${hc.weatherList.first.name.capitalizeFirst}\n',
                                  ),
                                  TextSpan(
                                    text: '${hc.weatherList.first.weather.first.description.capitalizeFirst}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // TextSpan(
                                  //   text:
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
