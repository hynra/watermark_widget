# Watermark Widget

A simple Flutter package for adding customizable watermarks to widgets.

## Features

- Add watermark to any widget
- Customize text, color, opacity, and rotation
- Control the spacing and size of watermark text

## Usage

```dart
WatermarkWidget(
  text: 'WATERMARK',
  opacity: 0.2,
  color: Colors.red,
  rotationAngle: -0.5,
  fontSize: 20,
  horizontalInterval: 100,
  verticalInterval: 80,
  child: YourWidget(),
)
```

## Arguments

- `text` (required): The text to be displayed as the watermark.
- `child` (required): The widget to which the watermark will be applied.
- `opacity` (default: 0.2): The opacity of the watermark text (0.0 to 1.0).
- `color` (default: Colors.black): The color of the watermark text.
- `rotationAngle` (default: -0.5): The rotation angle of the watermark text in radians.
- `fontSize` (default: 10): The font size of the watermark text.
- `horizontalInterval` (default: 100): The horizontal spacing between watermark texts.
- `verticalInterval` (default: 100): The vertical spacing between watermark texts.

## Tips for Configuration

1. **Text**: Choose a short, clear text that represents your watermark purpose (e.g., "CONFIDENTIAL", "DRAFT", company name).

2. **Opacity**: Start with a low opacity (0.1 to 0.3) to make the watermark visible but not distracting. Adjust as needed.

3. **Color**: Choose a color that contrasts with your content but isn't too jarring. Light gray often works well for dark backgrounds, and dark gray for light backgrounds.

4. **Rotation Angle**:
    - The angle is in radians.
    - Common values:
        - -0.5 radians ≈ -28.6 degrees
        - -0.25 radians ≈ -14.3 degrees
    - Experiment to find the right balance between readability and aesthetics.

5. **Font Size**:
    - Adjust based on the size of your child widget.
    - Larger widgets generally need larger font sizes.
    - Start with 10-20% of the smaller dimension of your child widget.

6. **Intervals**:
    - `horizontalInterval` and `verticalInterval` control the density of watermarks.
    - Start with values around 50-100% of your child widget's dimensions.
    - Smaller intervals create a denser watermark pattern.
    - Larger intervals create a sparser pattern.

7. **Performance**: Be mindful that very small intervals or very large font sizes can impact performance, especially on large widgets.

8. **Testing**: Always test your watermark on various screen sizes to ensure it looks good across devices.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  watermark_widget: ^1.0.0
```

Then run:

```
flutter pub get
```

## Testing

1. Ensure you're in the root directory of the package.
2. Run the following command:

```
flutter test
```

## Example

```dart
WatermarkWidget(
  text: 'CONFIDENTIAL',
  opacity: 0.15,
  color: Colors.red.withOpacity(0.3),
  rotationAngle: -0.5,
  fontSize: 18,
  horizontalInterval: 150,
  verticalInterval: 100,
  child: Container(
    width: 300,
    height: 200,
    color: Colors.white,
    child: Center(
      child: Text('Sensitive Content'),
    ),
  ),
)
```

This example creates a watermark with "CONFIDENTIAL" text, slightly rotated, with a light red color over a white container.

## Additional Information

For more examples and usage scenarios, please refer to the example in the `example` directory of this package.