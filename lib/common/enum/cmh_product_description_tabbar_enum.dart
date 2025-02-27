enum ProductDescriptionTab {
  description,
  reviews,
  assurance,
  store,
  similar;

  String get label {
    switch (this) {
      case ProductDescriptionTab.description:
        return 'Description';
      case ProductDescriptionTab.reviews:
        return 'Reviews';
      case ProductDescriptionTab.assurance:
        return 'Assurance';
      case ProductDescriptionTab.store:
        return 'Store Details';
      case ProductDescriptionTab.similar:
        return 'Similar Products';
    }
  }
}