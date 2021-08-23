import SwiftUI

struct TesNavigation: View {
    @State var isActive : Bool = false

    var body: some View {
        NavigationView {
            NavigationLink(
                destination: ContentView2(rootIsActive: self.$isActive),
                isActive: self.$isActive
            ) {
                Text("Hello, World!")
            }
            .isDetailLink(false)
        }
    }
}

struct ContentView2: View {
    @Binding var rootIsActive : Bool
    @State var page2Active: Bool = false

    var body: some View {
        NavigationLink(destination: ContentView3(shouldPopToRootView: self.$rootIsActive, popToSecondView: $page2Active),isActive: self.$page2Active) {
            Text("Hello, World #2!")
        }
        .isDetailLink(false)
    }
}

struct ContentView3: View {
    @Binding var shouldPopToRootView : Bool
    @Binding var popToSecondView : Bool

    var body: some View {
        VStack {
            Text("Hello, World #3!")
            Button (action: { self.shouldPopToRootView = false } ){
                Text("Pop to root")
            }
            Button (action: { self.popToSecondView = false } ){
                Text("Pop to second page")
            }
        }
    }
}

struct TesNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
