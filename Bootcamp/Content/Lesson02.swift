//
//  main.swift
//  Bootcamp
//
//  Created by Ertan Şinik on 17.08.2025.
//

import Foundation

// MARK: - ÖDEV 1.2 – Fonksiyonlar ve Closure’lar
print("********************************************************")
print("********* ÖDEV 1.2 – Fonksiyonlar ve Closure’lar *******")

// Hesap makinesi fonksiyonu
func calculate(_ a: Double, _ b: Double, operation: String) -> Double? {
    switch operation {
    case "1": // Toplama
        return a + b
    case "2": // Çıkarma
        return a - b
    case "3": // Çarpma
        return a * b
    case "4": // Bölme
        return b != 0 ? a / b : nil
    default:
        return nil
    }
}

// Kullanıcıdan değer alma
print("\nBirinci sayıyı girin:")
let input1 = readLine() ?? "0"

print("\nİkinci sayıyı girin:")
let input2 = readLine() ?? "0"

let number1 = Double(input1) ?? 0
let number2 = Double(input2) ?? 0

// İşlem menüsü
print("""
\n==============
Yapmak istediğiniz işlemi seçin:
1 - Toplama
2 - Çıkarma
3 - Çarpma
4 - Bölme
=============\n
""")

let choice = readLine() ?? ""

// Hesaplama
if let result = calculate(number1, number2, operation: choice) {
    print("\nSonuç: \(result)")
} else {
    print("\nGeçersiz işlem seçtiniz.")
}
print("******************")


// --- Closure ile filtreleme ve sıralama ---
let numbers = [12, 5, 7, 20, 3, 15]

// 10’dan büyük sayıları filtreleme
let filtered = numbers.filter { $0 > 10 }

// Büyükten küçüğe doğru sıralama
let sorted = filtered.sorted { $0 > $1 }

print("\n++++++++++++++++++++++++")
print("Closure işlemleri: \n")
print("Orijinal:", numbers)
print("Filtrelenmiş:", filtered)
print("Sıralanmış:", sorted)
print("\n++++++++++++++++++++++++")
print("********************************************************")
