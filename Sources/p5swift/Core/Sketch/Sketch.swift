// p5swift

import UIKit


open class Sketch: Graphics {
  
  public var size: Size {
    graphics.size
  }
    
  public var frameCount: Int {
    return graphics.frameCount
  }
  
  public var view: UIView {
    return graphics.rendererView
  }
  
  private var graphics: Graphics & InternalGraphics
  
  var rendererView: RendererView {
    return graphics.rendererView
  }
  
  public convenience init() {
    self.init(size: Defaults.sketchSize)
  }
  
  public required init(size: Size) {
    graphics = CGGraphics(size: size)
    setup()
    self.graphics.rendererView.onRenderCallback = onRenderCallback
  }
  
  open func setup() {}
  
  open func draw() {}

  public func size(width: Float, height: Float, type: SketchType = .p2D) {
    switch type {
    case .p2D:
      self.graphics = CGGraphics(size: Size(width: width, height: height))
    }
  }

  public func loop() {
    graphics.loop = true
  }
  
  public func noLoop() {
    graphics.loop = false
  }
  
  private func onRenderCallback() {
    draw()
    graphics.internalDraw()
  }
  
  public func clip() {
    graphics.clip()
  }
  
  public func endClip() {
    graphics.endClip()
  }
  
  public func line(_ line: LineSegment) {
    graphics.line(line)
  }
    
  public func rectangle(_ rectangle: Rectangle) {
    graphics.rectangle(rectangle)
  }
  
  public func ellipse(_ ellipse: Ellipse) {
    graphics.ellipse(ellipse)
  }
  
  public func arc(_ arc: Arc) {
    graphics.arc(arc)
  }
  
  public func point(_ point: Point) {
    graphics.point(point)
  }
  
  public func beginShape() {
    graphics.beginShape()
  }
  
  public func vertex(_ point: Point) {
    graphics.vertex(point)
  }
  
  public func curveVertex(_ point: Point) {
    graphics.curveVertex(point)
  }
  
  public func curve(_ curve: CubicBezier) {
    graphics.curve(curve)
  }

  public func curve(_ curve: QuadraticBezier) {
    graphics.curve(curve)
  }
  
  public func polygon(_ polygon: Polygon) {
    graphics.polygon(polygon)
  }

  public func endShape(_ mode: ShapeMode) {
    graphics.endShape(mode)
  }
  
  public func background(_ color: Color) {
    graphics.background(color)
  }
  
  public func blendMode(_ mode: BlendMode) {
    graphics.blendMode(mode)
  }
  
  public func fill(with color: Color) {
    graphics.fill(with: color)
  }
  
  public func stroke(with color: Color) {
    graphics.stroke(with: color)
  }
  
  public func strokeCap(_ strokeCap: StrokeCap) {
    graphics.strokeCap(strokeCap)
  }
  
  public func strokeJoin(_ strokeCap: StrokeJoin) {
    graphics.strokeJoin(strokeCap)
  }
  
  public func strokeWeight(_ weight: Float) {
    graphics.strokeWeight(weight)
  }
  
  public func translate(by point: Point) {
    graphics.translate(by: point)
  }
  
  public func scale(by point: Point) {
    graphics.scale(by: point)
  }
  
  public func rotate(by angle: Float) {
    graphics.rotate(by: angle)
  }
  
  public func push() {
    graphics.push()
  }
  
  public func pop() {
    graphics.pop()
  }
  
  public func image(_ another: Graphics) {
    graphics.image(another)
  }

  public func text(_ content: String, _ point: Point) {
    graphics.text(content, point)
  }
  public func textSize(_ size: Float) {
    graphics.textSize(size)
  }
  public func textFont(_ font: String) {
    graphics.textFont(font)
  }
}

public extension Sketch {
  var safeFrame: Rectangle {
    let insets = view.safeAreaInsets
    var bounds = Rectangle(origin: .zero, size: size)
    bounds.x += Float(insets.left)
    bounds.width -= Float(insets.left + insets.right)
    bounds.y += Float(insets.top)
    bounds.height -= Float(insets.top + insets.bottom)
    return bounds
  }
}
