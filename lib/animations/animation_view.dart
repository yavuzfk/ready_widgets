import 'package:flutter/material.dart';

class AnimationView extends StatefulWidget {
  const AnimationView({Key? key}) : super(key: key);

  @override
  _AnimationViewState createState() => _AnimationViewState();
}

class _AnimationViewState extends State<AnimationView>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  bool _isOpacity = false;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          kaybolanYaziRow(context),
          buyuyenDertler(context),
          animatedIcon(),
          animatedContainer(context),
          Expanded(
              child: Stack(
            children: const [
              AnimatedPositioned(
                  top: 100,
                  curve: Curves.elasticOut,
                  duration: Duration(milliseconds: 50000),
                  child: Icon(Icons.account_balance))
            ],
          )),
        ]),
      ),
    );
  }

  AnimatedIcon animatedIcon() {
    return AnimatedIcon(
      icon: AnimatedIcons.menu_close,
      progress: controller,
    );
  }

  AnimatedContainer animatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: _isVisible ? 0 : MediaQuery.of(context).size.width * 0.2,
      width: _isVisible ? 0 : MediaQuery.of(context).size.height * 0.2,
      color: Colors.blue,
      margin: const EdgeInsets.all(5),
    );
  }

  AnimatedDefaultTextStyle buyuyenDertler(BuildContext context) {
    return AnimatedDefaultTextStyle(
        style: (_isVisible
                ? Theme.of(context).textTheme.headline1
                : Theme.of(context).textTheme.subtitle1) ??
            const TextStyle(),
        duration: const Duration(seconds: 1),
        child: const Text('dertler'));
  }

  AppBar appbar() {
    return AppBar(
      title: AnimatedCrossFade(
        firstChild: Image.asset("assets/anadol.png"),
        secondChild: const SizedBox.shrink(),
        duration: const Duration(seconds: 1),
        crossFadeState:
            _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
      leading: IconButton(
          onPressed: () {
            _changeVisible();
            controller.animateTo(_isVisible ? 1 : 0);
          },
          icon: const Icon(Icons.image)),
    );
  }

  Row kaybolanYaziRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _isOpacity ? 1 : 0,
            child: Text(
              'data',
              style: Theme.of(context).textTheme.headline5,
            )),
        TextButton(
            onPressed: () {
              _changeOpacity();
            },
            child: const Text("Animated Opacity"))
      ],
    );
  }
}
