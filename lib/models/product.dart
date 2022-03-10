import 'Rating.dart';

class Product {
    String description;
    num id;
    String image;
    String category;
    num price;
    Rating? rating;
    String title;

    Product({
        required this.description,
        required this.category,
        required this.id,
        required this.image,
        required this.price,
        required this.rating,
        required this.title});

    // factory Product.fromJson(Map<String, dynamic> json) {
    //     return Product(
    //         category: json['category'],
    //         description: json['description'],
    //         id: json['id'],
    //         image: json['image'],
    //         price: json['price'],
    //         rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    //         title: json['title'],
    //     );
    // }

    factory Product.fromJson(Map<String, dynamic>json) => Product(
        category: json['category'],
                description: json['description'],
                id: json['id'],
                image: json['image'],
                price: json['price'],
                rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
                title: json['title'],);

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['category'] = this.category;
        data['description'] = this.description;
        data['id'] = this.id;
        data['image'] = this.image;
        data['price'] = this.price;
        data['title'] = this.title;
        if (this.rating != null) {
            data['rating'] = this.rating!.toJson();
        }
        return data;
    }

    
}