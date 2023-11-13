//
//  VideoPlayer.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import SwiftUI
import WebKit

struct VideoPlayer: View {
    let ID: String

    var body: some View {
        Video(videoID: ID)
            .frame(width: 350, height: 190)
            .padding(.horizontal, 24)
    }
}

struct Video: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
