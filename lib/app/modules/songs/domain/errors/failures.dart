import 'package:tunefy/app/core/domain/errors/failures.dart';

class EmptyTextFailure extends Failure {
  final String msg;

  const EmptyTextFailure([
    this.msg = "Digite algo para começar a sua busca",
  ]) : super(msg);

  @override
  List<Object?> get props => [message];
}
