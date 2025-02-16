//
//  TextInputPrompt.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 22/01/2025.
//

import SwiftUI

struct TextInputPrompt: View {
    @Binding var textEntered: Int
    @Binding var showingAlert: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
            VStack {
                Text("Change current score")
                    .font(.title)
                    .foregroundColor(.black)

                Divider()

                TextField("Enter score", value: $textEntered, formatter: DartsScoreFormatter())
                    .padding(5)
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                    .keyboardType(.numberPad)

                Divider()

                HStack {
                    Button("Dismiss") {
                        self.showingAlert.toggle()
                    }
                }
                .padding(30)
                .padding(.horizontal, 40)
            }
        }
        .frame(width: 300, height: 200)
    }
}
