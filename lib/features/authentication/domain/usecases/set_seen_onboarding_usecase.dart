import 'package:talent_insider/features/authentication/domain/repositories/user_data_store_repository.dart';

class SetSeenOnboardingUseCase {
  final UserDataStoreRepository repository;

  SetSeenOnboardingUseCase(this.repository);

  Future<void> call(bool value) async {
    await repository.setSeenOnboarding(value);
  }
}
