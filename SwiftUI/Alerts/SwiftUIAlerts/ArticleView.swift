//
//  ArticleView.swift
//  SwiftUIAlerts
//
//  Created by A.J. van der Lee on 07/04/2025.
//

import SwiftUI

final class ArticleViewModel: ObservableObject {
    enum Error: LocalizedError {
        case titleEmpty

        var errorDescription: String? {
            switch self {
            case .titleEmpty:
                return "Missing title"
            }
        }

        var recoverySuggestion: String? {
            switch self {
            case .titleEmpty:
                return "Article publishing failed due to missing title"
            }
        }
    }

    @Published var title: String = ""
    @Published var error: Swift.Error?

    func publish() {
        error = Error.titleEmpty
    }
}

struct ArticleView: View {

    @StateObject var viewModel = ArticleViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            SimpleAlertExampleView()
            AlertActionsExampleView()
            ObjectInputAlertExampleView(article: Article(title: "SwiftUI Alerts Explained with Code Examples", url: URL(string: "https://www.avanderlee.com")!))
            
            Divider()
            GroupBox {
                VStack(alignment: .leading) {
                    Text("Error alert example")
                        .font(.title)
                    TextField(text: $viewModel.title, prompt: Text("Article title")) {
                        Text("Title")
                    }
                    Button {
                        viewModel.publish()
                    } label: {
                        Text("Publish")
                    }
                }
            }
        }.padding()
            .errorAlert(error: $viewModel.error)
            
    }
}

struct SimpleAlertExampleView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        Button("Present alert") {
            isPresented = true
        }.alert("Alert title", isPresented: $isPresented, actions: {
            // Leave empty to use the default "OK" action.
        }, message: {
            Text("Alert message")
        })
    }
}

struct Article {
    let title: String
    let url: URL
}

struct ObjectInputAlertExampleView: View {
    @State private var isPublished: Bool = false
    let article: Article
    
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        Button("Publish Article") {
            
            /// Perform publishing logic...
            
            isPublished = true
        }.alert("Article published", isPresented: $isPublished, presenting: article, actions: { article in
            
            /// Add a button that opens the article URL.
            Button("View Article") {
                openURL(article.url)
            }
            /// Make it the default action on the alert
            .keyboardShortcut(.defaultAction)
            
            /// Add a generic OK button.
            Button("OK") { }
        }, message: { article in
            Text("Article '\(article.title) has been published")
        })
    }
}

struct AlertActionsExampleView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        Button("Present alert with actions") {
            isPresented = true
        }.alert("Alert title", isPresented: $isPresented, actions: {
            
            /// A destructive button that appears in red.
            Button(role: .destructive) {
                // Perform the deletion
            } label: {
                Text("Delete")
            }
            
            /// A cancellation button that appears with bold text.
            Button("Cancel", role: .cancel) {
                // Perform cancellation
            }
            
            /// A general button.
            Button("OK") {
                // Dismiss without action
            }
        }, message: {
            Text("Alert message")
        })
    }
}


#Preview {
    ArticleView()
}
