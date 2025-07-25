// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ground {
  final int id;
  final String name;
  final String location;
  final String type;
  final String imgUrl;
  final List<String> availableSlots;
  final String description;

  Ground({
    required this.id,
    required this.name,
    required this.location,
    required this.type,
    required this.imgUrl,
    required this.availableSlots,
    required this.description,
  });
}
