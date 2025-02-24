import 'package:ewa_store/utils/constants/api_constants.dart';
import 'package:ewa_store/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  final List address;
  

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.address,
  });

  String get fullName => "$firstName $lastName";

  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullname) => fullname.split(" ");

  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "ewa_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
        id: "",
        firstName: "",
        lastName: "",
        username: "",
        email: "",
        phoneNumber: "",
        profilePicture: "",
        address: [],
      );

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "username": username,
      "email": email,
      "phone": phoneNumber,
      "profilePicture": profilePicture,
    };
  }

  factory UserModel.fromJson(
      Map<String, dynamic> data) {
    if (data.isNotEmpty) {
      String originalImageUrl = data['profilePicture'] ?? '';
    String newImageBaseUrl = '$tempURL/image/users/';

    // Extract the filename from the original image URL if present
    String imageFilename = originalImageUrl.split('/').last;

    String updatedImageUrl = imageFilename.isNotEmpty
        ? '$newImageBaseUrl$imageFilename'
        : originalImageUrl;
      return UserModel(
        id: data["_id"] ?? "",
        firstName: data["firstName"] ?? "",
        lastName: data["lastName"] ?? "",
        username: data["username"] ?? "",
        email: data["email"] ?? "",
        phoneNumber: data["phone"] ?? "",
        profilePicture: updatedImageUrl,
        address: data["address"] ?? [],
      );
    } else {
      return UserModel.empty();
    }
  }
}
