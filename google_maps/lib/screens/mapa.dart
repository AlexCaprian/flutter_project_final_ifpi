import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-5.0221689,-42.8167555);

  Set<Marker> _marcadores = {};
  _carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};
    Marker marcadoIfpi = const Marker(
      markerId: MarkerId('IFPI'),
      position: LatLng(-5.088544046019581, -42.81123803149089),
      infoWindow: InfoWindow(title: 'Ifpi Central')
    );
    Marker marcadoAtacadao = const Marker(
      markerId: MarkerId('ParoquiaSantaJoanaDarc'),
      position: LatLng(-5.0273588,-42.8093207),
      infoWindow: InfoWindow(title: 'Paróquia Santa Joana Darc')
    );
    Marker marcadoIfpiSul = const Marker(
      markerId: MarkerId('IFPISUl'),
      position: LatLng(-5.101723, -42.813114),
      infoWindow: InfoWindow(title: 'Ifpi Sul')
    );
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mapa'),
          backgroundColor: Colors.green,
        ),
        body: GoogleMap(
          myLocationButtonEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15,
          ),
          markers: _marcadores,
        ),
      ),
    );
  }
}