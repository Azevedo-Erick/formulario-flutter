// ignore_for_file: unnecessary_getters_setters

class FormPageBloc {
  String _nome = "";
  String _email = "";
  String _senha = "";

  String get nome => _nome;
  String get email => _email;
  String get senha => _senha;

  set nome(String value) => _nome = value;
  set email(String value) => _email = value;
  set senha(String value) => _senha = value;

  String? validateNome(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'O campo não pode ser vazio';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'O campo não pode ser vazio';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Insira um email válido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'O campo não pode ser vazio';
    }
    if (value.length < 8) {
      return 'Insira pelo menos 8 caracteres';
    }
    return null;
  }
}
