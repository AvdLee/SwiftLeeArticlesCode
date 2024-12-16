//
//  ContentView.swift
//  SwiftUIButtons
//
//  Created by A.J. van der Lee on 16/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            Group {
                plainTextButtons
                systemButtons
                customButtons
            }
                .padding(.horizontal)
        }
    }
    
    var plainTextButtons: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Plain text buttons")
                .font(.title)
                .bold()
                .padding(.bottom)
            ButtonTitleView(title: "Button with only a title") {
                Button("Press me!") {
                    print("Button tapped!")
                }
            }
    
            ButtonTitleView(title: "Button with a title and SF Symbol") {
                Button("Press me!", systemImage: "play") {
                    print("Button tapped!")
                }
            }
            ButtonTitleView(title: "Button with a title and a custom image") {
                Button("Press me!", image: ImageResource(name: "custom.crown", bundle: .main)) {
                    print("Button tapped!")
                }
            }
            ButtonTitleView(title: "Button with role destructive") {
                Button("Press me!", role: .destructive) {
                    
                }
            }
        }
    }
    
    var systemButtons: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("System buttons")
                .font(.title)
                .bold()
                .padding(.bottom)
            ButtonTitleView(title: ".borderedProminent style and .capsule shape") {
                Button("Get") {
                    print("Button tapped!")
                }.buttonBorderShape(.capsule)
                    .buttonStyle(.borderedProminent)
            }
            ButtonTitleView(title: ".bordered style and .capsule shape") {
                Button("Press me!") {
                    print("Button tapped!")
                }.buttonBorderShape(.capsule)
                    .buttonStyle(.bordered)
            }
            ButtonTitleView(title: ".bordered style and rounded rectangle shape") {
                Button("Press me!") {
                    print("Button tapped!")
                }.buttonStyle(.borderedProminent).buttonBorderShape(.roundedRectangle)
            }
        }
    }
    
    var customButtons: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Custom buttons")
                .font(.title)
                .bold()
                .padding(.bottom)
            ButtonTitleView(title: "Standard button with custom label view") {
                Button(action: {
                    print("Button tapped!")
                }, label: {
                    HStack {
                        Image("custom.crown")
                        Divider()
                        Text("Press me!")
                    }.fixedSize(horizontal: false, vertical: true)
                })
            }
            ButtonTitleView(title: "Custom button style") {
                Button("Press me!") {
                    print("Button tapped!")
                }.buttonStyle(.myAppPrimaryButton)
            }
            ButtonTitleView(title: "Custom button style for roles") {
                Button("Press me!", role: .destructive) {
                    print("Button tapped!")
                }.buttonStyle(RolesButtonStyle())
            }
            ButtonTitleView(title: "Custom interaction button style") {
                Button("Press me!") {
                    print("Single tapped!")
                }.buttonStyle(.doubleTapTrigger(action: {
                    print("Double tapped!")
                }))
                
            }
        }
    }
}

struct ButtonTitleView<Content: View>: View {
    let title: String
    
    @ViewBuilder
    let button: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(title):")
            button()
        }.padding(.bottom)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
            .bold()
            .foregroundStyle(.white)
            .background(Color.accentColor)
            .clipShape(Capsule(style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var myAppPrimaryButton: PrimaryButtonStyle { .init() }
}

struct RolesButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(configuration.role == .cancel ? .body.bold() : .body)
            .foregroundColor(configuration.role == .destructive ? Color.red : nil)
    }
}

struct DoubleTapTriggerButtonStyle: PrimitiveButtonStyle {
    let doubleTapTrigger: () -> Void
    @GestureState private var isPressed = false
    
    /// A drag gesture that is solely used to keep tracked of the pressed state of the button.
    private var pressedStateGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .updating($isPressed) { _, isPressed, _ in
                guard !isPressed else { return }
                isPressed = true
            }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
            .bold()
            .foregroundStyle(.white)
            .background(Color.accentColor)
            .clipShape(Capsule(style: .continuous))
            .opacity(isPressed ? 0.75 : 1)
            .animation(.easeInOut, value: isPressed)
            
            /// Adding the gesture simultaneously to ensure we don't break the tap gestures.
            .simultaneousGesture(pressedStateGesture)
        
            /// Adding both tap gestures.
            .onTapGesture(count: 1, perform: configuration.trigger)
            .onTapGesture(count: 2, perform: doubleTapTrigger)
    }
}

/// Using Static Member Lookup in combination with a method to configure the double tap.
extension PrimitiveButtonStyle where Self == DoubleTapTriggerButtonStyle {
    static func doubleTapTrigger(action: @escaping () -> Void) -> DoubleTapTriggerButtonStyle {
        DoubleTapTriggerButtonStyle(doubleTapTrigger: action)
    }
}
