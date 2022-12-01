//
//  InputData.swift
//  InputDataTuntun
//
//  Created by Aditya Cahyo on 30/11/22.
//


import Foundation
import SwiftUI

struct ActivityMaterial: Hashable, Identifiable {
    var id: Int
    
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
    let stimulusID: [Int]?
}

struct Stimulus: Hashable, Identifiable {
    let id: Int
    
    let type: StimulusType
    let categories: [MilestoneCategory]
    let activityName: String
    let activities: [String]
    let materials: [Int]?
}

class MaterialData {
    static func getAll() -> [ActivityMaterial]{
        return [
            ActivityMaterial(id: 1, image: "" , name: "Buku Cerita"),
            ActivityMaterial(id: 2, image: "" , name: "Mainan (Contoh: Bola, Mobil-mobilan, Boneka)"),
            ActivityMaterial(id: 3, image: "" , name: "Mainan Berbunyi (Contoh: Krincingan, Alat Musik, dll)"),
            ActivityMaterial(id: 4, image: "" , name: "Main Berwarna Cerah/Kontras (Contoh: Puzzle, Kubus, Lego, dll)"),
            ActivityMaterial(id: 5, image: "" , name: "Mainan sensory (Contoh: Slime, Pasir, Biskuit, Beras, dll)"),
            ActivityMaterial(id: 6, image: "" , name: "Mainan edukasi (Contoh: Poster bergambar, Kartu bergambar)"),
            ActivityMaterial(id: 7, image: "" , name: "Cermin"),
            ActivityMaterial(id: 8, image: "" , name: "Musik"),
            ActivityMaterial(id: 9, image: "" , name: "Botol"),
            ActivityMaterial(id: 10, image: "" , name: "Playmatt dengan mainan"),
            ActivityMaterial(id: 11, image: "" , name: "Furniture babyproof (Opsional)"),
            ActivityMaterial(id: 12, image: "" , name: "Bantalan/Senderan"),
            ActivityMaterial(id: 13, image: "" , name: "Alat tulis dan menggambar (Contoh: pensil warna, pensil, krayon, kertas, dll)"),
            ActivityMaterial(id: 14, image: "" , name: "Hiasan kamar berwarna cerah/kontras"),
            ActivityMaterial(id: 15, image: "" , name: "Alat makan yang babyproof (Contoh: terbuat dari plastik, tumpul, berlabel Foodgrade)"),
        ]
    }
}


