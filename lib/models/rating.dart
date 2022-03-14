class Rating {
    int count;
    num rate;

    Rating({required this.count, required this.rate});

    factory Rating.fromJson(Map<String, dynamic> json) {
        return Rating(
            count: json['count'], 
            rate: json['rate'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        data['rate'] = this.rate;
        return data;
    }
}