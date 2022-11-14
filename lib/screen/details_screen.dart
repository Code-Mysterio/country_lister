import 'package:country_lister/models/CountriesModel.dart';
import 'package:country_lister/utils/custom_widget/detail_text.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.e}) : super(key: key);
  final CountriesModel e;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            e.name!.official.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).hoverColor),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).hoverColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        e.flags!.png.toString(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DetailText(
                    data: 'Common Name : ',
                    detailsData: e.name!.official.toString()),
                DetailText(
                    data: 'Capital: ', detailsData: e.capital![0].toString()),
                DetailText(
                    data: 'Population: ', detailsData: e.population.toString()),
                DetailText(
                    data: 'Currency: ', detailsData: e.currencies!.toString()),
                const SizedBox(
                  height: 15.0,
                ),
                DetailText(
                    data: 'Independence: ',
                    detailsData: e.independent.toString()),
                DetailText(
                    data: 'Sub Region: ', detailsData: e.subregion.toString()),
                DetailText(data: 'Region: ', detailsData: e.region.toString()),
                DetailText(
                    data: 'Continents: ',
                    detailsData: e.continents![0].toString()),
                const SizedBox(
                  height: 15.0,
                ),
                DetailText(
                  data: 'Dail Code: ',
                  detailsData: e.idd!.suffixes![0].toString(),
                ),
                DetailText(
                    data: 'Week Start: ',
                    detailsData: e.startOfWeek.toString()),
                DetailText(
                    data: 'Time Zone: ', detailsData: e.timezones.toString()),
                DetailText(
                    data: 'Driver Side: ', detailsData: e.car!.side.toString()),
                const SizedBox(
                  height: 15.0,
                ),
                DetailText(
                  data: 'UN Member: ',
                  detailsData: e.unMember.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
