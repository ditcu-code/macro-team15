//
//  RaporView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import SwiftUI

struct ReportView: View {
    var name = "Ceroy"
    @State private var monthPeriod = false
    @State private var monthVersusPeriod = false
    @State private var month: Int = 1
    @State private var monthVersus: Int = 0
    @State private var refreshId: Int = 1
    let noteCount = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                // MARK: Milestone Progress Header
                Text("Perkembangan Milestone\n\(name)")
                    .font(.title2.bold())
                    .foregroundColor(Color.ui.primary)
                    .multilineTextAlignment(.center)

                // MARK: Chart
                ZStack(alignment: .top) {
                    VStack {
                        HStack {
                            // Motor stats
                            VStack(alignment: .leading) {
                                Text("Motorik")
                                    .bold()
                                    .foregroundColor(Color.ui.motorPrimary)
                                Text("20 / 118").font(.footnote)
                            }

                            Spacer()

                            // Cognitive stats
                            VStack(alignment: .trailing) {
                                Text("Kognitif")
                                    .bold()
                                    .foregroundColor(Color.ui.cognitivePrimary)
                                Text("20 / 118").font(.footnote)
                            }
                        }

                        Spacer()

                        HStack {
                            // Social stats
                            VStack(alignment: .leading) {
                                Text("Sosial & Emosional")
                                    .bold()
                                    .foregroundColor(Color.ui.socialPrimary)
                                Text("20 / 118").font(.footnote)
                            }

                            Spacer()

                            // Language stats
                            VStack(alignment: .trailing) {
                                Text("Bahasa")
                                    .bold()
                                    .foregroundColor(Color.ui.languagePrimary)
                                Text("20 / 118").font(.footnote)
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Radar chart
                    RadarChart(
                        data: [9.0, 14.0, 15.0, 20.0],
                        dataVersus: [10.0, 18.0, 19.0, 23.0],
                        max: [12.0, 20.0, 25.0, 35.0],
                        gridColor: .black,
                        dataColor: Color.ui.primary.opacity(0.5)
                    ).frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 50)
                }

                // MARK: Compare Button
                HStack {
                    Button {
                        monthPeriod.toggle()
                    } label: {
                        VStack(spacing: 4) {
                            HStack {
                                Text("Bulan ke-1")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)

                                Image(systemName: "chevron.down")
                            }

                            Capsule()
                                .frame(height: 1)
                        }
                        .foregroundColor(Color.ui.primary)
                        .padding(.horizontal, 8)
                    }

                    Button {
                        monthVersusPeriod.toggle()
                    } label: {
                        VStack(spacing: 4) {
                            HStack {
                                Text("Bulan ke-2")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)

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
                .padding(.horizontal)

                // MARK: Summary message
                ZStack {
                    Color.white.cornerRadius(10).shadow(radius: 2)

                    HStack(spacing: 20) {
                        Image.ui.tuntunHead.resizable().frame(width: 72, height: 72)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Wah, Ceroy berkembang dengan baik!").font(.subheadline.bold()).foregroundColor(Color.ui.primary)
                            Text("Teruskan perkembangan di bulan selanjutnya").foregroundColor(Color.ui.text)
                        }
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal)
                }.padding()

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
                        EmptyView(note: "Belum ada catatan yang ditandai")
                    }
                }
                .padding(.bottom)
            }
            .navigationTitle("Rapor")
            .background(alignment: .center) {
                BackgroundView()
            }
            .sheet(isPresented: $monthPeriod) {
                MilestonePeriodSheetBinding(selectedMonth: $month)
            }
            .sheet(isPresented: $monthVersusPeriod) {
                MilestonePeriodSheetBinding(selectedMonth: $monthVersus)
            }
            
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
