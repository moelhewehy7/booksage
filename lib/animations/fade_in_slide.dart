import 'package:flutter/material.dart';

enum FadeSlideDirection { ttb, btt, ltr, rtl }
// this enum defines directions for slide animations, improving code clarity.
// Enums are used to define a set of named constants, making code more readable

class FadeInSlide extends StatefulWidget {
  const FadeInSlide({
    super.key,
    required this.child,
    required this.duration,
    this.curve = Curves.easeInOutBack,
    this.fadeOffset = 40,
    this.direction = FadeSlideDirection.ttb,
  });

  final Widget child;
  final double duration;
  final double fadeOffset;
  final Curve curve;
  final FadeSlideDirection direction;

  @override
  State<FadeInSlide> createState() => _FadeInSlideState();
}

class _FadeInSlideState extends State<FadeInSlide>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  late Animation<double> inAnimation;
// controller: Manages the duration and playback of animations.
// opacityAnimation: Animates the opacity (transparency) of a widget.
// inAnimation: Animates the position widget.
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: Duration(milliseconds: (1000 * widget.duration).toInt()),
        vsync: this);

    inAnimation = Tween<double>(begin: -widget.fadeOffset, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: widget.curve,
      ),
    )..addListener(() {
        setState(() {});
      });

    opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // Retrieves the size of the current screen
    animationController.forward();
    // start the animation every time the widget is rebuilt
    return Transform.translate(
      offset: switch (widget.direction) {
        FadeSlideDirection.ltr => Offset(inAnimation.value, 0),
        FadeSlideDirection.rtl => Offset(size.width - inAnimation.value, 0),
        FadeSlideDirection.ttb => Offset(0, inAnimation.value),
        FadeSlideDirection.btt => Offset(0, 0 - inAnimation.value),
      },
      // ltr 40 pixels to the left of its final position
      // rtl 40 pixels to the right of the screen width
      // ttb 40 pixels above its final position
      // btt 40 pixels below its final position
      // because intial value is 40
      child: Opacity(
        opacity: opacityAnimation.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
// using addListener gives you more control over the animation updates and UI changes,
// but it requires more boilerplate code. Using AnimatedBuilder  aligns better with 
// Flutter's declarative programming model, making your code cleaner and easier to understand.