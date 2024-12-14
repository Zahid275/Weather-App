// import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          title: const Text("Weather App"),
          backgroundColor: Colors.blue.shade300,
        ),
        body: GetBuilder<WeatherController>(
            init: WeatherController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.all(10),
                          child: TextField(
                            onChanged: (value) {
                              controller.search(value);
                            },
                            decoration: InputDecoration(
                              hintText: "Location",
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1.5),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        FutureBuilder(
                            future: controller.getWeather(controller.City),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                size: 35,
                                              ),
                                              Text(
                                                "${controller.weather.location!.name}",
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Text(
                                                "${controller.weather.location!.country}",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            padding: const EdgeInsets.all(20),
                                            width: double.infinity,
                                            height: 180,
                                            decoration: BoxDecoration(
                                                color: Colors.blue.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 5,
                                                    spreadRadius: 1,
                                                  ),
                                                ]),
                                            child: Row(
                                              children: [
                                                Image.network(
                                                  "https:${controller.weather.current!.condition!.icon}",
                                                  scale: 0.4,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${controller.weather.current!.tempC}°C",
                                                      style: const TextStyle(
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                        "${controller.weather.current!.condition!.text}",
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.blueGrey,
                                                        )),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                        DateFormat("MMMM-mm-yyyy").format(controller.dateTimeFunction()),
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Colors.blueGrey,
                                                        )),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                        DateFormat("hh:mma").format(controller.dateTimeFunction()),
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Colors.blueGrey,
                                                        )),
                                                  ],
                                                )
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            padding: const EdgeInsets.only(top: 30),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Colors.blue.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            height: 300,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Text(
                                                      "Country",
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                    Text(
                                                      "${controller.weather.location!.country}",
                                                      style: const TextStyle(
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Text(
                                                      "City",
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                    Text(
                                                      "${controller.weather.location!.name}",
                                                      style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Text(
                                                      "Region",
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                    Text(
                                                      "${controller.weather.location!.region}",
                                                      style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Text(
                                                      "Temperature",
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                    Text(
                                                      "${controller.weather.current!.tempC}",
                                                      style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Text(
                                                      "Humidity",
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                    Text(
                                                      "${controller.weather.current!.humidity}",
                                                      style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    const Text(
                                                      "Wind Speed",
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                    Text(
                                                      "${controller.weather.current!.windKph} Kph",
                                                      style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            })
                      ]),
                ),
              );
            }));
  }
}
