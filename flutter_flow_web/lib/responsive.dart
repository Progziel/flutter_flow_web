import 'package:flutter/material.dart';
import 'package:get/get.dart';

double _width = 600, _height = 600;

class MyResponsiveScreen extends StatelessWidget {
  const MyResponsiveScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return (context.width >= _width && context.height >= _height)
        ? child
        : (context.width < _width && context.height < _height)
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: _width,
                            height: _height,
                            child: child,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : (context.width < _width)
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: _width,
                          height: _height,
                          child: child,
                        ),
                      ],
                    ),
                  )
                : (context.height < _height)
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              width: _width,
                              height: _height,
                              child: child,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink();
  }
}
