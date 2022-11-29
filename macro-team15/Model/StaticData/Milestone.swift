//
//  Milestone.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 29/11/22.
//

import Foundation

struct ActivityMaterial: Hashable, Identifiable {
    var id: String
    
    var image: String
    var name: String
}

struct Milestone: Hashable, Identifiable {
    let id: Int
    
    let titleEN: String
    let title: String
    let month: Int
    let warningMonth: Int
    let category: MilestoneCategory
    let stimulusID: [String]?
}

struct Stimulus: Hashable, Identifiable {
    let id: String
    let type: String
    let activityName: String?
    let activities: [String]?
    let materials: [ActivityMaterial]?
    let categories: [MilestoneCategory]?
}

class MilestoneData {
    static func getAll() -> [Milestone] {
        return [
            Milestone(
                id: 1,
                titleEN: "Chin up in prone position",
                title: "Mengangkat dagu saat berada posisi tengkurap",
                month: 1,
                warningMonth: 2,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 2,
                titleEN: "Turns head in supine position",
                title: "Bisa menggerakkan kepala dari kiri/kanan ke tengah saat sedang telentang",
                month: 1,
                warningMonth: 2,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 3,
                titleEN: "Hands fisted near face",
                title: "Bisa menggepal tengan dekat muka",
                month: 1,
                warningMonth: 2,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 4,
                titleEN: "Sucks well",
                title: "Menghisap dengan baik",
                month: 1,
                warningMonth: 2,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 5,
                titleEN: "Gazes at black- white objects",
                title: "Menatap objek berwarna hitam putih",
                month: 1,
                warningMonth: 2,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 6,
                titleEN: "Follows face",
                title: "Menatap muka anda",
                month: 1,
                warningMonth: 2,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 7,
                titleEN: "Discriminates mother’s voice",
                title: "Mengenali suara ibu",
                month: 1,
                warningMonth: 2,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id: 8,
                titleEN: "Cries out of distress",
                title: "Mengangis saat resah",
                month: 1,
                warningMonth: 2,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id: 9,
                titleEN: "Startles to voice/sound",
                title: "Bereaksi terkejut terhadap suara",
                month: 1,
                warningMonth: 2,
                category: .language,
                stimulusID: []
            ),
            Milestone(
                id: 10,
                titleEN: "Throaty noises",
                title: "Mendengus atau mendengkur",
                month: 1,
                warningMonth: 2,
                category: .language,
                stimulusID: []
            ),
            Milestone(
                id: 11,
                titleEN: "Chest up in prone position",
                title: "Mengangkat dada saat posisi tengkurap",
                month: 2,
                warningMonth: 3,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 12,
                titleEN: "Head bobs when held in sitting position",
                title: "Kepala terayun-ayun saat dipegang dalam posisi duduk",
                month: 2,
                warningMonth: 3,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 13,
                titleEN: "Hands unfisted 50% of the time",
                title: "Sesekali, bayi tidak mengepalkan tangan",
                month: 2,
                warningMonth: 4,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 14,
                titleEN: "Retains rattle if placed in hand",
                title: "Bisa memegang benda kalau ditaruh di dalam genggaman bayi",
                month: 2,
                warningMonth: 3,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 15,
                titleEN: "Holds hands together",
                title: "Bisa memegang tangan sendiri",
                month: 2,
                warningMonth: 3,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 16,
                titleEN: "Opens mouth at sight of breast or bottle",
                title: "Membuka mulut saat melihat payudara atau botol susu",
                month: 2,
                warningMonth: 3,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 17,
                titleEN: "Visual threat present",
                title: "Refleks berkedip atau kaget bila ada ancaman yang terlihat (contoh: tangan yang bergerak cepat di depan muka bayi)",
                month: 2,
                warningMonth: 3,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 18,
                titleEN: "Follows large, highly contrasting objects",
                title: "Mengikuti benda  besar yang memiliki kontras warna yang tinggi (contoh: hitam dan putih)",
                month: 2,
                warningMonth: 3,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 19,
                titleEN: "Recognizes mother",
                title: "Mengenali ibu",
                month: 2,
                warningMonth: 3,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 20,
                titleEN: "Reciprocal smiling: responds to adult voice and smile",
                title: "Senyum (merespon) saat diajak bicara",
                month: 2,
                warningMonth: 3,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id: 21,
                titleEN: "Alerts to voice/sound",
                title: "Bereaksi pada suara",
                month: 2,
                warningMonth: 3,
                category: .language,
                stimulusID: []
            ),
            Milestone(
                id: 22,
                titleEN: "Coos",
                title: "Mengeluarkan suara dengungan (contoh: ngaa atau eemm)",
                month: 2,
                warningMonth: 3,
                category: .language,
                stimulusID: []
            ),
            Milestone(
                id: 23,
                titleEN: "Social smile (6 weeks)",
                title: "Senyum ramah",
                month: 2,
                warningMonth: 3,
                category: .language,
                stimulusID: []
            ),
            Milestone(
                id: 24,
                titleEN: "Vowel-like noises",
                title: "Bersuara satu silabel (contoh: ooh atau aah)",
                month: 2,
                warningMonth: 3,
                category: .language,
                stimulusID: []
            ),
            Milestone(
                id: 25,
                titleEN: "Props on fore- arms in prone position",
                title: "Mengangkat badan dengan lengan saat posisi tengkurap",
                month: 3,
                warningMonth: 4,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 26,
                titleEN: "Rolls to side",
                title: "Berbalik ke samping",
                month: 3,
                warningMonth: 4,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 27,
                titleEN: "Inspects fingers",
                title: "Memerhatikan jari sendiri",
                month: 3,
                warningMonth: 4,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 28,
                titleEN: "Bats at objects",
                title: "Mengedip saat Melihat benda",
                month: 3,
                warningMonth: 4,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id: 29,
                titleEN: "Brings hands to mouth",
                title: "Mendekatkan tangan ke mulut",
                month: 3,
                warningMonth: 4,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 30,
                titleEN: "Reaches for face",
                title: "Ingin memegang muka orang lain",
                month: 3,
                warningMonth: 4,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 31,
                titleEN: "Follows objects in circle (in supine position)",
                title: "Mengikut benda yang bergerak berputar saat bayi sedang telentang",
                month: 3,
                warningMonth: 4,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 32,
                titleEN: "Regards toys",
                title: "Mengenali mainan",
                month: 3,
                warningMonth: 4,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id: 33,
                titleEN: "Expression of disgust (sour taste, loud sound)",
                title: "Menunjukkan ketidaksukaan (pada rasa asam dan suara bising)",
                month: 3,
                warningMonth: 4,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id: 34,
                titleEN: "Visually follows person who is moving across a room",
                title: "Mata bayi memerhatikan orang yang sedang berlalu lalang",
                month: 3,
                warningMonth: 4,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id: 35,
                titleEN: "Regards speaker",
                title: "Memerhatikan orang yang sedang berbicara",
                month: 3,
                warningMonth: 4,
                category: .language,
                stimulusID: []
            ),
            Milestone(
                id: 36,
                titleEN: "Chuckles",
                title: "Tertawa kecil",
                month: 3,
                warningMonth: 4,
                category: .language,
                stimulusID: []
            ),
            Milestone(
                id: 37,
                titleEN: "Vocalizes when talked to",
                title: "Bersuara saat diajak bicara",
                month: 3,
                warningMonth: 4,
                category: .language,
                stimulusID: []
            ),
            
        ]
    }
}
