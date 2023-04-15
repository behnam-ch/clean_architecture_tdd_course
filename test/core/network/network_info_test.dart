import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:clean_architecture_tdd_course/core/network/network_info.dart';
import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DataConnectionChecker>()])
void main() {
  late final MockDataConnectionChecker mockDataConnectionChecker;
  late final NetworkInfoImpl networkInfo;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        // arrange
        final tHasConnectionFuture = Future.value(true);

        when(mockDataConnectionChecker.hasConnection)
            .thenAnswer((_) => tHasConnectionFuture);
        // act
        final result = networkInfo.isConnected;
        // assert
        verify(mockDataConnectionChecker.hasConnection);
        expect(result, tHasConnectionFuture);
      },
    );
  });
}
