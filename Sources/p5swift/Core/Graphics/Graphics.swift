import UIKit

public protocol Graphics {
  var size: Size { get }
  var frameCount: Int { get }
  var view: UIView { get }

  func line(_ line: LineSegment)
  func rectangle(_ rectangle: Rectangle)
  func ellipse(_ ellipse: Ellipse)
  func arc(_ arc: Arc)
  func point(_ point: Point)
  func curve(_ curve: CubicBezier)
  func curve(_ curve: QuadraticBezier)
  func polygon(_ polygon: Polygon)
  
  func beginShape()
  func vertex(_ point: Point)
  func curveVertex(_ point: Point)
  func endShape(_ mode: ShapeMode)
  
  func clip()
  func endClip()
  
  func blendMode(_ mode: BlendMode)
  func background(_ color: Color)
  func fill(with color: Color)
  func stroke(with color: Color)
  func strokeCap(_ strokeCap: StrokeCap)
  func strokeJoin(_ strokeCap: StrokeJoin)
  func strokeWeight(_ weight: Float)
  
  func translate(by point: Point)
  func scale(by point: Point)
  func rotate(by angle: Float)
  func push()
  func pop()
  
  func image(_ graphics: Graphics)
    
    
  func text(_ content: String, _ point: Point)
  func textSize(_ size: Float)
  func textFont(_ font: String)
}

public extension Graphics {
  func noStroke() {
    stroke(with: .clear)
  }
  
  func noFill() {
    fill(with: .clear)
  }
}

public extension Graphics {
  var center: Point {
    Point(x: size.width * 0.5, y: size.height * 0.5)
  }
}

public extension Graphics {
  var width: Float {
    size.width
  }
  
  var height: Float {
    size.height
  }
  
  func circle(origin: Point, radius: Float) {
    circle(x: origin.x, y: origin.y, radius: radius)
  }
  
  func circle(x: Float, y: Float, radius: Float) {
    ellipse(Ellipse(x: x, y: y, width: radius * 2, height: radius * 2))
  }
  
  func circle(center: Point, radius: Float) {
    circle(centerX: center.x, y: center.y, radius: radius)
  }

  func circle(centerX x: Float, y: Float, radius: Float) {
    ellipse(Ellipse(x: x - radius, y: y - radius, width: radius * 2, height: radius * 2))
  }
}
