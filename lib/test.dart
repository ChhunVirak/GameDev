void main() {
  String firstName = 'Tola';
  String lastName = 'Srun';

  String fullName = getFullName(firstName, lastName);

  print('FirstName: $firstName'); //Tola
  print('LastName: $lastName'); // Srun
  print('fullName: $fullName'); // Srun Tola
}

String getFullName(String firstName, String lastName) {
  return '$lastName $firstName';
}
