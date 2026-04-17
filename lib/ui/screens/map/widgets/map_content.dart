import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import '../../../../utils/async_value.dart';
import '../../../theme/theme.dart';
import '../view_model.dart/map_view_model.dart';
import '../view_model.dart/station_item_data.dart';
import 'station_detail.dart';
import 'package:latlong2/latlong.dart';

class MapContent extends StatelessWidget {
  final MapViewModel mapViewModel;
  const MapContent({super.key, required this.mapViewModel});

  @override
  Widget build(BuildContext context) {
    void onTapStation(StationItemData station){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<MapViewModel>.value(
            value: mapViewModel,
            child: StationDetail(station: station),
            ),
        )
      );
    }

    AsyncValue<List<StationItemData>> asyncValue = mapViewModel.data;

    Widget content;
    switch (asyncValue.state) {
      case AsyncValueState.loading:
        content = Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = Center(child: Text('error = ${asyncValue.error!}', style: TextStyle(color: Colors.red),));
        break;
      case AsyncValueState.success:
        List<StationItemData> data = asyncValue.data!;
        content = Stack(
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
                  ...data.map((station) => markerLocation(
                    onTapStation: (station) => onTapStation(station), 
                    station: station)
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Search(stations: data, onTapStation: onTapStation),
          )
        ],
      );
    }
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
      body: content,
    );
  }
}

class Search extends StatefulWidget {
  final List<StationItemData> stations;
  final ValueChanged<StationItemData> onTapStation;
  const Search({
    super.key, 
    required this.stations, 
    required this.onTapStation,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<StationItemData> result = [];
  void onTyping(String value){
    setState(() {
      result = value.isEmpty ? 
        [] 
        : 
        widget.stations.where((station) => station.station.name.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          onChanged: onTyping,
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
        const SizedBox(height: 5),
        if (result.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: result.length,
            itemBuilder: (context, index) {
              Color availableColor = result[index].availableBikes == 0 ? Colors.red : AppColors.label;
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () => widget.onTapStation(result[index]),
                  title: Text(result[index].station.name, style: AppTextStyles.body.copyWith(color: availableColor),),
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.priBackground,
                    child: Text(
                      result[index].availableBikes.toString(),
                      style: AppTextStyles.label.copyWith(color: availableColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

Marker markerLocation({
  required ValueChanged<StationItemData> onTapStation,
  required StationItemData station,
}) {
  Color availableBikeColor = station.availableBikes == 0 ? Colors.red : AppColors.label;
  return Marker(
    point: LatLng(station.coordinate.latitude, station.coordinate.longitude),
    width: 50,
    height: 100,
    child: GestureDetector(
      onTap: () => onTapStation(station),
      child: Column(
        children: [
          Container(
            width: 50,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              border: Border.all(
                color: availableBikeColor,
                width: 2,
              ),
            ),
            child: Text(
              station.availableBikes.toString(),
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(
                fontWeight: FontWeight.bold,
                color: availableBikeColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: availableBikeColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
          ),
        ],
      ),
    ),
  );
}