class StimulusData {
    static func getAll() -> [Stimulus] {
        return [
            Stimulus(
                id: 1,
                type: .activity,
                categories: [.cognitive, .language],
                activityName: "Berkomunikasi dan bermain dengan anak",
                activities: [ "Memperlihatkan ekspresi muka jelek",
                              "Mengeluarkan bunyi mirip hewan-hewan",
                              "Bermain cilukba",
                              "Ketika melakukan hal diatas, pastikan ayah bunda juga tertawa agar bayi mengerti hal tersebut adalah humor" ,],
                materials: []
            ),
            Stimulus(
                id: 2,
                type: .activity,
                categories: [.cognitive, .language, .social],
                activityName: "Berkomunikasi dengan anak",
                activities: [ "Senyumlah sesering mungkin kepada bayi.",
                              "Tatap mata bayi setiap kali ayah bunda mengganti popoknya, menyusui, atau saat ia akan tidur.",
                              "Respons bayi setiap kali ia mengucapkan sesuatu dengan meniru apa yang ia ucapkan, meskipun kata-katanya belum jelas, seperti ma-ma atau bu-bu.",
                              "Bicara sesering mungkin dengan kalimat yang pendek dan vokal yang jelas, misalnya Kamu mau makan?, Wah, dingin, ya?, atau Ayah pulang! dengan penuh ekspresi.",
                              "Lihat dan tunjuk benda yang sedang ayah bunda bicarakan, agar bayi dapat dengan cepat mengasosiasikan kata yang ayah bunda ucapkan dengan benda yang dimaksud.",
                              "Ulangi kata-kata sederhana tertentu secara terus-menerus, seperti mama dan makan.",
                              "Gunakan gerakan-gerakan tubuh untuk menguatkan kata-kata ayah bunda, seperti mengepakkan tangan ketika mengucapkan kata burung atau membentangkan tangan saat mengucapkan kata pesawat.", ],
                materials: []
            ),
            Stimulus(
                id: 3,
                type: .activity,
                categories: [.cognitive, .language, .social],
                activityName: "Berkomunikasi dengan anak - Level II",
                activities: [ "Tatap mata anak dan ajak anak berbicara",
                              "Bercerita menggunakan bahasa dengan kosakata yang mudah diikuti dan mengerti",
                              "Ayah bunda bisa menggunakan bantuan buku cerita bergambar atau kartu bergambar",
                              "Ayah bunda juga bisa menunjuk benda di sekitar",
                              "Ulangi kata / nama dari benda yang ada di gambar beberapa kali",
                              "Berikan respon saat bayi berusaha mengeluarkan suara", ],
                materials: [44567]
            ),
            Stimulus(
                id: 4,
                type: .activity,
                categories: [.cognitive, .language, .social],
                activityName: "Berkomunikasi dengan anak (instruktif)",
                activities: [ "Tarik perhatian anak dengan cara menatap atau memegang anak",
                              "Berbicaralah dengan nada suara yang tenang dan lembut",
                              "Berikan anak arahan dengan kalimat yang jelas “Pakai dulu yuk nak bajunya”",
                              "Berbicara lah dengan perlahan (tidak terlalu cepat)",
                              "Bantu dengan petunjuk visual (Contoh: “Pinjem dulu ayah/ bunda mainannya nak” sambil menadahkan tanggan)", ],
                materials: []
            ),
            Stimulus(
                id: 5,
                type: .activity,
                categories: [.cognitive, .social],
                activityName: "Berkomunikasi dengan anak (memperkenalkan diri)",
                activities: [ "Tunjuk diri ayah bunda sendiri dan katakan “mama” atau “papa”",
                              "Pegang tangan bayi dan katakan \"mama/papa memegang tanganmu\"",
                              "Cium bayi dan katakan “Adik dicium mama/papa”",
                              "Minta bayi untuk menunjuk “mama/papa? dan lihat apakah dia menunjukmu. Ini mungkin akan membutuhkan banyak latihan, jadi jangan berkecil hati jika bayi tidak langsung menunjuk. Terus berlatih dan bayi akan memahaminya.", ],
                materials: []
            ),
            Stimulus(
                id: 6,
                type: .activity,
                categories: [.social],
                activityName: "Berlalu lalang di depan bayi",
                activities: [ "Bergerak atau jalan saat sedang berada diruangan yang sama dengan bayi",
                              "Pastikan bayi bisa melihat pergerakan ayah bunda",
                              "Ajak bayi bicara selagi ayah bunda bergerak agar fokus bayi tidak berpindah dari ayah bunda",],
                materials: []
            ),
            Stimulus(
                id: 7,
                type: .activity,
                categories: [.motoric, .cognitive, .social],
                activityName: "Bermain dengan anak (dengan mainan)",
                activities: [ "Pastikan bayi memiliki mainan yang aman - luangkan waktu untuk bermain dengan bayi",
                              "Pegang mainan sedikit jauh dari badan bayi agar ia memiliki ruang",
                              "Coba dengan beberapa mainan - gunakan mainan yang sangat ia sukai",
                              "Letakkan mainan di lantai agak jauh dari bayi",
                              "Biarkan bayi mengambil mainan sendiri tanpa di bantu",],
                materials: [2, 3, 4, 5, 6]
            ),
            Stimulus(
                id: 8,
                type: .activity,
                categories: [.motoric, .cognitive, .social],
                activityName: "Bermain dengan anak (interaktif)",
                activities: [ "Luangkan waktu untuk bermain dengan bayi",
                              "Pastikan mainan yang digunakan aman untuk bayi",
                              "Gunakan mainan sesuai fungsinya (melempar / menggelindingkan bola, menjalankan mobil-mobilan / kereta mainan, atau bermain dengan boneka)",
                              "Berikan bayi ruang untuk berekspresi (contoh: bayi menerbangkan mobil-mobilannya)",
                              "Gunakan kesempatan ini untuk mengenalkan bayi pada benda dan fungsinya", ],
                materials: [2]
            ),
            Stimulus(
                id: 9,
                type: .activity,
                categories: [.language],
                activityName: "Bermain dengan anak (Musik)",
                activities: [ "Luangkan waktu bersama anak",
                              "Pastikan lingkungan sekitar aman (contoh: tidak ada benda tajam)",
                              "Pasang Musik yang baik untuk anak (contoh: musik klasik, atau lagu anak anak, lagu dengan beat yang enak)", ],
                materials: [8]
            ),
            Stimulus(
                id: 10,
                type: .activity,
                categories: [.cognitive, .language],
                activityName: "Bermain mandiri (dengan cermin)",
                activities: [ "Letakkan cermin saat bayi sedang melakukan kegiatan “tummy time”",
                              "Ayah Bunda juga bisa memegang cermin saat bayi sedang telentang sambil mengajak bayi berbicara",
                              "Ayah Bunda bisa gunakan cermin dengan sanggahan yang bisa di letakkan saat bayi telentang ataupun dalam posisi duduk.", ],
                materials: [7]
            ),
            Stimulus(
                id: 11,
                type: .activity,
                categories: [.motoric, .cognitive],
                activityName: "Gantung mainan di hadapan anak",
                activities: [ "Letakan bayi terlentang diatas playmatt atau kasur",
                              "Gantung mainan berwarna kontras dihadapannnya (Berikan jarak 20-30 cm)",
                              "Berikan anak waktu bereksplorasi", ],
                materials: [10]
            ),
            Stimulus(
                id: 12,
                type: .activity,
                categories: [.motoric],
                activityName: "Latihan Berdiri",
                activities: [ "Posisikan bayi pada posisi duduk",
                              "Perlahan tarik kedua tangan hingga posisi berdiri",
                              "Lakukan gerakan ini didepan cermin, sehingga bayi bisa melihat dirinya melakukan hal itu dan termotivasi melakukannya lagi",
                              "Ketika bayi sudah lebih pintar, Ayah Bunda bisa memposisikan bayi dalam posisi duduk dengan kedua tangannya berada di depan tubuhnya. Posisi ini akan membantu bayi menopang tubuhnya sendiri untuk berdiri tanpa bantuan",
                              "Bila kedua tangan dan kakinya belum cukup kuat menahan tubuhnya sendiri, bantu ia dengan menyelipkan kedua tangan Ayah Bunda di bawah ketiak bayi guna menopang tubuhnya", ],
                materials: [7]
            ),
            Stimulus(
                id: 13,
                type: .activity,
                categories: [.motoric, .cognitive],
                activityName: "Latihan Berjalan",
                activities: [ "Perlahan tarik kedua tangan hingga posisi berdiri",
                              "Bila kedua tangan dan kakinya belum cukup kuat menahan tubuhnya sendiri, bantu ia dengan menyelipkan kedua tangan Ayah bunda di bawah ketiak bayi guna menopang tubuhnya",
                              "Pastikan lingkungan sekitar babyproof dan aman dari segala benda tajam",
                              "Arahkan bayi dengan nada suara yang tenang dan lembut sambil mendorongnya kedepan perlahan (Contoh: “Ayok nak maju kakinya pelan-pelan”)",
                              "Ketika bayi sudah lebih kuat, Ayah bunda bisa membantu bayi berjalan dengan memegang kedua tangannya",
                              "Bila bayi sudah bisa berjalan dengan lebih lancar, Ayah bunda bisa membantu bayi dengan Hanya memegangi salah satu tangannya saja", ],
                materials: [11]
            ),
            Stimulus(
                id: 14,
                type: .activity,
                categories: [.motoric],
                activityName: "Latihan Duduk Level I",
                activities: [ "Dudukan bayi di pangkuan ayah bunda", ],
                materials: []
            ),
            Stimulus(
                id: 15,
                type: .activity,
                categories: [.motoric],
                activityName: "Latihan Duduk Level II",
                activities: [ "Dudukan bayi di kasur atau tempat dengan alas yang empuk",
                              "Jaga bayi dengan bantalan di sekelilingnya", ],
                materials: [12]
            ),
            Stimulus(
                id: 16,
                type: .activity,
                categories: [.motoric, .cognitive],
                activityName: "Latihan Duduk Level III",
                activities: [ "Posisikan bayi tidur terlentang",
                              "Perlahan tarik kedua tangan hingga posisi duduk",
                              "Lakukan gerakan ini didepan cermin, sehingga bayi bisa melihat dirinya melakukan hal itu dan termotivasi melakukannya lagi",
                              "Ketika bayi sudah lebih pintar, Ayah Bunda bisa memposisikan bayi dalam posisi duduk dengan kedua tangannya berada di depan tubuhnya. Posisi ini akan membantu bayi menopang tubuhnya sendiri tanpa bantuan",
                              "Bila kedua tangannya belum cukup kuat menahan tubuhnya sendiri, bantu ia dengan menyelipkan kedua tangan Ayah Bunda di bawah ketiak bayi guna menopang tubuhnya", ],
                materials: [7]
            ),
            Stimulus(
                id: 17,
                type: .activity,
                categories: [.motoric],
                activityName: "Latihan Gambar / Menulis",
                activities: [ "Sediakan alat tulis (contoh: krayon, pensil mewarnai, koas, kertas, dll) yang aman",
                              "Sediakan tempat yang layak (contoh: meja dan kursi kecil / alas lantai)",
                              "Temani bayi sambil ajari Tentang warna dan perbedaan fungsi setiap alat",
                              "Contohkan hal mudah seperti coret coret, gambar garis lurus, gambar bentuk (kotak, bulat), gambar hal sehari hari (pohon atau burung)",
                              "Apresiasi hasil gambar / tulisan bayi", ],
                materials: [13]
            ),
            Stimulus(
                id: 18,
                type: .activity,
                categories: [.motoric, .cognitive],
                activityName: "Latihan Kemandirian",
                activities: [ "Sediakan gelas, piring, sendok, garpu dan alat makan lainnya yang aman untuk bayi",
                              "Dudukan bayi di kursi makan dan alaskan / alaskan tempat makan bayi.",
                              "Berikan bayi makanan yang sudah dipotong kecil kecil ataupun di haluskan",
                              "Isi gelas bayi dengan cairan yang tidak terlalu penuh (setengah saja)",
                              "Berikan bayi instruksi untuk makan / minum / menggunakan alat makan dengan kata kata dan juga gestur",
                              "Awasi bayi dan pastikan semuanya aman", ],
                materials: [15]
            ),
            Stimulus(
                id: 19,
                type: .activity,
                categories: [.motoric, .cognitive, .social],
                activityName: "Latihan Kemandirian II",
                activities: [ "Ajarkan bayi fungsi dari benda yang ia pakai dan tempat menyimpannya (contoh: sepatu diapakai saat keluar dan dilepas saat masuk rumah dan disimpan di rak sepatu dekat pintu)",
                              "Contohkan dengan kebiasaan Ayah Bunda memakai dan melepaskan benda tersebut",
                              "Lakukan hal diatas secara berulang-ulang",
                              "Ingatkan bayi untuk melakukan (melepas dan memakai) dengan Sabar",
                              "Berikan bayi ruang untuk melakukannya sendiri, namun tawarkan bantuan Jika bayi terlihat kesulitan.", ],
                materials: [6]
            ),
            Stimulus(
                id: 20,
                type: .activity,
                categories: [.cognitive],
                activityName: "Melatih kemampuan visual",
                activities: [ "Hiasi kamar bayi dengan warna cerah dan pola yang berkontras tinggi",
                              "Luangkan waktu untuk berkomunikasi dan berinteraksi dengan Bayi",
                              "Ajak bayi keluar untuk melihat tempat baru (contoh: taman)",
                              "Bermain cilukba dengan bayi",
                              "Redupkan lampu di malam hari dan waktu tidur Siang",
                              "Letakkan mainan (besar ataupun kecil) dalam jarak pandang dan jangkauannya",
                              "Ajak bayi berbicara saat Ayah Bunda Bergerak sekeliling ruangan agar bayi mengikuti pergerakan Ayah Bunda", ],
                materials: [14, 2, 3, 4]
            ),
            Stimulus(
                id: 21,
                type: .activity,
                categories: [.cognitive],
                activityName: "Memberikan payudara atau botol susu",
                activities: [ "Dekap bayi dalam gendongan ayah bunda",
                              "Tunjukkan payudara atau botol pada bayi"],
                materials: [9]
            ),
            Stimulus(
                id: 22,
                type: .activity,
                categories: [.motoric],
                activityName: "Pijit telapak tangan bayi",
                activities: [ "Gunakan ibu jari ayah bunda untuk memijat tangan bayi",
                              "Mulai dari bagian tengah telapak tangan ke arah luar dengan gerakan memutar",
                              "Kalau ibu jari bayi di dalam genggamananya, pijat hingga terbuka menggunakan ibu jari ayah bunda."],
                materials: []
            ),
            Stimulus(
                id: 23,
                type: .activity,
                categories: [.cognitive],
                activityName: "Membantu Bayi Manghisap Dengan Baik ",
                activities: [ "Cuci tangan ayah bunda",
                              "Pastikan kuku ayah bunda halus dan pendek.",
                              "Usap bagian tengah bibir bawah bayi ayah bunda dengan jari telunjuk ayah bunda untuk membuka mulutnya lebar-lebar.",
                              "Saat bayi ayah bunda membuka mulutnya, letakkan jari ayah bunda, dengan sisi kuku menghadap ke bawah, ke bagian depan mulut bayi.",
                              "Bayi akan menghisap jari ayah bunda ke dalam mulutnya.",
                              "Jika lidah bayi tidak melengkung di sekitar jari ayah bunda, usap langit-langit mulut bayi, lalu tekan dengan lembut bagian belakang lidah bayi sambil membelai lidahnya ke depan. Ini akan menarik jari ayah bunda sedikit keluar dari mulut bayi.",
                              "Biarkan dia mengisapnya kembali.",
                              "Ulangi latihan ini 3 kali atau sampai ayah bunda merasakan lidah maju melewati gusi.", ],
                materials: []
            ),
            Stimulus(
                id: 24,
                type: .activity,
                categories: [.language, .social],
                activityName: "Cara menenangkan bayi yang resah",
                activities: [ "Timang bayi ayah bunda, baik di kursi goyang atau di lengan ayah bunda.",
                              "Belai kepala bayi dengan lembut atau tepuk punggung atau dadanya",
                              "Bedong yang aman (membungkusnya dengan selimut)",
                              "Bernyanyi atau berbicara",
                              "Memainkan musik lembut",
                              "Membawanya dalam gendongan atau kereta dorong.",
                              "Suara yang beriaram atau \"white noise\"",
                              "Bantu bayi bersendawa",
                              "Mandi air hangat (kebanyakan bayi suka ini, tapi tidak semua)", ],
                materials: [8]
            ),
            Stimulus(
                id: 25,
                type: .activity,
                categories: [.motoric],
                activityName: "Tummy time",
                activities: [ "Lakukan tummy time di tempat yang datar, seperti lantai dan kasur atau di atas perut dan pangkuan.",
                              "Sebelum memulai, bersihkan permukaan lantai atau kasur terlebih dahulu.",
                              "Alasi dengan kain yang lembut, selimut, atau bantal tipis, agar Si Kecil lebih nyaman.",
                              "Taruh Si Kecil secara perlahan pada posisi tengkurap.",
                              "Ajak Si Kecil untuk berinteraksi dengan berbicara, bercanda, bermain dengan mainannya, atau melihat gambar-gambar di buku.",
                              "Letakkan cermin di depan Si Kecil agar perhatiannya bisa teralih dengan melihat bayangannya.", ],
                materials: [44568]
            ),
        ]
    }
}

