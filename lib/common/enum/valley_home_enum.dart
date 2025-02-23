enum OuterTabItem {Explore, Sports, Womens, Kids, Wigs, Electronics}

extension TabItemExtension on OuterTabItem {
  String get title {
    switch (this) {
      case OuterTabItem.Explore:
        return 'Explore';
      case OuterTabItem.Sports:
        return 'Sports';
      case OuterTabItem.Womens:
        return 'Womens';
      case OuterTabItem.Kids:
        return 'Kids';
      case OuterTabItem.Wigs:
        return 'Wigs';
      case OuterTabItem.Electronics:
        return 'Electronics';
    }
  }

  String get name {
    return OuterTabItem.Explore.toString();
  }
}


enum InnerTabItem {New, Discount, Top, Popular, Deals}

extension InnerTabItemExtension on InnerTabItem {
  String get title {
    switch (this) {
      case InnerTabItem.New:
        return 'New Arrivals';
      case InnerTabItem.Discount:
        return 'Discounted Products';
      case InnerTabItem.Top:
        return 'Top Products';
      case InnerTabItem.Popular:
        return 'Popular Products';
      case InnerTabItem.Deals:
        return 'Best Deals';
    }
  }
}
