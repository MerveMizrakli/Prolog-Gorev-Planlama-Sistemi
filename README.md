# Takım Görev Planlama Sistemi

Bu Prolog programı, bir yazılım takımının görevlerini üyelere atayan ve çakışmaları önleyen akıllı bir planlama sistemidir.

## Özellikler

- Takım üyelerinin çalışma saatlerini dikkate alır
- Görevler arasındaki bağımlılıkları yönetir
- Zaman çakışmalarını önler
- Optimal görev atamaları yapar

## Kullanım

1. Prolog interpreter'ını başlatın
2. Program dosyasını yükleyin
3. `zaman_plani(Plan).` sorgusunu çalıştırın

Örnek çıktı:
```prolog
Plan = [
    gorev(Üye1, Görev1, BaşlangıçSaati1),
    gorev(Üye2, Görev2, BaşlangıçSaati2),
    ...
]
Veri Yapısı
Takım Üyeleri
murat: 09:00-17:00

hande: 10:00-18:00

fatih: 08:00-16:00

melek: 11:00-19:00

Görevler
kodlama: 4 saat

tasarım: 3 saat

test: 5 saat

entegrasyon: 6 saat

debug: 5 saat

Bağımlılıklar
tasarım → kodlama

kodlama → test

kodlama → entegrasyon

entegrasyon → debug

Geliştirme
Programın temel işlevselliği:

Görev bağımlılıklarını kontrol eder

Üyelerin müsaitlik durumunu kontrol eder

Çakışma olmayacak şekilde görev ataması yapar
