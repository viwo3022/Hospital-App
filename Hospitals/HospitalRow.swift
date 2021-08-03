//
//  HospitalRow.swift
//  Hospitals
//
//  Created by Vienna Wong on 7/28/21.
//

import Foundation
import SwiftUI

struct HospitalRow: View {
    var hospitalName: String
    
    var body: some View {
        
        HStack {
            Spacer().frame(width: 16)
            Text(hospitalName)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color("gray"))
            Spacer().frame(width: 24)
        }
        .padding(.vertical, 16)
        
    }
}
struct HospitalRow_Previews: PreviewProvider {
    static var previews: some View {
        HospitalRow(hospitalName: "hospital name")
    }
}
