class NewsTileModel {
  final String source;
  final String imageURL;
  final String url;
  final String title;
  final String description;
  final String publishedAt;

  NewsTileModel(
      {this.imageURL,
        this.url,
        this.title,
        this.description,
        this.publishedAt,
        this.source});
}
