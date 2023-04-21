import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:latlong2/latlong.dart';
import 'package:polaris/constants/app_constants.dart';
import 'package:polaris/constants/common_constants.dart';
import 'package:polaris/models/map_marker_model.dart';
import 'package:polaris/models/map_stop_location_model.dart';
import 'package:polaris/pages/pick_plan_page.dart';

class Select {
  final int value;
  final String label;

  Select(this.value, this.label);
}

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  final pageController = PageController();
  bool focusSearch = false;
  int planCurrent = 0;
  int currentStep = 0;
  int lvSelect = 0;
  int selectedIndex = 0;
  List<StopLocation> planPickUp = [];
  List<MapMarker> listOption = [];
  LatLng locationCurrent = AppConstants.myLocation;
  String nameCity = "Ho Chi Minh City";

  List listSelect = [
    Select(1, "Vung Tau"),
    Select(2, "Da Lat"),
    Select(3, "Nha Trang")
  ];

  final list = ["Vung Tau", "Da Lat", "Nha Trang"];

  var currentLocation = AppConstants.myLocation;
  late final MapController mapController;

  void _mapData() {
    planPickUp = lvSelect == 2
        ? listPlan[planCurrent - 1].lowStop ?? []
        : listPlan[planCurrent - 1].highStop ?? [];
    listOption = planPickUp[currentStep - 1].suggestion!;

    selectedIndex = 0;

    _animatedMapMove(planPickUp[currentStep - 1].location!, 12.5, false);
  }

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13.5,
              center: currentLocation,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/chuongquan0802/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
                additionalOptions: const {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              Visibility(
                visible: currentStep == 0,
                child: MarkerLayer(
                  markers: <Marker>[
                    Marker(
                      height: 40,
                      width: 40,
                      point: locationCurrent,
                      builder: (_) {
                        return GestureDetector(
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 500),
                            scale: 1,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: 1,
                              child: SvgPicture.asset(
                                'assets/icons/map_marker.svg',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: currentStep != 0,
                child: MarkerLayer(
                  markers: <Marker>[
                    for (int i = 0; i < listOption.length; i++)
                      Marker(
                        height: 40,
                        width: 40,
                        point:
                            listOption[i].location ?? AppConstants.myLocation,
                        builder: (_) {
                          return GestureDetector(
                            onTap: () {
                              pageController.animateToPage(
                                i,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                              selectedIndex = i;
                              currentLocation = listOption[i].location ??
                                  AppConstants.myLocation;
                              _animatedMapMove(currentLocation, 15, false);
                              setState(() {});
                            },
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 500),
                              scale: selectedIndex == i ? 1 : 0.7,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 500),
                                opacity: selectedIndex == i ? 1 : 0.5,
                                child: SvgPicture.asset(
                                  'assets/icons/map_marker.svg',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              )
            ],
          ),
          Visibility(
            visible: currentStep == 0,
            child: Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: focusSearch ? 100 : null,
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      color: CommonConstants.cWhite,
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  nameCity,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Colors.yellow,
                                  ),
                                ),
                                const Text(
                                  '27 C',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            )),
                        Listener(
                          onPointerDown: ((event) => setState(() {
                                focusSearch = true;
                              })),
                          child: Visibility(
                            visible: nameCity == "Ho Chi Minh City",
                            child: GFSearchBar(
                              searchList: listSelect,
                              searchQueryBuilder: (query, listSelect) {
                                return listSelect
                                    .where((item) => item.label
                                        .toLowerCase()
                                        .contains(query.toLowerCase()))
                                    .toList();
                              },
                              overlaySearchListItemBuilder: (item) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    item.label,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                );
                              },
                              onItemSelected: (item) {
                                setState(() {
                                  planCurrent = item.value;
                                  nameCity = item.label;
                                  focusSearch = false;
                                  locationCurrent =
                                      listPlan[planCurrent - 1].location ??
                                          AppConstants.myLocation;

                                  print('$locationCurrent $planCurrent');

                                  _animatedMapMove(locationCurrent, 12.5, true);
                                });
                              },
                            ),
                          ),
                        ),
                        Visibility(
                            visible: nameCity != "Ho Chi Minh City",
                            child: Column(
                              children: [
                                const Text(
                                  "How often do you want to stop on a road trip?",
                                  style: TextStyle(
                                      color: CommonConstants.cGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(4),
                                      child: GFButton(
                                        onPressed: () => setState(() {
                                          currentStep = 1;
                                          lvSelect = 2;
                                          _mapData();
                                        }),
                                        text: "Low",
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4),
                                      child: GFButton(
                                        onPressed: () => setState(() {
                                          currentStep = 1;
                                          lvSelect = 3;
                                          _mapData();
                                        }),
                                        text: "High",
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ],
                    ))),
          ),
          Visibility(
              visible: currentStep != 0,
              child: Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: MediaQuery.of(context).size.height * 0.56,
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        color: CommonConstants.cWhite,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              currentStep == 1
                                  ? 'Pick first stop'
                                  : currentStep == 2
                                      ? 'Pick 2nd stop'
                                      : currentStep == 3
                                          ? 'Pick 3rd stop'
                                          : 'Pick `${currentStep}th` stop',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Expanded(
                            child: PageView.builder(
                              controller: pageController,
                              onPageChanged: (value) {
                                selectedIndex = value;
                                currentLocation = listOption[value].location ??
                                    AppConstants.myLocation;
                                _animatedMapMove(currentLocation, 14, false);
                                setState(() {});
                              },
                              itemCount: listOption.length,
                              itemBuilder: (_, index) {
                                final item = listOption[index];
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: CommonConstants.cGrey2,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: item.rating,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item.title ?? '',
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      item.address ?? '',
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    GFButton(
                                                      onPressed: () {},
                                                      text: "primary",
                                                      type:
                                                          GFButtonType.outline,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                item.image ?? '',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: GFButton(
                                onPressed: () => setState(() {
                                      currentStep++;
                                      _mapData();
                                    }),
                                text: currentStep != planPickUp.length
                                    ? "Next"
                                    : "Finish",
                                blockButton: true,
                                size: GFSize.LARGE),
                          ),
                        ],
                      )))),
        ],
      ),
    );
  }

  void _animatedMapMove(LatLng destLocation, double destZoom, bool onSelect) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: mapController.center.latitude,
        end: onSelect ? destLocation.latitude : destLocation.latitude - 0.015);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    var controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}
