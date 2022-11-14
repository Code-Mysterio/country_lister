import 'package:carousel_slider/carousel_slider.dart';

import 'package:country_lister/models/CountriesModel.dart';
import 'package:country_lister/utils/custom_widget/detail_text.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.e}) : super(key: key);
  final CountriesModel e;
  final CarouselController carouselController = CarouselController();

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
              // width: MediaQuery.of(context).size.width,
              // height: 350.0,
              children: [
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  child: Stack(
                    children: [
                      CarouselSlider(
                          carouselController: carouselController,
                          items: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(e.flags!.png.toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      e.coatOfArms!.png.toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            height: 300.0,
                            viewportFraction: 1,
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            // Use the controller to change the current page
                            carouselController.previousPage();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            // Use the controller to change the current page
                            carouselController.nextPage();
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
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
