//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import CommonUI

public struct DetailView: View {
    
    public var body: some View {
        ScrollView {
            VStack {
                ImageCompatible(url: "https://zonneveld.dev/wp-content/uploads/2019/10/swiftUI-banner.jpg")
                    .resizable()
                    .aspectRatio(CGSize(width: 2, height: 1), contentMode: .fill)
                ForEach(0..<20) { _ in
                    PostItem()
                }
            }
        }
        .navigationTitle("Image Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
