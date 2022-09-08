import 'repository.dart';
import 'database/database.dart';
import 'result.dart';

class ResultService {

  final Repository _repository = Repository();

  saveResult(Result result) async {
  var output =
  await _repository.insertData('skills', result.resultMap());  return result;
  }

  readResult() async {
  var outp = await _repository.readData('skills');
  print('========');
  print(outp);
  print('========');
  return outp;
  }

  deleteResult(Id) async {
    return await _repository.deleteData('skills', Id);
  }

  deleteAllResult()async{
    return await _repository.deleteAllData('skills');

  }

  }