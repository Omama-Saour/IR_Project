import 'package:get/get.dart';
import 'package:dio/dio.dart';

class MySearchController extends GetxController {
  var query = ''.obs;
  var results = <String>[].obs;
  var isLoading = false.obs;
  var selectDataSet = ''.obs;
   var selectModelDataSet = ''.obs;
    var selectTFDataSet = ''.obs;
  var loadquery= ''.obs;

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout:  const Duration(milliseconds: 50000)
      , receiveTimeout: const Duration(milliseconds: 30000)
    )
  );
  final url = 'http://localhost:8000/matching-ranking';
  void search() async {
    
    if (query.isEmpty) return;
    isLoading.value = true;
    try {
      final response = await _dio.post(
        url, // Adjust the URL based on your backend server
        data: {
          'csv_file_name': selectDataSet.value, // Provide the actual path or name
          'tfidf_matrix_file': selectTFDataSet.value, // Provide the actual path or name
          'model_file': selectModelDataSet.value, // Provide the actual path or name
          'query': query.value,
        },
      );
      if (response.statusCode == 200) {
        // Handle the response data
        results.value = List<String>.from(response.data['ranked_document_strings']);
      } else {
        // Handle non-200 status codes
        Get.snackbar('Error', 'Failed to fetch data');
      }
    // ignore: deprecated_member_use
    } on DioError catch (e) {
      // Handle DioError specifically
      if (e.response != null) {
        // Server responded with an error
        Get.snackbar('Error', 'Server error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      } else {
        // Error sending the request
        Get.snackbar('Error', 'Request error: ${e.message}');
      }
    } catch (e) {
      // Handle any other errors
      Get.snackbar('Error', 'Unexpected error: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
void updateQuery(String newQuery) async{
    query.value = newQuery;

   try {
      final response = await _dio.post(
        'http://localhost:8000/refiend_queries', // Adjust the URL based on your backend server
        data: {
          'query': query.value,
        },
      );
      if (response.statusCode == 200) {
        print(response);
        results.value =
            List<String>.from(response.data['refined_queries']);
      } else {
        Get.snackbar('Error', 'Failed to fetch data');
      }
    } catch (e) {
      
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }


}
