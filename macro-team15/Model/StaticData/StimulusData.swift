//
//  StimulusData.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 01/12/22.
//

import Foundation

struct Stimulus: Hashable, Identifiable {
    let id: Int
    
    let type: StimulusType
    let categories: [MilestoneCategory]
    let activityName: String
    let activities: [String]
    let materials: [Int]?
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
                materials: [1, 6]
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
                materials: [1, 7]
            ),
        ]
    }
}
