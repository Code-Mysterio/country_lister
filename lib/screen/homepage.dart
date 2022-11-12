import 'package:country_lister/models/CountriesModel.dart';
import 'package:country_lister/utils/const/provider_dart.dart';
import 'package:country_lister/utils/custom_widget/button_on_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(countriesDataProvider);
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore.',
                  style: TextStyle(
                      fontFamily: 'ElsieSwashCaps',
                  fontSize: 35.0,
                  fontWeight: FontWeight.w900),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.wb_sunny_outlined))
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onTap: () {},
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                hintText: 'Search Country',
                hintStyle: TextStyle(
                  fontFamily: 'Axiforma',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonOnHomePage(
                  onTap: () {
                    print('Im tapped');
                  },
                  icons: Icons.language_outlined,
                  data: 'EN',
                ),
                ButtonOnHomePage(
                  icons: Icons.filter_alt_outlined,
                  data: 'Filter',
                  onTap: () {
                    print('Im tapped');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Expanded(
              child: _data.when(
                data: (data) {
                  List<CountriesModel> countriesList =
                      data.map((e) => e).toList();
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                    return ListTile(
                      leading: Container(
                        height: 35,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(countriesList[index]
                                    .flags!
                                    .png
                                    .toString()))),
                      ),
                      title:
                          Text(countriesList[index].name!.official.toString()),
                    );
                  });
                },
                error: (error, s) => Text(error.toString()),
                loading: () => const Center(
                  child: LinearProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
