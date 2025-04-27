import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/functions/my_toast.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/features/cards/domain/use_cases/delete_card_use_case.dart';
import 'package:graduation_project/features/cards/domain/use_cases/get_cards_use_case.dart';
import 'package:logger/logger.dart';

import '../../../../home/domain/entities/product_entity.dart';
import '../../../domain/use_cases/add_to_card_use_case.dart';

part 'add_to_card_state.dart';

class AddToCardCubit extends Cubit<AddToCardStates> {
  AddToCardCubit( {required AddToCardUseCase addToCardUseCase,
    required GetCardsUseCase getCardsUseCase,
    required DeleteCardUseCase deleteCardUseCase,
  })
      : _addToCardUseCase = addToCardUseCase,
        _getCardsUseCase = getCardsUseCase,
        _deleteCardUseCase = deleteCardUseCase,
        super(AddToCardInitial());
  final AddToCardUseCase _addToCardUseCase;
  final GetCardsUseCase _getCardsUseCase ;
  final DeleteCardUseCase _deleteCardUseCase ;
  Map<String, int> productsCards = {};
  Map<String, ProductEntity> selectedCards = {};

  Future<void> updateCart({required ProductEntity model, bool isAdd = true}) async {
    final productId = model.id;
    final type = model.type;
    final key = '$productId$type';

    // Try updating the UI first
    final canUpdate = isAdd ? incrementCardUI(model) : decrementFromCardUI(model);

    // If cannot update, stop here
    if (!canUpdate) return;

    // Proceed to API call
    emit(AddToCardLoading());

    final result = await _addToCardUseCase(
      productId: productId,
      type: type,
      quantity: productsCards[key] ?? 1,
    );

    result.fold(
          (failure) {
        // Rollback UI change if API failed
        isAdd ? decrementFromCardUI(model) : incrementCardUI(model);

        myToast(msg: failure.errorMessage, state: ToastStates.error);
        emit(AddToCardError(failure.errorMessage));
      },
          (cards) {
        Logger().i('success');
        // optionally emit success state here
      },
    );
  }

  bool incrementCardUI(ProductEntity model) {
    final productId = model.id;
    final type = model.type;
    final key = '$productId$type';

    // If already at max quantity, stop
    if ((productsCards[key] ?? 0) >= model.quantity) {
      myToast(msg: AppStrings.maxQuantity, state: ToastStates.normal);
      return false;
    }

    // Otherwise, increment
    productsCards[key] = (productsCards[key] ?? 0) + 1;
    selectedCards[key] = model;

    return true;
  }

  bool decrementFromCardUI(ProductEntity model) {
    final productId = model.id;
    final type = model.type;
    final key = '$productId$type';

    if (productsCards[key] == 1) return false; // false means "stop"

    productsCards[key] = (productsCards[key] ?? 0) - 1;



    return true; // true means "continue"
  }
  Future<void> getCards() async {

    final result = await _getCardsUseCase.call();
    result.fold((failure) {
      emit(GetCardError(failure.errorMessage));
    }, (cards) {
      selectedCards = {
        for (var card in cards) '${card.id}${card.type}': card
      };
      productsCards = {
        for (var card in cards) '${card.id}${card.type}': card.quantity
      };
      emit(GetCardSuccess(cards));
    });
  }
  Future<void> deleteCard(ProductEntity model) async {
    final productId = model.id;
    final type = model.type;
    final key = '$productId$type';
    final quantity = productsCards[key]??1 ;
    deleteCardFromUi(model);
    emit(AddToCardLoading());
    final result = await _deleteCardUseCase(
      productId: productId,
      type: type,
    );
    result.fold(
      (failure) {
        addDeletedItemToUi(model, quantity);
        myToast(msg: failure.errorMessage, state: ToastStates.error);
        emit(AddToCardError(failure.errorMessage));
      },
      (cards) {
        Logger().i('success');

      },
    );
  }
  void  addDeletedItemToUi(ProductEntity model,int quantity) {
    final productId = model.id;
    final type = model.type;
    final key = '$productId$type';
    productsCards[key] = (productsCards[key] ?? 0) + quantity;
    selectedCards[key] = model;
  }
  void deleteCardFromUi(ProductEntity model) {
    final productId = model.id;
    final type = model.type;
    final key = '$productId$type';
    productsCards.remove(key);
    selectedCards.remove(key);
  }
  int get cardsCount {
    return selectedCards.length;
  }
}
