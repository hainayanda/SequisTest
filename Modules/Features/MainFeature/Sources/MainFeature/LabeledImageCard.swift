//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI

struct LabeledImageCard: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            HStack {
                Image("Test", bundle: .module)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                Spacer()
                VStack(alignment: .leading) {
                    Text("Author")
                        .font(.title2)
                        .bold()
                    Text("Amelia Earheart")
                    Spacer()
                }
                .padding()
                Spacer()
            }
            .padding()
        }
        .frame(height: 124)
        .cornerRadius(25)
        .shadow(color: .black.opacity(0.2), radius: 10)
    }
}

struct LabeledImageCard_Previews: PreviewProvider {
    static var previews: some View {
        LabeledImageCard()
    }
}
