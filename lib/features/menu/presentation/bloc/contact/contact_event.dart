part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();
}

class InitContacts extends ContactEvent{
  @override
  List<Object?> get props => [];

}
