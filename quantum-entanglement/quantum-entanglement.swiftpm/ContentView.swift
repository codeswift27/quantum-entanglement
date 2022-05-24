//
//  ContentView.swift
//  Quantum Entanglement
//
//  Created by Lexline Johnson on 11/04/2022.
//
//
//  Sources ♥︎
//  https://www.quantamagazine.org/entanglement-made-simple-20160428/
//  https://www.quantamagazine.org/real-life-schrodingers-cats-probe-the-boundary-of-the-quantum-world-20180625/
//  https://quantumatlas.umd.edu/entry/quantum-classical/
//  https://www.livescience.com/54667-bose-einstein-condensate.html
//  https://www.popularmechanics.com/science/news/a27271/chinese-scientists-successfully-teleported-a-particle-to-space/
//
//
//  WARNING: This Playground contains flashing lights.
//
//
//  Note: This Playground is best viewed in landscape and on a 12.9" iPad Pro.
//
//  Thank you, and I hope you enjoy! :)
//

import SwiftUI

struct ContentView: View {
    @State var page: Page = .introduction
    @State var previousPage: Page?

    init() {
        // Change background and navigation bar colors
        UITableView.appearance().backgroundColor = UIColor(red: 71 / 255, green: 71 / 255, blue: 103 / 255, alpha: 1)
        UINavigationBar.appearance().barTintColor = UIColor(red: 71 / 255, green: 71 / 255, blue: 103 / 255, alpha: 1)
    }
    
    var body: some View {
        NavigationView {
            // Sidebar
            List {
                Button(action: { page = .introduction }, label: { Label("Introduction", systemImage: "text.alignleft") })
                    .listRowBackground(page == .introduction ? Color(red: 105 / 255, green: 106 / 255, blue: 142 / 255, opacity: 0.9).cornerRadius(10) : Color.clear.cornerRadius(10))
                Button(action: { page = .entanglement }, label: { Label("What is Entanglement", systemImage: "text.alignleft") })
                    .listRowBackground(page == .entanglement ? Color(red: 105 / 255, green: 106 / 255, blue: 142 / 255, opacity: 0.9).cornerRadius(10) : Color.clear.cornerRadius(10))
                Button(action: { page = .schrödinger }, label: { Label("Schrödinger's Cat", systemImage: "text.alignleft") })
                    .listRowBackground(page == .schrödinger ? Color(red: 105 / 255, green: 106 / 255, blue: 142 / 255, opacity: 0.9).cornerRadius(10) : Color.clear.cornerRadius(10))
                Button(action: { page = .decoherence }, label: { Label("Decoherence", systemImage: "text.alignleft") })
                    .listRowBackground(page == .decoherence ? Color(red: 105 / 255, green: 106 / 255, blue: 142 / 255, opacity: 0.9).cornerRadius(10) : Color.clear.cornerRadius(10))
                Button(action: { page = .conclusion }, label: { Label("Conclusion", systemImage: "text.alignleft") })
                    .listRowBackground(page == .conclusion ? Color(red: 105 / 255, green: 106 / 255, blue: 142 / 255, opacity: 0.9).cornerRadius(10) : Color.clear.cornerRadius(10))
            }
            .listStyle(.sidebar)
            .navigationTitle("Contents")
            
            // View switcher
            switch page {
            case .introduction:
                Introduction()
                    .toolbar {
                        Button(action: { }, label: { Image(systemName: "arrowtriangle.left") })
                        Button(action: {
                            withAnimation {
                                previousPage = page
                                page = .entanglement
                            }
                        }, label: { Image(systemName: "arrowtriangle.right") })
                    }
                    .transition(.slide)
            case .entanglement:
                Entanglement()
                    .toolbar {
                        Button(action: {
                            withAnimation {
                                previousPage = page
                                page = .introduction
                            }
                        }, label: { Image(systemName: "arrowtriangle.left") })
                        Button(action: {
                            withAnimation {
                                previousPage = page
                                page = .schrödinger
                            }
                        }, label: { Image(systemName: "arrowtriangle.right") })
                    }
                    .transition(previousPage == .introduction ? .reverseSlide : .slide) // Animations depending on which page you flip from
            case .schrödinger:
                Schrödinger()
                    .toolbar {
                        Button(action: {
                            withAnimation {
                                previousPage = page
                                page = .entanglement
                            }
                        }, label: { Image(systemName: "arrowtriangle.left") })
                        Button(action: {
                            withAnimation {
                                previousPage = page
                                page = .decoherence
                            }
                        }, label: { Image(systemName: "arrowtriangle.right") })
                    }
                    .transition(previousPage == .entanglement ? .reverseSlide : .slide)
            case .decoherence:
                Decoherence()
                    .toolbar {
                        Button(action: {
                            withAnimation {
                                previousPage = page
                                page = .schrödinger
                            }
                        }, label: { Image(systemName: "arrowtriangle.left") })
                        Button(action: {
                            withAnimation {
                                previousPage = page
                                page = .conclusion
                            }
                        }, label: { Image(systemName: "arrowtriangle.right") })
                    }
                    .transition(previousPage == .schrödinger ? .reverseSlide : .slide)
            case .conclusion:
                Conclusion()
                    .toolbar {
                        Button(action: {
                            withAnimation {
                                previousPage = page
                                page = .decoherence
                            }
                        }, label: { Image(systemName: "arrowtriangle.left") })
                        Button(action: { }, label: { Image(systemName: "arrowtriangle.right") })
                    }
                    .transition(.reverseSlide)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Pages
enum Page {
    case introduction, entanglement, schrödinger, decoherence, conclusion
}

// Reverse slide animation
extension AnyTransition {
    static var reverseSlide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)
        )
    }
}
