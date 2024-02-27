#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class io.flutter.plugin.editing.** { *; }

# Keep classes and methods related to text rendering
-keep class android.graphics.Typeface { *; }
-keep class android.text.Layout { *; }
-keep class android.text.StaticLayout { *; }
-keep class android.text.TextDirectionHeuristic { *; }
-keep class android.text.TextPaint { *; }
-keep class android.text.TextUtils { *; }
-keep class android.text.method.TransformationMethod { *; }
-keep class android.text.method.PasswordTransformationMethod { *; }
-keep class android.text.method.HideReturnsTransformationMethod { *; }

# Keep classes and methods related to font loading
-keep class android.core.graphics.TypefaceCompat { *; }
-keep class android.core.graphics.TypefaceCompatUtil { *; }
-keep class android.core.provider.FontsContractCompat { *; }
-keep class android.core.provider.FontsContractCompat$FontRequestCallback { *; }
-keep class android.core.provider.FontRequest { *; }
-keep class android.core.provider.FontsContractCompat$FontFamilyResult { *; }