class MilestoneData {
    static func getAll() -> [Milestone] {
        return [
            Milestone(
                id:1,
                titleEN: "Chin up in prone position",
                title: "Mengangkat dagu saat berada posisi tengkurap",
                month: 1,
                warningMonth: 2,
                category: .motoric,
                stimulusID: [25]
            ),
            Milestone(
                id:2,
                titleEN: "Turns head in supine position",
                title: "Bisa menggerakkan kepala dari kiri/kanan ke tengah saat sedang telentang",
                month: 1,
                warningMonth: 2,
                category: .motoric,
                stimulusID: [11]
            ),
            Milestone(
                id:3,
                titleEN: "Hands fisted near face",
                title: "Bisa menggepal tengan dekat muka",
                month: 1,
                warningMonth: 2,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id:4,
                titleEN: "Sucks well",
                title: "Menghisap dengan baik",
                month: 1,
                warningMonth: 2,
                category: .cognitive,
                stimulusID: [23]
            ),
            Milestone(
                id:5,
                titleEN: "Gazes at black- white objects",
                title: "Menatap objek berwarna hitam putih",
                month: 1,
                warningMonth: 2,
                category: .cognitive,
                stimulusID: [11]
            ),
            Milestone(
                id:6,
                titleEN: "Follows face",
                title: "Menatap muka anda",
                month: 1,
                warningMonth: 2,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:7,
                titleEN: "Discriminates mother’s voice",
                title: "Mengenali suara ibu",
                month: 1,
                warningMonth: 2,
                category: .social,
                stimulusID: [5]
            ),
            Milestone(
                id:8,
                titleEN: "Cries out of distress",
                title: "Mengangis saat resah",
                month: 1,
                warningMonth: 2,
                category: .social,
                stimulusID: [24]
            ),
            Milestone(
                id:9,
                titleEN: "Startles to voice/ sound",
                title: "Bereaksi terkejut terhadap suara",
                month: 1,
                warningMonth: 2,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:10,
                titleEN: "Throaty noises",
                title: "Mendengus atau mendengkur",
                month: 1,
                warningMonth: 2,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:11,
                titleEN: "Chest up in prone position",
                title: "Mengangkat dada saat posisi tengkurap",
                month: 2,
                warningMonth: 3,
                category: .motoric,
                stimulusID: [25]
            ),
            Milestone(
                id:12,
                titleEN: "Head bobs when held in sitting position",
                title: "Kepala terayun-ayun saat dipegang dalam posisi duduk",
                month: 2,
                warningMonth: 3,
                category: .motoric,
                stimulusID: [14]
            ),
            Milestone(
                id:13,
                titleEN: "Hands unfisted 50% of the time",
                title: "Sesekali, bayi tidak mengepalkan tangan",
                month: 2,
                warningMonth: 4,
                category: .motoric,
                stimulusID: [22]
            ),
            Milestone(
                id:14,
                titleEN: "Retains rattle if placed in hand",
                title: "Bisa memegang benda kalau ditaruh di dalam genggaman bayi",
                month: 2,
                warningMonth: 3,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:15,
                titleEN: "Holds hands together",
                title: "Bisa memegang tangan sendiri",
                month: 2,
                warningMonth: 3,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id:16,
                titleEN: "Opens mouth at sight of breast or bottle",
                title: "Membuka mulut saat melihat payudara atau botol susu",
                month: 2,
                warningMonth: 3,
                category: .cognitive,
                stimulusID: [21]
            ),
            Milestone(
                id:17,
                titleEN: "Visual threat present",
                title: "Refleks berkedip atau kaget bila ada ancaman yang terlihat (contoh: tangan yang bergerak cepat di depan muka bayi)",
                month: 2,
                warningMonth: 3,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id:18,
                titleEN: "Follows large, highly contrasting objects",
                title: "Mengikuti benda besar yang memiliki kontras warna yang tinggi (contoh: hitam dan putih)",
                month: 2,
                warningMonth: 3,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:19,
                titleEN: "Recognizes mother",
                title: "Mengenali ibu",
                month: 2,
                warningMonth: 3,
                category: .cognitive,
                stimulusID: [5]
            ),
            Milestone(
                id:20,
                titleEN: "Reciprocal smiling: responds to adult voice and smile",
                title: "Senyum (merespon) saat diajak bicara",
                month: 2,
                warningMonth: 3,
                category: .social,
                stimulusID: [2]
            ),
            Milestone(
                id:21,
                titleEN: "Alerts to voice/ sound",
                title: "Bereaksi pada suara",
                month: 2,
                warningMonth: 3,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:22,
                titleEN: "Coos",
                title: "Mengeluarkan suara dengungan (contoh: ngaa atau eemm)",
                month: 2,
                warningMonth: 3,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:23,
                titleEN: "Social smile (6 weeks)",
                title: "Senyum ramah",
                month: 2,
                warningMonth: 3,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:24,
                titleEN: "Vowel-like noises",
                title: "Bersuara satu silabel (contoh: ooh atau aah)",
                month: 2,
                warningMonth: 3,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:25,
                titleEN: "Props on fore- arms in prone position",
                title: "Mengangkat badan dengan lengan saat posisi tengkurap",
                month: 3,
                warningMonth: 4,
                category: .motoric,
                stimulusID: [25]
            ),
            Milestone(
                id:26,
                titleEN: "Rolls to side",
                title: "Berbalik ke samping",
                month: 3,
                warningMonth: 4,
                category: .motoric,
                stimulusID: [25]
            ),
            Milestone(
                id:27,
                titleEN: "Inspects fingers",
                title: "Memerhatikan jari sendiri",
                month: 3,
                warningMonth: 4,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id:28,
                titleEN: "Bats at objects",
                title: "Mengedip saat Melihat benda",
                month: 3,
                warningMonth: 4,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:29,
                titleEN: "Brings hands to mouth",
                title: "Mendekatkan tangan ke mulut",
                month: 3,
                warningMonth: 4,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id:30,
                titleEN: "Reaches for face",
                title: "Ingin memegang muka orang lain",
                month: 3,
                warningMonth: 4,
                category: .cognitive,
                stimulusID: [1]
            ),
            Milestone(
                id:31,
                titleEN: "Follows objects in circle (in supine position)",
                title: "Mengikut benda yang bergerak berputar saat bayi sedang telentang",
                month: 3,
                warningMonth: 4,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:32,
                titleEN: "Regards toys",
                title: "Mengenali mainan",
                month: 3,
                warningMonth: 4,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:33,
                titleEN: "Expression of disgust (sour taste, loud sound)",
                title: "Menunjukkan ketidaksukaan (pada rasa asam dan suara bising)",
                month: 3,
                warningMonth: 4,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:34,
                titleEN: "Visually follows person who is moving across a room",
                title: "Mata bayi memerhatikan orang yang sedang berlalu lalang",
                month: 3,
                warningMonth: 4,
                category: .social,
                stimulusID: [6]
            ),
            Milestone(
                id:35,
                titleEN: "Regards speaker",
                title: "Memerhatikan orang yang sedang berbicara",
                month: 3,
                warningMonth: 4,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:36,
                titleEN: "Chuckles",
                title: "Tertawa kecil",
                month: 3,
                warningMonth: 4,
                category: .language,
                stimulusID: [1]
            ),
            Milestone(
                id:37,
                titleEN: "Vocalizes when talked to",
                title: "Bersuara saat diajak bicara",
                month: 3,
                warningMonth: 4,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:38,
                titleEN: "Sits with trunk support",
                title: "Duduk dengan bantuan bantalan di sekeliling bokong bayi",
                month: 4,
                warningMonth: 5,
                category: .motoric,
                stimulusID: [14]
            ),
            Milestone(
                id:39,
                titleEN: "No head lag when pulled to sit",
                title: "Bisa menahan kepala saat di posisi duduk",
                month: 4,
                warningMonth: 5,
                category: .motoric,
                stimulusID: [14]
            ),
            Milestone(
                id:40,
                titleEN: "Props on wrists",
                title: "Menahan badan dengan pergelangan tangan",
                month: 4,
                warningMonth: 5,
                category: .motoric,
                stimulusID: [25]
            ),
            Milestone(
                id:41,
                titleEN: "Rolls front to back",
                title: "Membalikan badan dari telentang ke tengkurap",
                month: 4,
                warningMonth: 5,
                category: .motoric,
                stimulusID: [25]
            ),
            Milestone(
                id:42,
                titleEN: "Hands held pre- dominately open",
                title: "Telapak tangan lebih sering dalam keaadaan terbuka",
                month: 4,
                warningMonth: 5,
                category: .motoric,
                stimulusID: [22]
            ),
            Milestone(
                id:43,
                titleEN: "Clutches at clothes",
                title: "Mencengkram baju",
                month: 4,
                warningMonth: 5,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id:44,
                titleEN: "Reaches persistently",
                title: "Ingin meraih setiap benda yang terlihat",
                month: 4,
                warningMonth: 5,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:45,
                titleEN: "Plays with rattle",
                title: "Bermain dengan kerincingan",
                month: 4,
                warningMonth: 5,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:46,
                titleEN: "Briefly holds onto breast or bottle",
                title: "Memegang botol Atau payudara",
                month: 4,
                warningMonth: 5,
                category: .cognitive,
                stimulusID: [21]
            ),
            Milestone(
                id:47,
                titleEN: "Mouths objects",
                title: "Memasukkan benda kedalam mulut",
                month: 4,
                warningMonth: 5,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id:48,
                titleEN: "Stares longer at novel faces than familiar",
                title: "Lebih lama mengamati wajah orang baru dibandingkan wajah orang yang familiar",
                month: 4,
                warningMonth: 5,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id:49,
                titleEN: "Shakes rattle",
                title: "Menggoyangkan kerincingan",
                month: 4,
                warningMonth: 5,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:50,
                titleEN: "Reaches for ring/ rattle",
                title: "Mencoba meraih kerincingan atau mainan",
                month: 4,
                warningMonth: 5,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:51,
                titleEN: "Smiles sponta- neously at plea- surable sight/ sound",
                title: "Tersenyum saat Melihat Atau mendengar hal yang disuka",
                month: 4,
                warningMonth: 5,
                category: .social,
                stimulusID: [2]
            ),
            Milestone(
                id:52,
                titleEN: "Stops crying at parent voice",
                title: "Berhenti menangis saat mendengar suara orangtua",
                month: 4,
                warningMonth: 5,
                category: .social,
                stimulusID: [24]
            ),
            Milestone(
                id:53,
                titleEN: "To and fro alter- nating vocalizations",
                title: "Bersuara satu silabel (contoh: ooaah atau eeooh)",
                month: 4,
                warningMonth: 5,
                category: .social,
                stimulusID: [3]
            ),
            Milestone(
                id:54,
                titleEN: "Orients head in direction of a voice",
                title: "Berusaha melihat mengikuti arah suara yang di dengar",
                month: 4,
                warningMonth: 5,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:55,
                titleEN: "Stops crying to soothing voice",
                title: "Berhenti menangis saat ditenangkan dengan suara",
                month: 4,
                warningMonth: 5,
                category: .language,
                stimulusID: [24]
            ),
            Milestone(
                id:56,
                titleEN: "Laughs out loud",
                title: "Tertawa lepas",
                month: 4,
                warningMonth: 5,
                category: .language,
                stimulusID: [1]
            ),
            Milestone(
                id:57,
                titleEN: "Vocalizes when alone",
                title: "Bersuara saat sendirian",
                month: 4,
                warningMonth: 5,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:58,
                titleEN: "Sits with pelvic support",
                title: "Duduk dengan bantuan penyangga panggul",
                month: 5,
                warningMonth: 6,
                category: .motoric,
                stimulusID: [14]
            ),
            Milestone(
                id:59,
                titleEN: "Rolls back to front",
                title: "Berbalik dari tengkurap ke telentang",
                month: 5,
                warningMonth: 6,
                category: .motoric,
                stimulusID: [25]
            ),
            Milestone(
                id:60,
                titleEN: "Puts arms out front when falling",
                title: "Menjulurkan tangan kedepan saat mau jatuh",
                month: 5,
                warningMonth: 6,
                category: .motoric,
                stimulusID: [15]
            ),
            Milestone(
                id:61,
                titleEN: "Sits with arms supporting trunk",
                title: "Bisa duduk dengan bantuan lengan sebagai penyangga",
                month: 5,
                warningMonth: 6,
                category: .motoric,
                stimulusID: [15]
            ),
            Milestone(
                id:62,
                titleEN: "Palmar grasps cube",
                title: "Tangan bisa memegang mainan berbentuk kubus",
                month: 5,
                warningMonth: 6,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:63,
                titleEN: "Transfers objects: hand-mouth- hand",
                title: "Memindahkan tangan dari tangan ke mulut dan mulut ketangan",
                month: 5,
                warningMonth: 6,
                category: .motoric,
                stimulusID: []
            ),
            Milestone(
                id:64,
                titleEN: "Reaches/grasps dangling ring",
                title: "Meraih benda yang bergelantungan",
                month: 5,
                warningMonth: 6,
                category: .motoric,
                stimulusID: [11]
            ),
            Milestone(
                id:65,
                titleEN: "Gums/mouths pureed food",
                title: "Bisa makan makanan yang dihaluskan",
                month: 5,
                warningMonth: 6,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id:66,
                titleEN: "Turns head to look for dropped spoon",
                title: "Menengok saat mendengar sendok jatuh",
                month: 5,
                warningMonth: 6,
                category: .cognitive,
                stimulusID: [2]
            ),
            Milestone(
                id:67,
                titleEN: "Regards pellet or small cracker",
                title: "Memerhatikan benda kecil",
                month: 5,
                warningMonth: 6,
                category: .cognitive,
                stimulusID: [20]
            ),
            Milestone(
                id:68,
                titleEN: "Recognizes care- giver visually",
                title: "Sudah bisa mengenali orang disekelilingnya secara visual",
                month: 5,
                warningMonth: 6,
                category: .social,
                stimulusID: [2]
            ),
            Milestone(
                id:69,
                titleEN: "Forms attach- ment relation- ship to caregiver",
                title: "Membentuk ikatan emosional dengan orang yang merawatnya",
                month: 5,
                warningMonth: 6,
                category: .social,
                stimulusID: [3]
            ),
            Milestone(
                id:70,
                titleEN: "Begins to respond to name",
                title: "Bayi merespon saat dipanggil namanya",
                month: 5,
                warningMonth: 6,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:71,
                titleEN: "Says “Ah-goo”",
                title: "Mengeluarkan suara seperti “ah - goo”",
                month: 5,
                warningMonth: 6,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:72,
                titleEN: "Razzes, squeals",
                title: "Mengeluarkan suara keras seperti jeritan kecil",
                month: 5,
                warningMonth: 6,
                category: .language,
                stimulusID: [2]
            ),
            Milestone(
                id:73,
                titleEN: "Expresses anger with sounds other than crying",
                title: "Menunjukan kekesalan / ketidaknyamanan dengan cara selain menangis",
                month: 5,
                warningMonth: 6,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:74,
                titleEN: "Sits momentarily propped on hands",
                title: "Bisa duduk sejenak tanpa dukungan apapun dan menahan dengan tangan kalau mau jatuh",
                month: 6,
                warningMonth: 7,
                category: .motoric,
                stimulusID: [15]
            ),
            Milestone(
                id:75,
                titleEN: "Pivots in prone",
                title: "Memutarkan badan saat posisi tengkurap ke kanan atau kekiri",
                month: 6,
                warningMonth: 7,
                category: .motoric,
                stimulusID: [25]
            ),
            Milestone(
                id:76,
                titleEN: "In prone posi- tion, bears weight on one hand",
                title: "Menahan badan dengan satu tangan saat dalam posisi tengkurap",
                month: 6,
                warningMonth: 7,
                category: .motoric,
                stimulusID: [25]
            ),
            Milestone(
                id:77,
                titleEN: "Transfers hand- hand",
                title: "Memindahkan benda dari satu tangan ke tangan lainnya",
                month: 6,
                warningMonth: 7,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:78,
                titleEN: "Rakes pellet",
                title: "Meraup benda kecil",
                month: 6,
                warningMonth: 7,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:79,
                titleEN: "Takes second cube and holds on to first",
                title: "Bisa mengambil benda/mainan baru saat sedang memegang benda/mainan",
                month: 6,
                warningMonth: 7,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:80,
                titleEN: "Reaches with one hand",
                title: "Meraih dengan satu tangan",
                month: 6,
                warningMonth: 7,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:81,
                titleEN: "Feeds self crackers",
                title: "Dapat memakan biskuit atau cemilan sendiri",
                month: 6,
                warningMonth: 7,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id:82,
                titleEN: "Places hands on bottle",
                title: "Meletakkan tangan di atas botol susu",
                month: 6,
                warningMonth: 7,
                category: .cognitive,
                stimulusID: [21]
            ),
            Milestone(
                id:83,
                titleEN: "Touches reflec- tion and vocalizes",
                title: "Memegang pantulan diri dan bersuara",
                month: 6,
                warningMonth: 7,
                category: .cognitive,
                stimulusID: [10]
            ),
            Milestone(
                id:84,
                titleEN: "Removes cloth on face",
                title: "Menyingkirkan kain dari Mukanya (contoh: selimut, baju atau sarung tangan)",
                month: 6,
                warningMonth: 7,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id:85,
                titleEN: "Bangs and shakes toys",
                title: "Memukulkan atau megoyangkan mainan",
                month: 6,
                warningMonth: 7,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:86,
                titleEN: "Stranger anxiety (familiar versus unfamiliar people)",
                title: "Menunjukkan ketidaknyamanan saat bertemu orang baru",
                month: 6,
                warningMonth: 7,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:87,
                titleEN: "Stops momen- tarily to “no”",
                title: "Merespon dengan diam saat diberikan instruksi “Tidak” atau “berhenti”",
                month: 6,
                warningMonth: 7,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:88,
                titleEN: "Gestures for “up”",
                title: "Bisa memberi isyarat saat ingin digendong",
                month: 6,
                warningMonth: 7,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:89,
                titleEN: "Reduplicative babble with consonants",
                title: "Mengeluarkan suara dengan satu silabil berserta konsonan (contoh: gugu, baba)",
                month: 6,
                warningMonth: 7,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:90,
                titleEN: "Listens, then vocalizes when adult stops",
                title: "Mendengarkan saat diajak bicara dan bersuara ketika lawan bicaranya diam",
                month: 6,
                warningMonth: 7,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:91,
                titleEN: "Smiles/vocalizes to mirror",
                title: "Senyum atau bersuara saat bercermin",
                month: 6,
                warningMonth: 7,
                category: .language,
                stimulusID: [10]
            ),
            Milestone(
                id:92,
                titleEN: "Bounces when held",
                title: "Berjingkrak-jingkrak saat bayi dipegang dalam posisi duduk ataupun berdiri",
                month: 7,
                warningMonth: 8,
                category: .motoric,
                stimulusID: [14]
            ),
            Milestone(
                id:93,
                titleEN: "Sits without sup- port steadily",
                title: "Bisa duduk tanpa bantuan apapun",
                month: 7,
                warningMonth: 8,
                category: .motoric,
                stimulusID: [15]
            ),
            Milestone(
                id:94,
                titleEN: "Puts arms out to sides for balance",
                title: "Menyeimbangan bada dengan tangan saat dalam posisi duduk",
                month: 7,
                warningMonth: 8,
                category: .motoric,
                stimulusID: [15]
            ),
            Milestone(
                id:95,
                titleEN: "Radial-palmar grasp",
                title: "Memegang benda secara “radial - palmar”",
                month: 7,
                warningMonth: 8,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:96,
                titleEN: "Refuses excess food",
                title: "Bisa menolak makanan bila sudah kenyang",
                month: 7,
                warningMonth: 8,
                category: .cognitive,
                stimulusID: [4]
            ),
            Milestone(
                id:97,
                titleEN: "Explores different aspects of toy",
                title: "Mempelajari bagian bagian yang berbeda dari suatu mainan",
                month: 7,
                warningMonth: 8,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:98,
                titleEN: "Observes cube in each hand",
                title: "Memerhatikan kubus atau mainan yang ada di kedua tangannya",
                month: 7,
                warningMonth: 8,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:99,
                titleEN: "Finds partially hidden object",
                title: "Dapat mencari benda yang tersembunyi sebagian",
                month: 7,
                warningMonth: 8,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:100,
                titleEN: "Looks from object to parent and back when wanting help (eg, with a wind- up toy)",
                title: "Mengisyaratkan bantuan dengan melihat ke arah mainan kemudian menatap orang tua",
                month: 7,
                warningMonth: 8,
                category: .social,
                stimulusID: [4]
            ),
            Milestone(
                id:101,
                titleEN: "Looks toward familiar object when named",
                title: "Melihat benda yang disebutkan namanya",
                month: 7,
                warningMonth: 8,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:102,
                titleEN: "Attends to music",
                title: "Menyimak saat mendengar musik",
                month: 7,
                warningMonth: 8,
                category: .language,
                stimulusID: [9]
            ),
            Milestone(
                id:103,
                titleEN: "Increasing variety of syllables",
                title: "Mengeluarkan suara dengan silabil baru yang berbeda beda",
                month: 7,
                warningMonth: 8,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:104,
                titleEN: "Gets into sitting position",
                title: "Dapat mengambil posisi duduk secara mandiri",
                month: 8,
                warningMonth: 9,
                category: .motoric,
                stimulusID: [16]
            ),
            Milestone(
                id:105,
                titleEN: "Commando crawls",
                title: "Dapat berpindah tempat dengan lengan dan perut sebagai tumpuan",
                month: 8,
                warningMonth: 9,
                category: .motoric,
                stimulusID: [25]
            ),
            Milestone(
                id:106,
                titleEN: "Pulls to sitting/ kneeling position",
                title: "Dapat mengambil posisi duduk atau berlutut secara mandiri",
                month: 8,
                warningMonth: 9,
                category: .motoric,
                stimulusID: [16]
            ),
            Milestone(
                id:107,
                titleEN: "Bangs spoon after demonstration",
                title: "Memukulkan sendok setelah dicontohkan",
                month: 8,
                warningMonth: 9,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:108,
                titleEN: "Scissor grasp of cube",
                title: "Memegang benda dengan “scissor grasp”",
                month: 8,
                warningMonth: 9,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:109,
                titleEN: "Takes cube out of cup",
                title: "Mengeluarkan es batu dari gelas",
                month: 8,
                warningMonth: 9,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:110,
                titleEN: "Pulls out large peg",
                title: "Dapat menarik mainan yang berbentuk silinder besar dari lubangnya",
                month: 8,
                warningMonth: 9,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:111,
                titleEN: "Holds own bottle",
                title: "Memegang botol sendiri",
                month: 8,
                warningMonth: 9,
                category: .cognitive,
                stimulusID: [21]
            ),
            Milestone(
                id:112,
                titleEN: "Finger feeds Cheerios! or string beans",
                title: "Makan cemilan sendiri dengan tangan (contoh: ciki atau kacang)",
                month: 8,
                warningMonth: 9,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id:113,
                titleEN: "Seeks object after it falls silently to the floor",
                title: "Mencari benda yang jatuh mesikupun Tidak bersuara",
                month: 8,
                warningMonth: 9,
                category: .cognitive,
                stimulusID: [2]
            ),
            Milestone(
                id:114,
                titleEN: "Lets parents know when happy versus upset",
                title: "Bisa mengkomunikasikan pada orang tua Kalau Sedang bahagia atau Tidak nyaman / sedih",
                month: 8,
                warningMonth: 9,
                category: .social,
                stimulusID: [4]
            ),
            Milestone(
                id:115,
                titleEN: "Engages in gaze monitoring: adult looks away and child follows adult glance with own eyes",
                title: "Mengikuti bila orang dewasa melakukan pemantauan (cth: orang dewasa memalingkan muka dan anak mengikuti pandangan orang dewasa dengan matanya sendiri)",
                month: 8,
                warningMonth: 9,
                category: .social,
                stimulusID: [2]
            ),
            Milestone(
                id:116,
                titleEN: "Responds to “Come here”",
                title: "Merespon saat di panggil “sini”",
                month: 8,
                warningMonth: 9,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:117,
                titleEN: "Looks for family members, “Where’s mama? ”. etc",
                title: "Bisa mencari orang yang familiar saat disebutkan namana (contoh: mama dimana mama?",
                month: 8,
                warningMonth: 9,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:118,
                titleEN: "Says “Dada” (nonspecific)",
                title: "Mengeluarkan suara yang mirip dengan “dada” meskipun kurang jelas",
                month: 8,
                warningMonth: 9,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:119,
                titleEN: "Echolalia (8 to 30 months)",
                title: "Mengikuti yang orang lain katakan (echolalia)",
                month: 8,
                warningMonth: 9,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:120,
                titleEN: "Shakes head for “no”",
                title: "Menggelengkan kepala untuk mengatakan “Tidak”",
                month: 8,
                warningMonth: 9,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:121,
                titleEN: "”Stands” on feet and hands",
                title: "\",Berdiri\" dengan kaki dan tangan",
                month: 9,
                warningMonth: 10,
                category: .motoric,
                stimulusID: [12]
            ),
            Milestone(
                id:122,
                titleEN: "Begins creeping",
                title: "Mulai merambat",
                month: 9,
                warningMonth: 10,
                category: .motoric,
                stimulusID: [12]
            ),
            Milestone(
                id:123,
                titleEN: "Pulls to stand",
                title: "Bisa berdiri sendiri",
                month: 9,
                warningMonth: 10,
                category: .motoric,
                stimulusID: [12]
            ),
            Milestone(
                id:124,
                titleEN: "Bear walks (all four limbs straight)",
                title: "Berjalan dengan kedua tangan dan kedua kaki",
                month: 9,
                warningMonth: 10,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:125,
                titleEN: "Radial-digital grasp of cube",
                title: "Memegang kubus / mainan secara “radial - digital”",
                month: 9,
                warningMonth: 10,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:126,
                titleEN: "Bangs two cubes together",
                title: "Membenturkan dua kubus atau mainan ke satu sama lain",
                month: 9,
                warningMonth: 10,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:127,
                titleEN: "Bites, chews cookie",
                title: "Menggigit dan mengunyah cemilan keras seperti biskuit",
                month: 9,
                warningMonth: 10,
                category: .cognitive,
                stimulusID: []
            ),
            Milestone(
                id:128,
                titleEN: "Inspects bell",
                title: "Memeriksa bel/lonceng",
                month: 9,
                warningMonth: 10,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:129,
                titleEN: "Rings bell",
                title: "Membunyikan bel/lonceng",
                month: 9,
                warningMonth: 10,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:130,
                titleEN: "Pulls string to obtain ring",
                title: "Menarik benang untuk menyuarakan bel",
                month: 9,
                warningMonth: 10,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:131,
                titleEN: "Uses sounds to get attention",
                title: "Menggunakan suara agar mendapatkan perhatian",
                month: 9,
                warningMonth: 10,
                category: .social,
                stimulusID: [3]
            ),
            Milestone(
                id:132,
                titleEN: "Separation anxiety",
                title: "Memiliki kecemasan bila berpisah",
                month: 9,
                warningMonth: 10,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:133,
                titleEN: "Follows a point, “Oh look at.”",
                title: "Bisa melihat sesuai dengan arah yang ditunjuk oleh orangtua (Contoh: “liat deh disana ada bebek”)",
                month: 9,
                warningMonth: 10,
                category: .social,
                stimulusID: [4]
            ),
            Milestone(
                id:134,
                titleEN: "Recognizes familiar people visually",
                title: "Mengenali orang yang dikenal secara visual",
                month: 9,
                warningMonth: 10,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:135,
                titleEN: "Enjoys gesture gamess",
                title: "Menikmati permainan isyarat (Contoh: cilukba, atau ekspresi lainnya yang Menggunakan gestur)",
                month: 9,
                warningMonth: 10,
                category: .language,
                stimulusID: [1]
            ),
            Milestone(
                id:136,
                titleEN: "Orients to name well",
                title: "Sadar saat di panggil dengan namanya",
                month: 9,
                warningMonth: 10,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:137,
                titleEN: "Orients to bell",
                title: "Dapat mengenali kemana arah bunyi bel/lonceng",
                month: 9,
                warningMonth: 10,
                category: .language,
                stimulusID: [9]
            ),
            Milestone(
                id:138,
                titleEN: "Says “Mama” (nonspecific)",
                title: "Mengeluarkan suara yang mirip dengan “mama” meskipun kurang jelas",
                month: 9,
                warningMonth: 10,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:139,
                titleEN: "Non reduplicative babble",
                title: "Dapat mengeluarkan bunyi suara yang lebih bervariasi (Contoh: mulai menggabungkan bunyi dan suku kata yang berbeda seperti \"magaga\", \"gagamee\", atau \"gababama\")",
                month: 9,
                warningMonth: 10,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:140,
                titleEN: "Imitates sounds",
                title: "Meniru/ mengimitasi suara",
                month: 9,
                warningMonth: 10,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:141,
                titleEN: "Creeps well",
                title: "Merambat dengan baik",
                month: 10,
                warningMonth: 11,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:142,
                titleEN: "Cruises around furniture using two hands",
                title: "Berjalan merembet dengan bantuan dua tangan dari satu perabotan ke perabotan lainnya",
                month: 10,
                warningMonth: 11,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:143,
                titleEN: "Stands with one hand held",
                title: "Bisa berdiri saat salah satu tangannya di gandeng",
                month: 10,
                warningMonth: 11,
                category: .motoric,
                stimulusID: [12]
            ),
            Milestone(
                id:144,
                titleEN: "Walks with two hands held",
                title: "Bisa jalan saat kedua tangannya dituntun",
                month: 10,
                warningMonth: 11,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:145,
                titleEN: "Clumsy release of cube",
                title: "Bisa melepaskan kubus dari genggaman secara ceroboh",
                month: 10,
                warningMonth: 11,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:146,
                titleEN: "Inferior pincer grasp of pellet",
                title: "Memegang benda kecil dengan “inferior grasp”",
                month: 10,
                warningMonth: 11,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:147,
                titleEN: "Isolates index finger and pokes",
                title: "Mencolek / menyodok dengan jari telunjuk",
                month: 10,
                warningMonth: 11,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:148,
                titleEN: "Drinks from cup held for child",
                title: "Bisa minum dari gelas yang dipengang oleh orang tua",
                month: 10,
                warningMonth: 11,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:149,
                titleEN: "Uncovers toy under cloth",
                title: "Bisa mencari dan menemukan mainan yang tersebunyi di balik selimut (atau kain lainnya)",
                month: 10,
                warningMonth: 11,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:150,
                titleEN: "Pokes at pellet in bottle",
                title: "Mencolek / menyodok benda kecil di dalam botol",
                month: 10,
                warningMonth: 11,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:151,
                titleEN: "Tries to put cube in cup, but may not be able to let go",
                title: "Berusaha untuk memasukkan kubus kedalam gelas, kemungkinan tidak berhasil karena tidak bisa melepaskan kubus dari genggaman",
                month: 10,
                warningMonth: 11,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:152,
                titleEN: "Experiences fear",
                title: "Bisa merasakan rasa takut",
                month: 10,
                warningMonth: 11,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:153,
                titleEN: "Looks preferentially when name is called",
                title: "Sadar dan menegok ketika namanya dipanggil",
                month: 10,
                warningMonth: 11,
                category: .social,
                stimulusID: [4]
            ),
            Milestone(
                id:154,
                titleEN: "Enjoys peek-a-boo",
                title: "Senang bermain cilukba",
                month: 10,
                warningMonth: 11,
                category: .language,
                stimulusID: [1]
            ),
            Milestone(
                id:155,
                titleEN: "Waves “bye-bye” back",
                title: "Bisa melambai balik saat ada orang yang melambai “bye-bye”",
                month: 10,
                warningMonth: 11,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:156,
                titleEN: "Says “Dada” (specific)",
                title: "Mengatakan “Dada” secara jelas",
                month: 10,
                warningMonth: 11,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:157,
                titleEN: "Waves “bye-bye”",
                title: "Bisa melambai “bye-bye”",
                month: 10,
                warningMonth: 11,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:158,
                titleEN: "Pivots in sitting position",
                title: "Memutarkan badan saat posisi duduk",
                month: 11,
                warningMonth: 12,
                category: .motoric,
                stimulusID: [16]
            ),
            Milestone(
                id:159,
                titleEN: "Cruises furniture using one hand",
                title: "Berjalan merembet dengan bantuan satu tangan dari satu perabotan ke perabotan lainnya",
                month: 11,
                warningMonth: 12,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:160,
                titleEN: "Stands for a few seconds",
                title: "Bisa berdiri sendiri untuk beberapa detik singkat",
                month: 11,
                warningMonth: 12,
                category: .motoric,
                stimulusID: [12]
            ),
            Milestone(
                id:161,
                titleEN: "Walks with one hand held",
                title: "Bisa berjalan saat salah satu tangannya digandeng oleh orangtua",
                month: 11,
                warningMonth: 12,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:162,
                titleEN: "Throws objects",
                title: "Bisa melempar barang",
                month: 11,
                warningMonth: 12,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:163,
                titleEN: "Stirs with spoon",
                title: "Bisa mengaduk dengan sendok",
                month: 11,
                warningMonth: 12,
                category: .motoric,
                stimulusID: [18]
            ),
            Milestone(
                id:164,
                titleEN: "Cooperates with dressing",
                title: "Bersikap baik saat di pakaikan baju",
                month: 11,
                warningMonth: 12,
                category: .cognitive,
                stimulusID: [4]
            ),
            Milestone(
                id:165,
                titleEN: "Finds toy under cup",
                title: "Bisa mencari dan menemukan mainan yang tersebunyi di bawah cangkir/gelas",
                month: 11,
                warningMonth: 12,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:166,
                titleEN: "Looks at pictures in book",
                title: "Melihat gambar gambar yang ada di buku",
                month: 11,
                warningMonth: 12,
                category: .cognitive,
                stimulusID: [3]
            ),
            Milestone(
                id:167,
                titleEN: "Gives object to adult for action after demonstration (lets adult know he or she needs help)",
                title: "Memberikan benda pada orang tua (agar orang tua tau bahwa dirinya membutuhkan bantuan)",
                month: 11,
                warningMonth: 12,
                category: .social,
                stimulusID: [4]
            ),
            Milestone(
                id:168,
                titleEN: "Stops activity when told “no”",
                title: "Menghentikan aktivitas ketika diberitahu “berhenti” atau “tidak”",
                month: 11,
                warningMonth: 12,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:169,
                titleEN: "Bounces to music",
                title: "Berjoget saat mendengar musik",
                month: 11,
                warningMonth: 12,
                category: .language,
                stimulusID: [9]
            ),
            Milestone(
                id:170,
                titleEN: "Says first word",
                title: "Mengatakan kata pertamanya",
                month: 11,
                warningMonth: 12,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:171,
                titleEN: "Vocalizes to songs",
                title: "Ikut bernyanyi saat disetelkan musik",
                month: 11,
                warningMonth: 12,
                category: .language,
                stimulusID: [9]
            ),
            Milestone(
                id:172,
                titleEN: "Stands well with arms high, legs splayed",
                title: "Berdiri dengan baik (posisi tangan diatas untuk menyeimbangkan dan kaki terentang)",
                month: 12,
                warningMonth: 13,
                category: .motoric,
                stimulusID: [12]
            ),
            Milestone(
                id:173,
                titleEN: "Independent steps",
                title: "Bisa berjalan sendiri (beberapa langkah saja)",
                month: 12,
                warningMonth: 13,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:174,
                titleEN: "Scribbles after demonstration",
                title: "Mencoret coret setelah ditunjukkan caranya",
                month: 12,
                warningMonth: 13,
                category: .motoric,
                stimulusID: [17]
            ),
            Milestone(
                id:175,
                titleEN: "Fine pincer grasp of pellet",
                title: "Bisa memegang benda/mainan kecil dengan “pincer grasp”",
                month: 12,
                warningMonth: 13,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:176,
                titleEN: "Holds crayon",
                title: "Memegang krayon",
                month: 12,
                warningMonth: 13,
                category: .motoric,
                stimulusID: [17]
            ),
            Milestone(
                id:177,
                titleEN: "Attempts tower of two cubes",
                title: "Berusaha untuk menyusun menara yang terbuat dari dua kubus",
                month: 12,
                warningMonth: 13,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:178,
                titleEN: "Finger feeds part of meal",
                title: "Makan sendiri dengan tangan (meskipun hanya sedikit dan tidak sampai habis)",
                month: 12,
                warningMonth: 13,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:179,
                titleEN: "Takes off hat",
                title: "Melepaskan topi",
                month: 12,
                warningMonth: 13,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:180,
                titleEN: "Rattles spoon in cup",
                title: "Memainkan sendok dengan membunyikannya pada sisi dalam gelas",
                month: 12,
                warningMonth: 13,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:181,
                titleEN: "Lifts box lid to find toy",
                title: "Mengangkat tutup kotak mainan untuk mengambil mainan",
                month: 12,
                warningMonth: 13,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:182,
                titleEN: "Shows object to parents to share interest",
                title: "Berbagi minat dengan cara menujukkan benda kepada orang tua",
                month: 12,
                warningMonth: 13,
                category: .social,
                stimulusID: [3]
            ),
            Milestone(
                id:183,
                titleEN: "Follows one-step command with gesture",
                title: "Dapat mengikuti instruksi yang dibantu dengan arahan",
                month: 12,
                warningMonth: 13,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:184,
                titleEN: "Recognizes name of two objects and looks when named",
                title: "Mengenali nama dari 2 objek, ditunjukkan dengan melihat pada objek saat menyebutkan nama objek tersebut",
                month: 12,
                warningMonth: 13,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:185,
                titleEN: "Points to get desired object (protoimperative pointing)",
                title: "Menunjuk barang yang di inginkan (protoimperative pointing)",
                month: 12,
                warningMonth: 13,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:186,
                titleEN: "Uses several gestures with vocalizing (eg, waving, reaching)",
                title: "Menggunakan gestur saat berbicara (Contoh: melambai atau menunjuk)",
                month: 12,
                warningMonth: 13,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:187,
                titleEN: "Walks with arms high and out (high guard)",
                title: "Berjalan dengan baik (posisi tangan diatas untuk menyeimbangkan)",
                month: 13,
                warningMonth: 14,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:188,
                titleEN: "Attempts to release pellet in bottle",
                title: "Berusaha memasukkan benda kecil kedalam botol (meskipun gagal)",
                month: 13,
                warningMonth: 14,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:189,
                titleEN: "Drinks from cup with some spilling",
                title: "Bisa minum dari gelas meskipun masih tumpah-tumpah",
                month: 13,
                warningMonth: 14,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:190,
                titleEN: "Dangles ring by string",
                title: "Bisa memegang / membawa mainan yang diseret oleh tali",
                month: 13,
                warningMonth: 14,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:191,
                titleEN: "Reaches around clear barrier to obtain object",
                title: "Mengambil mainan yang terletak didalam wadah bening (terlihat)",
                month: 13,
                warningMonth: 14,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:192,
                titleEN: "Unwraps toy in cloth",
                title: "Membuka bungkusan mainan yang terbungkus kain",
                month: 13,
                warningMonth: 14,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:193,
                titleEN: "Shows desire to please caregiver",
                title: "Terlihat ingin membuat orangtua senang (nurut)",
                month: 13,
                warningMonth: 14,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:194,
                titleEN: "Solitary play",
                title: "Bermain sendiri",
                month: 13,
                warningMonth: 14,
                category: .social,
                stimulusID: [7]
            ),
            Milestone(
                id:195,
                titleEN: "Functional play",
                title: "Bermain dengan mainan sesuai dengan fungsi mainannya (contoh: menjalankan mobil-mobilan atau menggelindingkan bola)",
                month: 13,
                warningMonth: 14,
                category: .social,
                stimulusID: [7]
            ),
            Milestone(
                id:196,
                titleEN: "Looks appropriately when asked, “Where’s the ball?”",
                title: "Melihat pada arah yang benar saat ditanya (contoh: “Bolanya ada dimana?”)",
                month: 13,
                warningMonth: 14,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:197,
                titleEN: "Uses three words",
                title: "Berbicara menggunakan 3 kata",
                month: 13,
                warningMonth: 14,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:198,
                titleEN: "Immature jar- goning: inflection without real words",
                title: "Berbicara dengan nada seolah berbicara dengan bahasa yang benar tanpa Menggunakan kata yang bisa dimengerti",
                month: 13,
                warningMonth: 14,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:199,
                titleEN: "Stands without pulling up",
                title: "Bisa berdiri sendiri tanpa di bantu",
                month: 14,
                warningMonth: 15,
                category: .motoric,
                stimulusID: [12]
            ),
            Milestone(
                id:200,
                titleEN: "Walks well",
                title: "Berjalan dengan baik tanpa bantuan",
                month: 14,
                warningMonth: 15,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:201,
                titleEN: "Imitates back and forth scribble",
                title: "Membuat Coretan saat ditunjukkan (berbentuk garis acak-acakan)",
                month: 14,
                warningMonth: 15,
                category: .motoric,
                stimulusID: [17]
            ),
            Milestone(
                id:202,
                titleEN: "Adds third cube to a two-cube tower",
                title: "Bisa menambahkan balok ketiga pada dua balok yang Sudah tersusun Keatas",
                month: 14,
                warningMonth: 15,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:203,
                titleEN: "Puts round peg in and out of hole",
                title: "Bisa memasukkan dan mengeluarkan mainan yang berbentuk silinder ke dalam lubangnya",
                month: 14,
                warningMonth: 15,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:204,
                titleEN: "Removes socks/ shoes",
                title: "Bisa melepaskan kaos kaki / sepatu",
                month: 14,
                warningMonth: 15,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:205,
                titleEN: "Chews well",
                title: "Dapat menguyah makanan dengan baik",
                month: 14,
                warningMonth: 15,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:206,
                titleEN: "Puts spoon in mouth (turns over)",
                title: "Memasukkan sendok ke dalam mulut (walaupun belum benar)",
                month: 14,
                warningMonth: 15,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:207,
                titleEN: "Dumps pellet out of bottle after demonstration",
                title: "Mengeluarkan benda kecil dari botol setelah di contohkan caranya",
                month: 14,
                warningMonth: 15,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:208,
                titleEN: "Purposeful exploration of toys through trial and error",
                title: "Bermain dan mengeksplor mainan (contoh: mencoba memencet bagian yang tidak bisa dipencet. Akhirnya menemukan bahwa bagian mainan tersebut harus diputar)",
                month: 14,
                warningMonth: 15,
                category: .social,
                stimulusID: [7]
            ),
            Milestone(
                id:209,
                titleEN: "Follows one-step command without gesture",
                title: "Mengikuti satu arahan tanpa bantuan gestur",
                month: 14,
                warningMonth: 15,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:210,
                titleEN: "Names one object",
                title: "Menyebut satu benda dengan nama yang benar",
                month: 14,
                warningMonth: 15,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:211,
                titleEN: "Points at object to express inter- est (proto- declarative pointing)",
                title: "Menunjuk barang yang di inginkan (protodeclarative pointing)",
                month: 14,
                warningMonth: 15,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:212,
                titleEN: "Stoops to pick up toy",
                title: "Membungkuk untuk mengambil mainan",
                month: 15,
                warningMonth: 16,
                category: .motoric,
                stimulusID: [19]
            ),
            Milestone(
                id:213,
                titleEN: "Creeps up stairs",
                title: "Merambat naik tangga",
                month: 15,
                warningMonth: 16,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:214,
                titleEN: "Runs stiff-legged",
                title: "Berlari dengan kaki yang masih kaku",
                month: 15,
                warningMonth: 16,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:215,
                titleEN: "Walks carrying toy",
                title: "Berjalan sambil memegang mainan",
                month: 15,
                warningMonth: 16,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:216,
                titleEN: "Climbs on furniture",
                title: "Memanjat perabotan rumah",
                month: 15,
                warningMonth: 16,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:217,
                titleEN: "Builds three-to four-cube tower",
                title: "Membuat susunan balok (terdiri dari 3 sampai 4 balok)",
                month: 15,
                warningMonth: 16,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:218,
                titleEN: "Places 10 cubes in cup",
                title: "Meletakkan 10 kubus di dalam gelas",
                month: 15,
                warningMonth: 16,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:219,
                titleEN: "Releases pellet into bottle",
                title: "Memasukkan benda kecil kedalam botol",
                month: 15,
                warningMonth: 16,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:220,
                titleEN: "Uses spoon with some spilling",
                title: "Bisa menggunakan sendok walaupun masih tumpah-tumpah",
                month: 15,
                warningMonth: 16,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:221,
                titleEN: "Attempts to brush own hair",
                title: "Berusaha untuk menyisir rambut sendiri",
                month: 15,
                warningMonth: 16,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:222,
                titleEN: "Fusses to be changed",
                title: "Bisa merengek ketika ingin Ganti baju",
                month: 15,
                warningMonth: 16,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:223,
                titleEN: "Turns pages in book",
                title: "Membalikkan halaman buku",
                month: 15,
                warningMonth: 16,
                category: .cognitive,
                stimulusID: [3]
            ),
            Milestone(
                id:224,
                titleEN: "Places circle in single-shape puzzle",
                title: "Dapat mencocokan benda sesuai dengan bentuknya (Contoh: kotak, segitiga, bulat)",
                month: 15,
                warningMonth: 16,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:225,
                titleEN: "Shows empathy (someone else cries, child looks sad)",
                title: "Menunjukkan empati (terlihat sedih saat Melihat bayi lain menangis)",
                month: 15,
                warningMonth: 16,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:226,
                titleEN: "Hugs adult in reciprocation",
                title: "Dapat merespon dengan memeluk balik ketika dipeluk",
                month: 15,
                warningMonth: 16,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:227,
                titleEN: "Recognizes without a demonstration that a toy requires activation; hands it to adult if can’t operate",
                title: "Menyadari bahwa sebuah benda/mainan harus diaktifkan terlebih dahulu tanpa diberitahu (meminta tolong pada orang tua bila tidak bisa mengaktifkan mainannya sendiri)",
                month: 15,
                warningMonth: 16,
                category: .social,
                stimulusID: [19]
            ),
            Milestone(
                id:228,
                titleEN: "Points to one body part",
                title: "Menunjuk pada satu bagian tubuh",
                month: 15,
                warningMonth: 16,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:229,
                titleEN: "Points to one object of three when named",
                title: "Menunjuk pada satu dari tiga benda yang disebutkan",
                month: 15,
                warningMonth: 16,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:230,
                titleEN: "Gets object from another room upon demand",
                title: "Bisa mengambil barang dari ruangan lain saat diminta",
                month: 15,
                warningMonth: 16,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:231,
                titleEN: "Uses three to five words",
                title: "Berbicara menggunakan 3 sampai dengan 5 kata",
                month: 15,
                warningMonth: 16,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:232,
                titleEN: "Mature jargoning with real words",
                title: "Berbicara dengan kata yang baik dan dan benar",
                month: 15,
                warningMonth: 16,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:233,
                titleEN: "Stands on one foot with slight support",
                title: "Berdiri dengan satu kaki dengan sedikit bantuan",
                month: 16,
                warningMonth: 17,
                category: .motoric,
                stimulusID: [12]
            ),
            Milestone(
                id:234,
                titleEN: "Walks backwards",
                title: "Berjalan mundur",
                month: 16,
                warningMonth: 17,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:235,
                titleEN: "Walks up stairs with one hand held",
                title: "Naik tangga dengan bantuan satu tangan dipegang",
                month: 16,
                warningMonth: 17,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:236,
                titleEN: "Puts several round pegs in board with urging",
                title: "Bisa memasukkan beberapa mainan yang berbentuk silinder ke dalam lubangnya (jika diminta)",
                month: 16,
                warningMonth: 17,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:237,
                titleEN: "Scribbles spontaneously",
                title: "Mencoret coret secara spontan",
                month: 16,
                warningMonth: 17,
                category: .motoric,
                stimulusID: [17]
            ),
            Milestone(
                id:238,
                titleEN: "Picks up and drinks from cup",
                title: "Bisa mengambil dan minum dari gelas",
                month: 16,
                warningMonth: 17,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:239,
                titleEN: "Fetches and car- ries objects (same room)",
                title: "Mengambil dan membawa barang (dalam ruangan yang sama)",
                month: 16,
                warningMonth: 17,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:240,
                titleEN: "Dumps pellet out without demonstration",
                title: "Bisa mengeluarkan benda kecil dari botol tanpa ditunjukkan",
                month: 16,
                warningMonth: 17,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:241,
                titleEN: "Finds toy observed to be hidden under layers of covers",
                title: "Menemukan mainan yang terlihat disembunyikan dibawah selimut",
                month: 16,
                warningMonth: 17,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:242,
                titleEN: "Kisses by touch- ing lips to skin",
                title: "Mencium dengan menempelkan bibirnya pada bagian tubuh",
                month: 16,
                warningMonth: 17,
                category: .social,
                stimulusID: [4]
            ),
            Milestone(
                id:243,
                titleEN: "Periodically visually relocates caregiver",
                title: "Melihat dan mencari ibu secara berkala",
                month: 16,
                warningMonth: 17,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:244,
                titleEN: "Self-conscious; embarrassed when aware of people observing",
                title: "Sadar diri (malu ketika menyadari ada orang yang mengamatinya)",
                month: 16,
                warningMonth: 17,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:245,
                titleEN: "Understands simple commands, “Bring to mommy”",
                title: "Memahami arahan simpel (contoh: “kasih ke mama”)",
                month: 16,
                warningMonth: 17,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:246,
                titleEN: "Points to one picture when named",
                title: "Dapat menunjuk dengan benar pada gambar yang disebutkan",
                month: 16,
                warningMonth: 17,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:247,
                titleEN: "Uses 5 to 10 words",
                title: "Berbicara menggunakan 5 sampai dengan 10 kata",
                month: 16,
                warningMonth: 17,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:248,
                titleEN: "Creeps down stairs",
                title: "Merambat untuk turun tangga",
                month: 18,
                warningMonth: 20,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:249,
                titleEN: "Runs well",
                title: "Berlari dengan baik",
                month: 18,
                warningMonth: 20,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:250,
                titleEN: "Seats self in small chair",
                title: "Duduk sendiri di kursi kecil",
                month: 18,
                warningMonth: 20,
                category: .motoric,
                stimulusID: [16]
            ),
            Milestone(
                id:251,
                titleEN: "Throws ball while standing",
                title: "Melempar bola saat sedang berdiri",
                month: 18,
                warningMonth: 20,
                category: .motoric,
                stimulusID: [8]
            ),
            Milestone(
                id:252,
                titleEN: "Makes four-cube tower",
                title: "Menyusun menara kubus (terbuat dari 4 susun kubus)",
                month: 18,
                warningMonth: 20,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:253,
                titleEN: "Crudely imitates vertical stroke",
                title: "Mencoba membuat garis lurus seperti yang ditunjukkan (garisnya belum lurus sempurna)",
                month: 18,
                warningMonth: 20,
                category: .motoric,
                stimulusID: [17]
            ),
            Milestone(
                id:254,
                titleEN: "Removes garment",
                title: "Melepaskan pakaian",
                month: 18,
                warningMonth: 20,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:255,
                titleEN: "Gets onto adult chair unaided",
                title: "Bisa duduk di kursi orang dewasa tanpa bantuan",
                month: 18,
                warningMonth: 20,
                category: .cognitive,
                stimulusID: [16]
            ),
            Milestone(
                id:256,
                titleEN: "Moves about house without adult",
                title: "Bisa berjalan di dalam rumah tanpa bantuan orangtua (berpindah dari satu ruangan ke ruangan lainnya)",
                month: 18,
                warningMonth: 20,
                category: .cognitive,
                stimulusID: [13]
            ),
            Milestone(
                id:257,
                titleEN: "Matches pairs of objects",
                title: "Menyocokkan benda yang sama (contoh: sendok dengan sendok, boneka dengan boneka)",
                month: 18,
                warningMonth: 20,
                category: .cognitive,
                stimulusID: [8]
            ),
            Milestone(
                id:258,
                titleEN: "Engages in pretend play with other people (eg, tea party, birthday party)",
                title: "Bermain role play (contoh: masak-masakan)",
                month: 18,
                warningMonth: 20,
                category: .social,
                stimulusID: [8]
            ),
            Milestone(
                id:259,
                titleEN: "Begins to show shame (when does wrong) and possessiveness",
                title: "Bisa menunjukkan rasa malu (saat melakukan kesalahan) dan terlihat posesif",
                month: 18,
                warningMonth: 20,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:260,
                titleEN: "Points to two of three objects when named",
                title: "Menunjuk pada 2 sampai 3 benda yang disebut",
                month: 18,
                warningMonth: 20,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:261,
                titleEN: "Points to three body parts",
                title: "Menunjuk pada 3 bagian tubuh",
                month: 18,
                warningMonth: 20,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:262,
                titleEN: "Points to self",
                title: "Bisa menunjuk pada diri sendiri",
                month: 18,
                warningMonth: 20,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:263,
                titleEN: "Understands “mine”",
                title: "Mengerti kata “milik saya”",
                month: 18,
                warningMonth: 20,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:264,
                titleEN: "Points to familiar people when named",
                title: "Bisa menunjuk pada orang orang terdekat saat disebutkan namanya",
                month: 18,
                warningMonth: 20,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:265,
                titleEN: "Uses 10 to 25 words",
                title: "Berbicara menggunakan 10 sampai dengan 25 kata",
                month: 18,
                warningMonth: 20,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:266,
                titleEN: "Uses giant words (all gone, stop that)",
                title: "Menggunakan kata besar (contoh: “sudah habis”, “tidak mau”",
                month: 18,
                warningMonth: 20,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:267,
                titleEN: "Imitates environmental sounds (eg, animals)",
                title: "Bisa menirukan suara suara (contoh: binatang, mobil ambulans, dll)",
                month: 18,
                warningMonth: 20,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:268,
                titleEN: "Names one picture on demand",
                title: "Bisa menamakan 1 benda saat diminta",
                month: 18,
                warningMonth: 20,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:269,
                titleEN: "Squats in play",
                title: "Berjongkok saat Bermain",
                month: 20,
                warningMonth: 22,
                category: .motoric,
                stimulusID: [12]
            ),
            Milestone(
                id:270,
                titleEN: "Carries large object",
                title: "Membawa barang yang besar",
                month: 20,
                warningMonth: 22,
                category: .motoric,
                stimulusID: [8]
            ),
            Milestone(
                id:271,
                titleEN: "Walks downstairs with one hand held",
                title: "Turun tangga dengan bantuan satu tangan dipegang",
                month: 20,
                warningMonth: 22,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:272,
                titleEN: "Completes round peg board without urging",
                title: "Bisa memasukkan dan mengeluarkan mainan yang berbentuk silinder dari semua lubangnya",
                month: 20,
                warningMonth: 22,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:273,
                titleEN: "Makes five- to six- cube tower",
                title: "Menyusun menara kubus (terbuat dari 5 - 6 susun kubus)",
                month: 20,
                warningMonth: 22,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:274,
                titleEN: "Places only edibles in mouth",
                title: "Hanya memasukkan makanan kedalam mulut",
                month: 20,
                warningMonth: 22,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:275,
                titleEN: "Feeds self with spoon entire meal",
                title: "Makan sendiri dengan sendok (sampai habis)",
                month: 20,
                warningMonth: 22,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:276,
                titleEN: "Deduces location of hidden object",
                title: "Mengetahui lokasi mainan yang disembunyikan",
                month: 20,
                warningMonth: 22,
                category: .cognitive,
                stimulusID: [7]
            ),
            Milestone(
                id:277,
                titleEN: "Begins to have thoughts about feelings",
                title: "Mulai memikirkan perasaan (terlihat tidak senang atau diam saat dilarang melakukan hal yang ia gemari)",
                month: 20,
                warningMonth: 22,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:278,
                titleEN: "Engages in tea party with stuffed animals",
                title: "Bermain rumah-rumahan dengan boneka",
                month: 20,
                warningMonth: 22,
                category: .social,
                stimulusID: [8]
            ),
            Milestone(
                id:279,
                titleEN: "Kisses with pucker",
                title: "Mencium dengan memonyongkan bibir",
                month: 20,
                warningMonth: 22,
                category: .social,
                stimulusID: [4]
            ),
            Milestone(
                id:280,
                titleEN: "Points to three pictures",
                title: "Menunjuk pada 3 gambar",
                month: 20,
                warningMonth: 22,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:281,
                titleEN: "Begins to understand her/him/me",
                title: "Mulai mengerti kata “dia”",
                month: 20,
                warningMonth: 22,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:282,
                titleEN: "Holophrases (”Mommy?” and points to keys, meaning “These are Mommy’s keys.”)",
                title: "Menggabungkan kata dan gestur saat berkomunikasi (Contoh: “Mama” dan menunjuk tas, yang Berarti - Tas itu miilk mama.)",
                month: 20,
                warningMonth: 22,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:283,
                titleEN: "Two-word combinations",
                title: "Berbicara dengan menggabungkan 2 kata",
                month: 20,
                warningMonth: 22,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:284,
                titleEN: "Answers requests with “no”",
                title: "Dapat merespon permintaan/arahan dengan kata “tidak”",
                month: 20,
                warningMonth: 22,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:285,
                titleEN: "Walks up stairs holding rail, put- ting both feet on each step",
                title: "Menaiki anak tangga satu per satu dengan memegang rel",
                month: 22,
                warningMonth: 24,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:286,
                titleEN: "Kicks ball with demonstration",
                title: "Bisa menendang bola setelah ditunjukkan",
                month: 22,
                warningMonth: 24,
                category: .motoric,
                stimulusID: [8]
            ),
            Milestone(
                id:287,
                titleEN: "Closes box with lid",
                title: "Menutup wadah dengan tutupnya",
                month: 22,
                warningMonth: 24,
                category: .motoric,
                stimulusID: [19]
            ),
            Milestone(
                id:288,
                titleEN: "Imitates vertical line",
                title: "Membuat garis lurus saat dicontohkan",
                month: 22,
                warningMonth: 24,
                category: .motoric,
                stimulusID: [17]
            ),
            Milestone(
                id:289,
                titleEN: "Imitates circular scribble",
                title: "Membuat coretan berbentuk bulat setelah ditunjukkan",
                month: 22,
                warningMonth: 24,
                category: .motoric,
                stimulusID: [17]
            ),
            Milestone(
                id:290,
                titleEN: "Uses spoon well",
                title: "Bisa menggunakan sendok dengan benar",
                month: 22,
                warningMonth: 24,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:291,
                titleEN: "Drinks from cup well",
                title: "Minum dari gelas dengan baik",
                month: 22,
                warningMonth: 24,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:292,
                titleEN: "Unzips zippers",
                title: "Membuka resleting",
                month: 22,
                warningMonth: 24,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:293,
                titleEN: "Puts shoes on partway",
                title: "Menyimpan sepatu pada tempatnya setelah melepaskannya",
                month: 22,
                warningMonth: 24,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:294,
                titleEN: "Watches other children intensely",
                title: "Memerhatikan anak lain dengan seksama",
                month: 22,
                warningMonth: 24,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:295,
                titleEN: "Begins to show defiant behavior",
                title: "Mulai menunjukkan perilaku membangkang (tidak nurut)",
                month: 22,
                warningMonth: 24,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:296,
                titleEN: "Points to four to five pictures when named",
                title: "Menunjuk pada 4 - 5 gambar saat disebutkan namanya",
                month: 22,
                warningMonth: 24,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:297,
                titleEN: "Points to five to six bodyparts",
                title: "Menunjuk pada 5 - 6 bagian tubuh",
                month: 22,
                warningMonth: 24,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:298,
                titleEN: "Points to four pieces of cloth- ing when named",
                title: "Menunjuk pada 4 jenis pakaian saat disebutkan namanya",
                month: 22,
                warningMonth: 24,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:299,
                titleEN: "Uses 25 to 50 words",
                title: "Berbicara menggunakan 25 sampai dengan 50 kata",
                month: 22,
                warningMonth: 24,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:300,
                titleEN: "Asks for more",
                title: "Bisa meminta kepada orang tua (Contoh: minta tambah saat dikasih makan)",
                month: 22,
                warningMonth: 24,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:301,
                titleEN: "Adds one to two words / week",
                title: "Menambah 1 - 2 kosa kata setiap minggunya",
                month: 22,
                warningMonth: 24,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:302,
                titleEN: "Walks down stairs holding rail, both feet on each step",
                title: "Menuruni anak tangga satu per satu dengan memegang rel",
                month: 24,
                warningMonth: 28,
                category: .motoric,
                stimulusID: [13]
            ),
            Milestone(
                id:303,
                titleEN: "Kicks ball without demonstration",
                title: "Bisa menendang bola tanpa arahan",
                month: 24,
                warningMonth: 28,
                category: .motoric,
                stimulusID: [8]
            ),
            Milestone(
                id:304,
                titleEN: "Throws overhand",
                title: "Melempar dengan ayunan tangan yang tinggi",
                month: 24,
                warningMonth: 28,
                category: .motoric,
                stimulusID: [8]
            ),
            Milestone(
                id:305,
                titleEN: "Makes a single- line “train” of cubes",
                title: "Menyusun balok secara berurutan horizontal",
                month: 24,
                warningMonth: 28,
                category: .motoric,
                stimulusID: [7]
            ),
            Milestone(
                id:306,
                titleEN: "Imitates circle",
                title: "Bisa meniru gambar berbentuk lingkaran",
                month: 24,
                warningMonth: 28,
                category: .motoric,
                stimulusID: [17]
            ),
            Milestone(
                id:307,
                titleEN: "Imitates horizontal line",
                title: "Bisa meniru gambar garis lurus",
                month: 24,
                warningMonth: 28,
                category: .motoric,
                stimulusID: [17]
            ),
            Milestone(
                id:308,
                titleEN: "Opens door using knob",
                title: "Membuka pintu dengan memegang gagang pintu",
                month: 24,
                warningMonth: 28,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:309,
                titleEN: "Sucks through a straw",
                title: "Bisa menyedot dengan menggunakan sedotan",
                month: 24,
                warningMonth: 28,
                category: .cognitive,
                stimulusID: [18]
            ),
            Milestone(
                id:310,
                titleEN: "Takes off clothes without buttons",
                title: "Bisa melepaskan baju sendiri (yang tidak memiliki kancing)",
                month: 24,
                warningMonth: 28,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:311,
                titleEN: "Pulls off pants",
                title: "Bisa melepaskan celana",
                month: 24,
                warningMonth: 28,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:312,
                titleEN: "Sorts objects",
                title: "Mensortir benda (makanan dengan makanan, mainan dengan mainan)",
                month: 24,
                warningMonth: 28,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:313,
                titleEN: "Matches objects to pictures",
                title: "Menyocokkan benda dengan gambarnya",
                month: 24,
                warningMonth: 28,
                category: .cognitive,
                stimulusID: [3]
            ),
            Milestone(
                id:314,
                titleEN: "Shows use of familiar objects",
                title: "Dapat menggunakan benda sehari Hari (contoh: sikat gigi, sendok garpu)",
                month: 24,
                warningMonth: 28,
                category: .cognitive,
                stimulusID: [19]
            ),
            Milestone(
                id:315,
                titleEN: "Parallel play",
                title: "Dapat bermain bersebelahan dengan bayi lainnya tapi memainkan mainan yang berbeda",
                month: 24,
                warningMonth: 28,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:316,
                titleEN: "Begins to mask emotions for social etiquette",
                title: "Dapat menjaga sikap di tempat umum",
                month: 24,
                warningMonth: 28,
                category: .social,
                stimulusID: []
            ),
            Milestone(
                id:317,
                titleEN: "Follows two-step command",
                title: "Mengikuti arahan dua langkah",
                month: 24,
                warningMonth: 28,
                category: .language,
                stimulusID: [4]
            ),
            Milestone(
                id:318,
                titleEN: "Understands me/you",
                title: "Mengerti konsep arti dari kata “saya” dan “kamu”",
                month: 24,
                warningMonth: 28,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:319,
                titleEN: "Points to 5 to 10 pictures",
                title: "Dapat menunjuk 5 sampai 10 gambar",
                month: 24,
                warningMonth: 28,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:320,
                titleEN: "Two-word sentence (noun + verb)",
                title: "Berbicara dengan menggunakan kata benda dan kata kerja (Contoh: “mama makan”)",
                month: 24,
                warningMonth: 28,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:321,
                titleEN: "Telegraphic speech",
                title: "Berbicara dengan menggunakan beberapa kata simpel (contoh: “sepatu basah” atau “kucing makan”)",
                month: 24,
                warningMonth: 28,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:322,
                titleEN: "Uses 50+ words",
                title: "Berbicara menggunakan lebih dari 50 kata",
                month: 24,
                warningMonth: 28,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:323,
                titleEN: "Refers to self by name",
                title: "Mengacu pada diri sendiri dengan nama",
                month: 24,
                warningMonth: 28,
                category: .language,
                stimulusID: [3]
            ),
            Milestone(
                id:324,
                titleEN: "Names three pictures",
                title: "Dapat mengenali dan menyebutkan 3 objek gambar",
                month: 24,
                warningMonth: 28,
                category: .language,
                stimulusID: [3]
            ),
        ]
    }
}
