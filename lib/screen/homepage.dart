import 'package:country_lister/models/CountriesModel.dart';
import 'package:country_lister/screen/details_screen.dart';
import 'package:country_lister/utils/const/provider_dart.dart';
import 'package:country_lister/utils/const/theme_provider.dart';
import 'package:country_lister/utils/custom_widget/button_on_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(countriesDataProvider);
    final themeMode = ref.watch(themeModeProvider);
    TextEditingController editingController = TextEditingController();

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                    onPressed: () {
                      ref.read(themeModeProvider.notifier).state =
                          themeMode == ThemeMode.dark
                              ? ThemeMode.light
                              : ThemeMode.dark;
                    },
                    icon: Icon(themeMode == ThemeMode.dark
                        ? Icons.wb_sunny
                        : Icons.wb_sunny_outlined))
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) {},
              controller: editingController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).primaryColor,
                hintText: 'Search Country',
                hintStyle: const TextStyle(
                  fontFamily: 'Axiforma',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
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
                  onTap: () {},
                  icons: Icons.language_outlined,
                  data: 'EN',
                ),
                ButtonOnHomePage(
                  icons: Icons.filter_alt_outlined,
                  data: 'Filter',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Expanded(
              child: data.when(
                data: (data) {
                  List<CountriesModel> countriesList =
                      data.map((e) => e).toList();
                  var country = countriesList;
                  country.sort((a, b) => a.name!.official
                      .toString()
                      .compareTo(b.name!.official.toString()));
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(e: countriesList[index])));
                          },
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
                          title: Text(
                              countriesList[index].name!.official.toString()),
                        );
                      });
                },
                error: (error, _) => Text(error.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

//
// return GroupedListView(
// shrinkWrap: true,
// elements: snapshot.data!,
// groupBy: (element) => element.name!.common![0],
// groupComparator: (value1, value2) => value2.compareTo(value1),
// order: GroupedListOrder.DESC,
// groupSeparatorBuilder: (String value) => Text(
// value,
// textAlign: TextAlign.left,
// style: TextStyle(
