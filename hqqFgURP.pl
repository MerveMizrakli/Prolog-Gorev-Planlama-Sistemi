%Merve Mızraklı
%1220505052

% Takım üyelerinin çalışma saatleri belirledim.
calisma_saati(murat, 9, 17).
calisma_saati(hande, 10, 18).
calisma_saati(fatih, 8, 16).
calisma_saati(melek, 11, 19).

% Görevlerin süreleri
gorev_suresi(kodlama, 4).
gorev_suresi(tasarim, 3).
gorev_suresi(test, 5).
gorev_suresi(entegrasyon, 6).
gorev_suresi(debug, 5).

bagimlilik(kodlama, entegrasyon).
bagimlilik(tasarim, kodlama).
bagimlilik(entegrasyon, debug).
bagimlilik(kodlama, test).

% Görev bir üyeye atanması için verilen argümanlara bağlı olarak yapılan kontroller.
gorev_atama(Uye, Gorev, BaslangicSaati) :-
    calisma_saati(Uye, CalismaBaslangic, CalismaBitis),
    gorev_suresi(Gorev, GorevSuresi),
    MaxBaslangic is CalismaBitis - GorevSuresi + 1,
    between(CalismaBaslangic, MaxBaslangic, BaslangicSaati),
    BitisSaati is BaslangicSaati + GorevSuresi,
    BitisSaati =< CalismaBitis,
    \+ (gorev_cakismasi(Uye, BaslangicSaati, BitisSaati)).

% Görev çakışma kontrolü
gorev_cakismasi(Uye, BaslangicSaati, BitisSaati) :-
    gorev_atama(Uye, _, DigerBaslangic),
    gorev_suresi(_, DigerSuresi),
    DigerBitis is DigerBaslangic + DigerSuresi,
    (BaslangicSaati < DigerBitis, DigerBaslangic < BitisSaati).


gorev_uygun_mu(Gorev, Tamamlananlar) :-
    findall(Bagimli, bagimlilik(Bagimli, Gorev), Bagimliliklar),
    subset(Bagimliliklar, Tamamlananlar).

% Görev planlama işlemi
gorev_plani([], _, []). % Görev kalmadıysa plan boş
gorev_plani([Gorev | KalanGorevler], Tamamlananlar, [Plan | KalanPlanlar]) :-
    gorev_uygun_mu(Gorev, Tamamlananlar),
    member(Uye, [murat, hande, fatih, melek]), % Uygun bir üye seç
    gorev_atama(Uye, Gorev, BaslangicSaati),
    Plan = gorev(Uye, Gorev, BaslangicSaati),
    gorev_plani(KalanGorevler, [Gorev | Tamamlananlar], KalanPlanlar).

% Görev listesi
gorev_listesi([tasarim, kodlama, test, entegrasyon, debug]).

% Oluşturulacak olan plan.
zaman_plani(Plan) :-
    gorev_listesi(Gorevler),
    gorev_plani(Gorevler, [], Plan).