class UserEntity {
  final int id;
  final String name;
  final String email;
  final String image;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
  });

  factory UserEntity.loading() => const UserEntity(
        id: 0,
        name: 'test name',
        email: 'test email',
        image:''
      );
}
