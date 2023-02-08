//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import CommonUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            VStack {
                ImageCompatible(url: "https://zonneveld.dev/wp-content/uploads/2019/10/swiftUI-banner.jpg")
                    .resizable()
                    .scaledToFill()
                ForEach(0..<20) { _ in
                    PostItem()
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
