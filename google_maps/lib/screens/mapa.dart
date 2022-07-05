import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../controllers/controller_lat_long.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;

  Set<Marker> _marcadores = {};
  _carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};
    Marker marcadoIfpi = const Marker(
        markerId: MarkerId('IFPI'),
        position: LatLng(-5.088544046019581, -42.81123803149089),
        infoWindow: InfoWindow(title: 'Ifpi Central'));
    Marker marcadoAtacadao = const Marker(
        markerId: MarkerId('ParoquiaSantaJoanaDarc'),
        position: LatLng(-5.0273588, -42.8093207),
        infoWindow: InfoWindow(title: 'Paróquia Santa Joana Darc'));
    Marker marcadoIfpiSul = const Marker(
        markerId: MarkerId('IFPISUl'),
        position: LatLng(-5.101723, -42.813114),
        infoWindow: InfoWindow(title: 'Ifpi Sul'));
    marcadoresLocal.add(marcadoIfpiSul);
    marcadoresLocal.add(marcadoIfpi);
    marcadoresLocal.add(marcadoAtacadao);
    setState(() {
      _marcadores = marcadoresLocal;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _carregarMarcadores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mapa'),
          backgroundColor: Colors.green,
        ),
        body: ChangeNotifierProvider<Controller>(
          create: (context) => Controller(),
          child: Builder(builder: (context) {
            final local = context.watch<Controller>();
            return GoogleMap(
              initialCameraPosition: CameraPosition(
              target: LatLng(local.lat, local.long),
              zoom: 18,
            ),
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            markers: _marcadores,
            );
          }),
        ),
    );
  }
}
