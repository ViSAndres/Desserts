//
//  YouTubeView.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/20/24.
//

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: url))
    }
}
