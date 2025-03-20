import 'package:flutter/material.dart';

class BouncingDotsLoader extends StatefulWidget {
  final Color color;
  final double size;
  final double spacing;
  final Duration duration;

  const BouncingDotsLoader({
    Key? key,
    this.color = Colors.white,
    this.size = 10.0,
    this.spacing = 4.0,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  State<BouncingDotsLoader> createState() => _BouncingDotsLoaderState();
}

class _BouncingDotsLoaderState extends State<BouncingDotsLoader>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _controller2 = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _controller3 = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
    );

    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
    );

    _animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller3, curve: Curves.easeInOut),
    );

    // Stagger the animations
    _controller1.addListener(() {
      if (_controller1.value >= 0.3 && !_controller2.isAnimating) {
        _controller2.repeat(reverse: true);
      }
    });

    _controller2.addListener(() {
      if (_controller2.value >= 0.3 && !_controller3.isAnimating) {
        _controller3.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAnimatedDot(_animation1),
        SizedBox(width: widget.spacing),
        _buildAnimatedDot(_animation2),
        SizedBox(width: widget.spacing),
        _buildAnimatedDot(_animation3),
      ],
    );
  }

  Widget _buildAnimatedDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -4.0 * animation.value),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
