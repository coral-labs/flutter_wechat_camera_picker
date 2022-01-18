import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// Applies a BlendMode to its child.
class BlendMask extends SingleChildRenderObjectWidget {
  final BlendMode _blendMode;
  final double _opacity;
  final Color? color;

  const BlendMask(
      {required BlendMode blendMode,
      double opacity = 1.0,
      this.color,
      Key? key,
      Widget? child})
      : _blendMode = blendMode,
        _opacity = opacity,
        super(key: key, child: child);

  @override
  RenderObject createRenderObject(context) {
    return RenderBlendMask(_blendMode, _opacity, color);
  }

  @override
  void updateRenderObject(BuildContext context, RenderBlendMask renderObject) {
    renderObject._blendMode = _blendMode;
    renderObject._opacity = _opacity;
  }
}

class RenderBlendMask extends RenderProxyBox {
  BlendMode _blendMode;
  double _opacity;
  final Color? _color;

  RenderBlendMask(BlendMode blendMode, double opacity, Color? color)
      : _blendMode = blendMode,
        _color = color,
        _opacity = opacity;

  @override
  void paint(context, offset) {
    // Create a new layer and specify the blend mode and opacity to composite it with:
    context.canvas.saveLayer(
        offset & size,
        Paint()
          ..blendMode = _blendMode
          ..color = _color ??
              Color.fromARGB((_opacity * 255).round(), 255, 255, 255));

    super.paint(context, offset);

    // Composite the layer back into the canvas using the blendmode:
    context.canvas.restore();
  }
}
