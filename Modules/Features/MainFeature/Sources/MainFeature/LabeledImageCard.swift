//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import CommonUI

struct LabeledImageCard: View {
    
    var body: some View {
        Card {
            HStack {
                Image("Test", bundle: .module)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .innerCornerRadius()
                Spacer()
                VStack(alignment: .leading) {
                    Title2("Author")
                    Text("Amelia Earheart")
                    Spacer()
                }
                .padding()
                Spacer()
            }
            .padding()
        }
        .frame(height: 124)
    }
}

struct LabeledImageCard_Previews: PreviewProvider {
    static var previews: some View {
        LabeledImageCard()
    }
}
