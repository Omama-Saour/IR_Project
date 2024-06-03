import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_web_app/more_text.dart';
import 'package:my_web_app/search_controller.dart';

class HomeScreen extends StatelessWidget {
  final MySearchController _searchController = Get.put(MySearchController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Text('Search App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Search engine',
                    textStyle: const TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 41, 22, 128),
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 100,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    children: [
                      Obx(() => DropdownButton<String>(
                          value: _searchController.selectDataSet.value.isEmpty
                              ? null
                              : _searchController.selectDataSet.value,
                          // ignore: prefer_const_literals_to_create_immutables
                          items: [
                            const DropdownMenuItem(
                                value: 'antique-collection.csv',
                                child: Text('antique collection ')),
                            const DropdownMenuItem(
                                value: 'recreation-collection.csv',
                                child: Text('recreation collection ')),
                          ],
                          hint: const Text('select data '),
                          onChanged: (value) {
                            if (value == 'antique-collection.csv') {
                              _searchController.selectModelDataSet.value =
                                  'tfidf_matrix.bin';
                              _searchController.selectTFDataSet.value =
                                  'model.pkl';
                            } else {
                                _searchController.selectModelDataSet.value =
                                  'tfidf_matrix.bin';
                              _searchController.selectTFDataSet.value =
                                  'model.pkl'; 
                            }
                            _searchController.selectDataSet(value!);
                          })),
                      const SizedBox(width: 10),
                      SizedBox(
                        // height: 100,
                        width: 1000,
                        child: TextField(
                          onChanged: (value) =>
                              _searchController.query.value = value,
                          decoration: InputDecoration(
                            hintText: 'Enter query',
                            fillColor: Color(0xFFF8F3E3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              //  borderSide: BorderSide.,
                            ),
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _searchController.search,
                        child: const Text('Search'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(() {
                if (_searchController.isLoading.value) {
                  return const CircularProgressIndicator();
                }
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: _searchController.results.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 500,
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(_searchController.results[index]
                                      .split('')
                                      .sublist(0, 7)
                                      .join('')),
                                ),
                                InkWell(
                                  onTap: () => Get.to(() => MoreScreen(
                                        tex: _searchController.results[index],
                                      )),
                                  child: const Text(
                                    "show more",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
