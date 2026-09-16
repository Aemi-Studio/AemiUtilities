# AemiUtilities compatibility package

The implementation now lives in [Aemi](https://github.com/Aemi-Studio/aemi).
This package preserves the `AemiUtilities` product and import while resolving Aemi from
its published `main` branch. It contains no duplicate implementation.

For new code, depend directly on Aemi and select `AemiCore` for shared utilities
or `AemiUI` for SwiftUI components.

## Requirements

Swift 6.3+, iOS 18+, macOS 15+, tvOS 18+, watchOS 11+, or visionOS 2+.
These minimums follow Aemi; clients supporting older platforms should retain their
existing revision until they can update their deployment target.

## License

[MIT](LICENSE).
