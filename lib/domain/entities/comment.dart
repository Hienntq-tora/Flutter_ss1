class Comment {
  const Comment(this.id, this.fullName, this.email, this.avatar,
      this.content, this.rating, this.createdAt);

  final String id;
  final String? fullName;
  final String email;
  final String? avatar;
  final String? content;
  final double? rating;
  final String? createdAt;
}
