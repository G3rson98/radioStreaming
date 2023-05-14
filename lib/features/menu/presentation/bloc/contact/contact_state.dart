part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();
}

class ContactInitial extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactLoading extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactLoaded extends ContactState {

  final List<Contact> contacts;

  const ContactLoaded({this.contacts = const []});

  @override
  List<Object> get props => [contacts];
}

class ContactError extends ContactState {

  final String message;

  const ContactError({required this.message});

  @override
  List<Object> get props => [message];
}