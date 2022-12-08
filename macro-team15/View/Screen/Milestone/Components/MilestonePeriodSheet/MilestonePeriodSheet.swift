//
//  MilestonePeriodSheet.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 29/11/22.
//

import SwiftUI

struct MilestonePeriodSheet: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = MilestonePeriodSheetViewModel()
    @Namespace var topID
    
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
            
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(vm.months, id: \.self) { item in
                        let isSameMonth = vm.appData.selectedMonth == item
                        
                        Button {
                            UserDefaults.standard.set(item, forKey: "selectedMonth")
                            dismiss()
                        } label: {
                            HStack {
                                Text("Bulan ke-\(item)")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.ui.secondary)
                                
                                Spacer()
                                
                                Image(systemName: isSameMonth ? "play.fill" : "chevron.right")
                                    .foregroundColor(Color.ui.primary)
                            }
                            
                        }
                        .id(isSameMonth ? topID : nil)
                        .padding()
                        .background {
                            Color.ui.primary.opacity(isSameMonth ? 0.1 : 0)
                        }
                        .onAppear{
                            if isSameMonth {
                                withAnimation {
                                    proxy.scrollTo(topID)
                                }
                            }
                        }
                        
                        Divider()
                    }
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
    
}

//struct MilestonePeriodSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        MilestonePeriodSheet()
//    }
//}


struct MilestonePeriodSheetBinding: View {
    
    @Binding var selectedMonth: Int
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = MilestonePeriodSheetViewModel()
    @Namespace var focusItem
    
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
            
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(vm.months, id: \.self) { item in
                        let isSameMonth = selectedMonth == item
                        let isDisabled = item > vm.appData.babyAgeMonth
                        Button {
                            selectedMonth = item
                            dismiss()
                        } label: {
                            HStack {
                                Text("Bulan ke-\(item)")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(isDisabled ? Color.ui.secondary.opacity(0.5) : Color.ui.secondary)
                                
                                Spacer()
                                
                                Image(systemName: isSameMonth ? "play.fill" : "chevron.right")
                                    .foregroundColor(Color.ui.primary)
                            }
                            
                        }
                        .id(isSameMonth ? focusItem : nil)
                        .padding()
                        .background {
                            Color.ui.primary.opacity(isSameMonth ? 0.1 : 0)
                        }
                        .disabled(isDisabled)
                        .onAppear{
                            if isSameMonth {
                                withAnimation {
                                    proxy.scrollTo(focusItem)
                                }
                            }
                        }
                        
                        Divider()
                    }
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
    
}
