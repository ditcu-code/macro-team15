//
//  MatrialData.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 01/12/22.
//

import Foundation

struct ActivityMaterial: Hashable, Identifiable {
    var id: Int
    
    var image: String
    var name: String
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
