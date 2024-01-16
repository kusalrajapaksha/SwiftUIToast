# SwiftUIToast
SwiftUIToast is a lightweight and customizable Swift package for displaying toast messages in SwiftUI applications. It allows you to easily show informative messages with various **styles**, **durations**, and **configurations.**

## Features
* **Customizable Styles**: Choose from predefined styles such as info, success, warning, danger, and secondary, or customize your own.
* **Duration Control**: Set the duration for how long the toast message should be displayed on the screen.
* **Flexible Layout**: Adjust the width, corner radius, font size, number of lines, and padding to suit your design requirements.
* **Corner Masking**: Specify which corners should be rounded with the masked corners option.

## Installation
Add the following dependency to your Package.swift file:
```
dependencies: [
    .package(url: "https://github.com/kusalrajapaksha/SwiftUIToast.git", from: "1.0.2")
]
```

## Usage
1. Import the ToastSwiftUI module:
```
import SwiftUIToast
```
2. Create a Toast instance and use the toastView modifier on your SwiftUI view:
```
@State private var toast: Toast? = nil

var body: some View {
    Text("Hello, ToastSwiftUI!")
        .toastView(toast: $toast, yOffset: 50)
}
```
3. Show a toast message:
```
self.toast = Toast(style: .success, message: "This is a success toast", duration: 2)
```

## Example
```
VStack{
  ToastView(style: .info, message: "This is a info toast",horizontalPadding: 8, verticalPadding: 8)
  ToastView(style: .success, message: "This is a success toast",horizontalPadding: 8, verticalPadding: 8)
  ToastView(style: .warning, message: "This is a warning toast",horizontalPadding: 8, verticalPadding: 8)
  ToastView(style: .danger, message: "This is a danger toast",horizontalPadding: 8, verticalPadding: 8)
  ToastView(style: .secondary, message: "This is a secondary toast",horizontalPadding: 8, verticalPadding: 8)
}
```
<img width="325" alt="Screenshot 2024-01-16 at 11 27 43" src="https://github.com/kusalrajapaksha/SwiftUIToast/assets/72430450/6e64b2c4-1c8f-42a6-871f-1701d67e8133">

Feel free to explore and customize the provided styles to fit your application's theme.

```
import SwiftUI
import SwiftUIToast

struct ContentView: View {
    
    @State private var maskedCornersToast: Toast? = nil
    @State private var defaultToast: Toast? = nil
    
    var body: some View {
        
        VStack{
            Text("Show toast with masked corners")
                .onTapGesture {
                    maskedCornersToast = Toast(style: .info, message: "Toast", maskedCorners: [.topLeft,.topRight])
                }
                .padding()
                .background(Color.red)
                .foregroundColor(Color.white)
                .cornerRadius(8)
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                // Get the size of the Text view
                                print(geometry.size.height)
                            }
                            .toastView(toast: $maskedCornersToast, yOffset: geometry.size.height)
                    })
            
            Spacer().frame(height: 100)
            
            Text("Show toast")
                .onTapGesture {
                    defaultToast = Toast(style: .success, message: "Toast")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(8)
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                // Get the size of the Text view
                                print(geometry.size.height)
                            }
                            .toastView(toast: $defaultToast, yOffset: geometry.size.height + 10)
                    })
        }
    }
}

```

![SimulatorScreenRecording-iPhone15Pro-2024-01-16at11 52 16-ezgif com-video-to-gif-converter](https://github.com/kusalrajapaksha/SwiftUIToast/assets/72430450/3dcbf463-efe2-4185-b2c1-874fb2167f20)

## License
SwiftUIToast is released under the MIT License. Feel free to use it in your projects and contribute to its development.

If you encounter any issues or have suggestions for improvement, please open an issue.

Happy toasting! 🚀





