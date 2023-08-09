class Student {
  String id, email, password, name;
  int age, phone;

  Student({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.age,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': name,
      'phone': phone,
      'email': email,
      'password': password,
      'age': age,
    };
  }

  factory Student.formMap(Map<String, dynamic> data){
    return Student(
        id: data['id'] as String,
        email:data ['name'] as String,
        password:data ['password'] as String,
        name:data ['firstname'] as String,
        age: data['age'] as int,
        phone: data['phone'] as int,
    );
  }
}
