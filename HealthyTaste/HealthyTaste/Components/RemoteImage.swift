//
//  RemoteImage.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 9/11/23.
//

import SwiftUI
import Kingfisher

struct RemoteImage: View {
    let url: String
    var body: some View {
        KFImage(URL(string: url))
            .resizable()
    }
}

#Preview {
    RemoteImage(url: "")
}
