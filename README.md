# Modern-SwiftUI-Bootcamp

# Ödev 1.1 – Değişkenler ve Veri Tipleri
Primitif tipler üzerinde çalışmalar yapıldı. Dosya projede **Content/Lesson01.swift** adında bulunmakta.


# Ödev 1.2 –  Fonksiyonlar ve Closure’lar
Fonksiyonların tanımlanması, kullanımı, duruma bağlanmaları, kullanıcıdan girdi beklemeleri gibi işlemler tamamlandı.
Ayrıca closure'lara örnek olarak diziler üzerinde işlemler gösterildi.
Dosya proje **Content/Lesson02.swift** adında bulunmakta.


# Ödev 1.3 - SwiftUI Layout'larıyla Harika Arayüzler Tasarlama
SwiftUI'a giriş mahiyetinde temel bileşenler kullanılarak kartlar, text alanları, butonlar vs. tasarlama ödevi tamamlandı
Bu ödevde:
* Kişi kartının oluşturulması
* Yatayda sıralanmış bilgi kartlarının oluşturulması
* Scrol edilebilir text alanının eklenmesi
* Butonların eklemesi görevleri gerçekleştirilmiştir. 


# Ödev 3 - @State ile basit sayaç uygulaması
İşlenen derste gösterilen State yapısının uygulanması için basit bir sayaç uygulaması geliştirildi
* Tek ekrandan oluşan yatay düzende sıralanmış 2 buton ile bir text bileşeni kullanıldı.

# Ödev 4 - MVVM tasarı deseniyle uygulama oluşturma
İşlenen derste gösterilen MVVM tasarı desenine göre basit bir görev yönetim uygulaması geliştirildi 
* Modeller oluşturuldu
* ViewModel ara katman oluşturuldu
* View ile modellerdeki verileri viewmodel kullanarak ekranlara yansıtma işlemi gerçekleştirildi

# Ödev 6 - Form, Modal ve Detay ekranlarından oluşan Etkinlik Uygulaması
İşlenen derste gösterilen bileşenleri kullanarak basit bir etkinlik uygulaması geliştirildi
* Ön tanımlı birkaç etkinlikliğin listelenmesi
* Yeni etkinlik ekleme
* Var olan etkinliği silme
* Etkinlik Detayına gitme
* Etkinlik Detayında yapılan değişikliklerin listede görüntülenmesi

# Ödev 8 - UserDefaults kullanılarak geliştirilen Note uygulaması
İşlenen derste gösterilen bileşenleri kullanarak basit bir not uygulaması geliştirildi
* Yeni Not ekleme 
* Notları listeleme
* Var olan notu güncelleme / silme

# Ödev 9 - CoreData kullanılarak geliştirilen Note uygulaması
İşlenen derste gösterilen bileşenleri kullanarak basit bir not uygulaması geliştirildi
* Yeni Not ekleme 
* Notları listeleme
* Var olan notu güncelleme / silme


# Ödev 10 - PokeAPI SwiftUI Demo

**Amaç:** SwiftUI + URLSession kullanarak gerçek bir API’den veri çekmek, JSON’u `Codable` ile decode edip arayüzde göstermek.

## API
* **PokeAPI**: https://pokeapi.co/
* Kullanılan uç nokta: `GET /api/v2/pokemon?limit=50`

## Özellikler
* URLSession + async/await ile ağ isteği
* Codable model (liste yanıtı + öğe)
* List içinde gösterim
* Hata yönetimi (internet yok, decode hatası vs. durumlarında mesaj ve “Tekrar Dene”)
- **Ekstra olarak:**
  * Arama/filtre (searchable)
  * Detay sayfası (NavigationStack + navigationDestination)
  * Asenkron görsel yükleme (`AsyncImage`) – sprite URL’si id’den üretilir
