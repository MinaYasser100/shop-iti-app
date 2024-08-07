class OnboardingContent {
  final String image;
  final String title;
  final String discription;

  const OnboardingContent({
    required this.image,
    required this.title,
    required this.discription,
  });

  static const all = [
    OnboardingContent(
      title: "Shopping Online",
      image: 'assets/anim/woman.jpg',
      discription:
          "Shop the latest trends and find exclusive deals from the comfort of your home.",
    ),
    OnboardingContent(
      title: 'Order Shopping',
      image: 'assets/anim/online-shopping.jpg',
      discription:
          "Browse products, add to cart, and enjoy secure, hassle-free checkout.",
    ),
    OnboardingContent(
      title: 'Finish Shopping',
      image: 'assets/anim/woman-shopping.jpg',
      discription:
          "Track your orders and get fast, reliable delivery straight to your door.",
    ),
  ];
}
