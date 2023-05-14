import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/error_messages.dart';
import '../../../domain/entities/contact.dart';
import '../../../domain/use_cases/get_contacts_use_case.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {

  final GetContacts _getContacts;

  ContactBloc(this._getContacts) : super(ContactInitial()) {

    on<InitContacts>((event, emit) async {
      emit(ContactLoading());
      final failureOrContacts =  await _getContacts();
      emit(failureOrContacts.fold(
              (failure) => ContactError(message: ErrorMessages.mapFailureToMessage(failure)),
              (contacts)  => ContactLoaded(contacts: contacts)
      ));
    });
  }
}
