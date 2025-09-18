```md
# PokeAPI SwiftUI Demo

**Amaç:** SwiftUI + URLSession kullanarak gerçek bir API’den veri çekmek, JSON’u `Codable` ile decode edip arayüzde göstermek.

## API
- **PokeAPI**: https://pokeapi.co/
- Kullanılan uç nokta: `GET /api/v2/pokemon?limit=50`

## Özellikler
- URLSession + async/await ile ağ isteği
- Codable model (liste yanıtı + öğe)
- List içinde gösterim
- Hata yönetimi (internet yok, decode hatası vs. durumlarında mesaj ve “Tekrar Dene”)
- **Ekstra olarak:**
  - Arama/filtre (searchable)
  - Detay sayfası (NavigationStack + navigationDestination)
  - Asenkron görsel yükleme (`AsyncImage`) – sprite URL’si id’den üretilir

