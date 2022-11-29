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
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Perkembangan Milestone\n\(name)")
                        .font(.title2.bold())
                        .foregroundColor(Color.ui.primary)
                        .multilineTextAlignment(.center)
                    ZStack(alignment: .top) {
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Motorik")
                                        .bold()
                                        .foregroundColor(Color.ui.motorPrimary)
                                    Text("20 / 118").font(.footnote)
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("Kognitif")
                                        .bold()
                                        .foregroundColor(Color.ui.cognitivePrimary)
                                    Text("20 / 118").font(.footnote)
                                }
                            }
                            Spacer()
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Sosial & Emosional")
                                        .bold()
                                        .foregroundColor(Color.ui.socialPrimary)
                                    Text("20 / 118").font(.footnote)
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("Bahasa")
                                        .bold()
                                        .foregroundColor(Color.ui.languagePrimary)
                                    Text("20 / 118").font(.footnote)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        RadarChart(
                            data: [9.0, 14.0, 15.0, 20.0],
                            dataVersus: [10.0, 18.0, 19.0, 23.0],
                            max: [12.0, 20.0, 25.0, 35.0],
                            gridColor: .black,
                            dataColor: Color.ui.primary.opacity(0.5)
                        ).frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 50)
                    }
                    
                    HStack {
                        Button {
                            monthPeriod.toggle()
                        } label: {
                            Text("Bulan ke-2").frame(maxWidth: .infinity)
                        }.buttonStyle(SmallGreenButtonStyle())
                        
                        Button {
                            monthVersusPeriod.toggle()
                        } label: {
                            Text("Pilih Bulan").frame(maxWidth: .infinity)
                        }.buttonStyle(SmallGreenButtonStyle())
                    }
                    .frame(height: 70)
                    .padding(.horizontal)
                    
                    Divider().padding(.horizontal)
                    
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
                }
            }
            .navigationTitle("Rapor")
            .background(alignment: .center) {
                Image("BackgroundFill1Image")
                Image("BackgroundFill2Image")
            }
            .sheet(isPresented: $monthPeriod) {
                MilestonePeriodSheet(selectedMonth: $month)
            }
            .sheet(isPresented: $monthVersusPeriod) {
                MilestonePeriodSheet(selectedMonth: $monthVersus)
            }
            
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}

