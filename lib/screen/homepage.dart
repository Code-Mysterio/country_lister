import 'package:country_lister/models/CountriesModel.dart';
import 'package:country_lister/utils/const/provider_dart.dart';
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
                Text(
                  'Explore.',
                  style: TextStyle(fontSize: 24.0),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.wb_sunny_outlined))
              ],
            ),
            SizedBox(
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('Im tapped');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(color: Colors.black12, width: 1.2),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Material(
                          color: Colors.transparent,
                          child: Icon(
                            Icons.language_outlined,
                            color: Colors.black87,
                            size: 30.0,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'EN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Axiforma',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
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
                  return ListView.builder(itemBuilder: (_, index) {
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
                      title: Text(
                          countriesList[index].name!.official.toString()),
                    );
                  });
                },
                error: (error, s) => Text(error.toString()),
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
