import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../theme/theme.dart';
import 'station_detail.dart';
import 'package:latlong2/latlong.dart';
class MapContent extends StatelessWidget {
  const MapContent({super.key});

  void onTapStation(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StationDetail()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.priBackground,
        title: Row(
          children: [
            Icon(Icons.person, color: AppColors.label, size: 35,),
            const SizedBox(width: 15),
            Text("Map Station", style: AppTextStyles.title.copyWith(color: AppColors.label, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(11.5564, 104.9282),
              initialZoom: 13,
            ),

            children: [
              TileLayer(
                urlTemplate:
                    "https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    // point: LatLng(11.6530569, 104.9068069),
                    point: LatLng(11.575989, 104.922442),
                    width: 50,
                    height: 100,
                    child: GestureDetector(
                      onTap: () => onTapStation(context),
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              border: Border.all(
                                color: AppColors.label, // border color
                                width: 2,
                              ),
                            ),
                            child: Text(
                              "30",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.label,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: AppColors.label,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Find a Station",
                hintStyle: AppTextStyles.body.copyWith(color: AppColors.disabled),
                contentPadding: EdgeInsets.all(10),
                prefixIcon: const Icon(Icons.search, size: 30,),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 60,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
                ),
              ), 
            ),
          )
        ],
      ),
    );
  }
}