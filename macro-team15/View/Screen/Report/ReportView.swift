//
//  RaporView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import SwiftUI

struct ReportView: View {
    var name = "Ceroy"
    @State private var refreshId: Int = 1
    
    @ObservedObject var vm = ReportViewModel()
    
    @State private var scaleMonth: Double = 0.0
    @State private var scaleVersus: Double = 0.0
    
    let noteCount = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                // MARK: Milestone Progress Header
                Text("Perkembangan Milestone\n\(vm.appData.currentBabyName)")
                    .font(.custom(FontType.semiBold.rawValue, fixedSize: 24))
                    .foregroundColor(Color.ui.primary)
                    .multilineTextAlignment(.center)
                
                // MARK: Chart
                ZStack(alignment: .top) {
                    VStack {
                        HStack {
                            // Motor stats
                            VStack(alignment: .leading) {
                                Text("Motorik")
                                    .font(.custom(FontType.semiBold.rawValue, fixedSize: 16))
                                    .foregroundColor(Color.ui.motorPrimary)
                                Text("\(vm.motoricCount) / \(vm.motoricTotal)")
                                    .font(.custom(FontType.regular.rawValue, fixedSize: 14))
                                    .foregroundColor(Color.ui.text)
                            }
                            
                            Spacer()
                            
                            // Cognitive stats
                            VStack(alignment: .trailing) {
                                Text("Kognitif")
                                    .font(.custom(FontType.semiBold.rawValue, fixedSize: 16))
                                    .foregroundColor(Color.ui.cognitivePrimary)
                                Text("\(vm.cognitiveCount) / \(vm.cognitiveTotal)")
                                    .font(.custom(FontType.regular.rawValue, fixedSize: 14))
                                    .foregroundColor(Color.ui.text)
                            }
                        }
                        
                        Spacer()
                        
                        HStack {
                            // Social stats
                            VStack(alignment: .leading) {
                                Text("Sosial & Emosional")
                                    .font(.custom(FontType.semiBold.rawValue, fixedSize: 16))
                                    .foregroundColor(Color.ui.socialPrimary)
                                Text("\(vm.socialCount) / \(vm.socialTotal)")
                                    .font(.custom(FontType.regular.rawValue, fixedSize: 14))
                                    .foregroundColor(Color.ui.text)
                            }
                            
                            Spacer()
                            
                            // Language stats
                            VStack(alignment: .trailing) {
                                Text("Bahasa")
                                    .font(.custom(FontType.semiBold.rawValue, fixedSize: 16))
                                    .foregroundColor(Color.ui.languagePrimary)
                                Text("\(vm.languageCount) / \(vm.languageTotal)")
                                    .font(.custom(FontType.regular.rawValue, fixedSize: 14))
                                    .foregroundColor(Color.ui.text)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Radar chart
                    RadarChart(
                        data: [vm.motoricMonth, vm.socialMonth, vm.cognitiveMonth, vm.languageMonth],
                        dataVersus: vm.monthVersus != 0 ? [vm.motoricVersus, vm.socialVersus, vm.cognitiveVersus, vm.languageVersus] : [],
                        max: [vm.motoricTotal, vm.socialTotal, vm.cognitiveTotal, vm.languageTotal],
                        gridColor: .black,
                        dataColor: Color.ui.primary.opacity(0.5),
                        scaleMonth: $scaleMonth,
                        scaleVersus: $scaleVersus
                    )
                    .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 50)
                    .id(refreshId)
                    .onAppear{
                        vm.getCountMonth()
                    }
                }
                
                // MARK: Compare Button
                HStack {
                    Button {
                        vm.monthPeriodSheet.toggle()
                    } label: {
                        VStack(spacing: 4) {
                            HStack {
                                Text("Bulan ke-\(vm.month)")
                                    .font(.custom(FontType.regular.rawValue, fixedSize: 16))
                                
                                Image(systemName: "chevron.down")
                            }
                            
                            Capsule()
                                .frame(height: 1)
                        }
                        .foregroundColor(Color.ui.primary)
                        .padding(.horizontal, 8)
                    }
                    
                    Button {
                        vm.monthVersusPeriodSheet.toggle()
                    } label: {
                        VStack(spacing: 4) {
                            HStack {
                                Text("Bulan ke-\(vm.monthVersus)")
                                    .font(.custom(FontType.regular.rawValue, fixedSize: 16))
                                
                                Image(systemName: "chevron.down")
                            }
                            
                            Capsule()
                                .frame(height: 1)
                        }
                        .foregroundColor(Color.ui.primary)
                        .padding(.horizontal, 8)
                    }
                }
                .frame(height: 70)
                .padding()
                
                // MARK: Summary message
                ZStack {
                    Color.white.cornerRadius(10).shadow(radius: 2)
                    
                    HStack(spacing: 20) {
                        Image.ui.tuntunHead.resizable().frame(width: 72, height: 72)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Wah, Ceroy berkembang dengan baik!")
                                .font(.custom(FontType.semiBold.rawValue, fixedSize: 16))
                                .foregroundColor(Color.ui.primary)
                            Text("Teruskan perkembangan di bulan selanjutnya")
                                .foregroundColor(Color.ui.text)
                                .font(.custom(FontType.light.rawValue, fixedSize: 14))
                        }
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                Divider().padding(.horizontal)
                
                // MARK: Milestone Category Progress
                VStack {
                    // Motor
                    ForEach(0 ..< 4) { item in
                        MilestoneCategoryCardViewV2(category: .motoric, milestone: [Milestone(id: 1, titleEN: "titleEN", title: "title", month: 1, warningMonth: 2, category: .motoric, stimulusID: nil)])
                        
                        if item != 3 {
                            Divider()
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                )
                .padding([.top, .horizontal])
                
                Divider()
                    .padding()
                
                ContentHeaderView(title: "Catatan", subtitle: "Hal-hal penting mengenai perkembangan Ceroy", navigationLink: AnyView(Text("Catatan")))
                
                VStack(spacing: 20) {
                    if noteCount > 0 {
                        ForEach(0 ..< noteCount) { item in
                            NoteView(title: "\"Judul Catatan", description: "Isi catatan", date: Date(), navigationLink: AnyView(NoteDetailView(title: "Judul catatan", note: "Isi catatan")))
                        }
                    } else {
                        HStack {
                            Image.ui.tuntunNoNote
                                .resizable()
                                .frame(width: 378/3, height: 438/3)
                                .padding(.horizontal)
                            
                            Text("Belum ada catatan yang ditandai")
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(Color.ui.secondary)
                        }
                        .padding(.top)
                    }
                }
                .padding(.bottom)
            }
            .navigationTitle("Rapor")
            .background(alignment: .center) {
                BackgroundView()
            }
            .sheet(isPresented: $vm.monthPeriodSheet) {
                MilestonePeriodSheetBinding(selectedMonth: $vm.month)
            }
            .sheet(isPresented: $vm.monthVersusPeriodSheet) {
                MilestonePeriodSheetBinding(selectedMonth: $vm.monthVersus)
            }
            .onChange(of: vm.month) { newValue in
                withAnimation(.spring()) {
                    vm.getCountMonth()
                    scaleMonth = 0.0
                    refreshId += 1
                }
            }
            .onChange(of: vm.monthVersus) { newValue in
                withAnimation(.spring()) {
                    vm.getCountVersus()
                    scaleVersus = 0.0
                    refreshId += 1
                }
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
