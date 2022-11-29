//
//  MilestonePeriodSheet.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 29/11/22.
//

import SwiftUI

struct MilestonePeriodSheet: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text("Pilih Bulan")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.ui.primary)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                .font(.title)
                .fontWeight(.thin)
                .foregroundColor(Color.ui.primary)
            }
            .padding()
            .padding(.vertical, 8)
            
            Divider()
            
            ScrollView {
                ForEach(1..<25) { item in
                    Button {
                        // Insert function here
                        
                        dismiss()
                    } label: {
                        HStack {
                            Text("Bulan ke-\(item)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.ui.secondary)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.ui.primary)
                        }
                    }
                    .padding()
                    
                    Divider()
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
    
}

struct MilestonePeriodSheet_Previews: PreviewProvider {
    static var previews: some View {
        MilestonePeriodSheet()
    }
}
