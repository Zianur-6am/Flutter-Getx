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
}


enum InnerTabItem {All, Home, Extra, Selection, Done}

extension InnerTabItemExtension on InnerTabItem {
  String get title {
    switch (this) {
      case InnerTabItem.All:
        return 'All';
      case InnerTabItem.Home:
        return 'Home';
      case InnerTabItem.Extra:
        return 'Extra';
      case InnerTabItem.Selection:
        return 'Selection';
      case InnerTabItem.Done:
        return 'Done';
    }
  }
}
