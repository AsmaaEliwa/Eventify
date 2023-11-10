//
//  input.swift
//  Eventify
//
//  Created by asmaa gamal  on 10/11/2023.
//

import SwiftUI

struct input: View {
    var lable: String
    @Binding var text:String
    var placeholder:String
    var body: some View {
        VStack(alignment:.leading){
            Text(lable).font(.system(size: 20 , weight: .medium)).foregroundColor(Color("node"))
            TextField(placeholder, text: $text).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(Color("node"))
        }
    }
}

//#Preview {
//    input(text: <#Binding<String?>#>, placeholder: <#String#>)
//}
