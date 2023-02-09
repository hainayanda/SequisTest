//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import SwiftUI

public struct CircledInitial: View {
    
    let initial: String
    
    public init(_ name: String) {
        let nameComponents = name.split(separator: " ")
        let firstInitial = nameComponents.first?.first?.uppercased() ?? ""
        let lastInitial = nameComponents.last?.first?.uppercased() ?? ""
        initial = "\(firstInitial)\(lastInitial)"
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            Text(initial)
                .foregroundColor(.appConstrastText)
                .bold()
        }
    }
}

struct CircledInitial_Previews: PreviewProvider {
    static var previews: some View {
        CircledInitial("Hello World")
    }
}
