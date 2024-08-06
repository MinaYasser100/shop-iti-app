class OnboardingContent {
  final String image;
  final String title;
  final String discription;
  final String background;

  const OnboardingContent({
    required this.image, 
    required this.title, 
    required this.discription,
    required this.background,
  });

  static const all = [
    OnboardingContent(
      title:"Donuts" ,
      image: 'assets/onboarding/images/don.png',
      discription: "Made by hand , from \n "
                          "scratch \n "
                          " with love\n  ",
      background:'assets/onboarding/images/b1.png',
    ),
    OnboardingContent(
      title: 'piece of cake',
      image: 'assets/onboarding/images/cake.png',
      discription: "Made by hand , from \n "
          "scratch \n "
          " with love\n  ",
      background: 'assets/onboarding/images/b2.png',
    ),
    OnboardingContent(
      title: 'Milkshake',
      image: 'assets/onboarding/images/milk.png',
      discription:"Made by hand , from \n "
          "scratch \n "
          " with love\n  ",
      background: 'assets/onboarding/images/b3.png',
    ),
  ];
}