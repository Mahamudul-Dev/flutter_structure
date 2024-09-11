class RegistrationFormModel {
  final String name;
  final String email;
  final String password;
  final String role;

  RegistrationFormModel(this.name, this.email, this.password, this.role);


  toJson()=> {
    'name': name,
    'email': email,
    'password': password,
    'role': role
  };
}