class Review {
  final String customerName;
  final String image;
  final String date;
  final double rating;
  final String message;

  Review({
    required this.customerName,
    required this.image,
    required this.date,
    required this.rating,
    required this.message,
  });

  // fromJson factory constructor
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      customerName: json['customerName'],
      image: json['image'],
      date: json['date'],
      rating: (json['rating'] as num).toDouble(),
      message: json['message'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'image': image,
      'date': date,
      'rating': rating,
      'message': message,
    };
  }
}

final List<Review> dummyReviews = [
  Review(
    customerName: "Alice",
    image: "assets/images/alice.png",
    date: "2025-09-01",
    rating: 4.5,
    message: "Excellent product!",
  ),
  Review(
    customerName: "Bob",
    image: "assets/images/bob.png",
    date: "2025-09-02",
    rating: 4.0,
    message: "Very useful.",
  ),
  Review(
    customerName: "Charlie",
    image: "assets/images/charlie.png",
    date: "2025-09-03",
    rating: 5.0,
    message: "Highly recommended.",
  ),
  Review(
    customerName: "Diana",
    image: "assets/images/diana.png",
    date: "2025-09-04",
    rating: 3.5,
    message: "Good but can be improved.",
  ),
  Review(
    customerName: "Ethan",
    image: "assets/images/ethan.png",
    date: "2025-09-05",
    rating: 4.8,
    message: "Love it!",
  ),
];
