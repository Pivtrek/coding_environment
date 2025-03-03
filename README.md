# coding_environment

## Opis 
To repozytorium zawiera rozwiązanie zadań na zajęcia środowisko programisty w bashu.

## Treści zadań 

- **Lista 1** -
 **Zadanie 1.**

    Napisz skrypt, który jako argument otrzymuje:
    
        ścieżkę do katalogu (korzenia poddrzewa katalogów, zawierającego pliki tekstowe),
    
    i drukuje listę wszystkich regularnych plików (nie katalogów) w tym poddrzewie.

**Zadanie 2.**

    Skrypt, wywoływany jak w zadaniu 1, który dla wszystkich słów występujących w plikach w danym poddrzewie katalogów, drukuje statystyki, ile razy dane słowo wystąpiło we wszystkich tych plikach.
    
    Przez słowo rozumiemy każdy niepusty podciąg sąsiadujących znaków liter ograniczony białymi znakami (white space).
    
    Uwaga: Można założyć, że w plikach występują tylko litery, spacje i znaki nowej linii.
    

**Zadanie 3.**

    Skrypt, wywoływany jak w zadaniu 1, który dla każdego słowa pojawiającego się w plikach danego poddrzewa katalogów, drukuje liczbę plików, w których to słowo występuje.
    

**Zadanie 4.**

    Skrypt, wywoływany jak w zadaniu 1, który dla każdego słowa pojawiającego się w plikach danego poddrzewa katalogów, drukuje linie, w których to słowo występuje, poprzedzone nazwą pliku, z którego pochodzą.

**Zadanie 5.**

    Skrypt, wywoływany jak w zadaniu 1, który we wszystkich plikach zastępuje wszystkie wystąpienia znaku ‘a’ znakiem ‘A’.


**Zadanie 6.**

    Skrypt, wywoływany jak w zadaniu 1, który drukuje słowa występujące więcej niż raz w jakimś wierszu, wraz z tymi wierszami i nazwami plików, z których te wiersze pochodzą.

- **Lista 3 - Zadanie 1.**

    Studenci zostali podzieleni na cztery grupy ze względu na dwie ostatnie cyfry numeru indeksu i uzyskali dostęp do odpowiednich repozytoriów.
    
    Każda grupa ma wspólnie pracować nad stworzeniem aplikacji `app_1` w swoim repozytorium. W ramach każdej grupy każdy student ma dorobić swój własny moduł dodający jakąś funkcjonalność, wykonując następujące czynności:
    
        - utworzyć swoją kopię roboczą projektu,
        - przejrzeć plik `README` i pozostałe pliki, aby zorientować się w zasadach organizacji projektu i nazywania plików oraz katalogów,
        - utworzyć własne rozgałęzienie w `app1/branches`, w którym zaimplementuje swój własny podprogram,
        - zsynchronizować swoją gałąź z `trunk`-iem (być może kilka razy),
        - zreintegrować swoją gałąź z `trunk`-iem,
        - usunąć niepotrzebną gałąź po reintegracji,
        - utworzyć tag-a z poprawną wersją projektu zawierającą własny podprogram,
        - w prezentacji pokazać, że program z utworzonego tag-a kompiluje się i wykonuje poprawnie.
    
    Wykonując polecenia należy je nagrywać z terminala wraz z wyświetlanymi komunikatami do sprawozdań asciinema.
    
    Można utworzyć więcej niż jedno nagranie, ale ich nazwy powinny zawierać numery wskazujące kolejność wyświetlania. Ostatnie nagranie należy zakończyć poleceniem `svn log -v ...` dla utworzonego tag-a. Utworzone prezentacje można skleić w jedną, nagrywając wykonanie skryptu, który odtwarza je w kolejności.  
    Przykład:
    
        svn cat https://repo.cs.pwr.edu.pl/info/asciinema/6_sklejanie_prezentacji.cast | asciinema play -i 0.1 -
    
    W każdym repozytorium swoje zadanie wykonał „Sztuczny Student” o numerze indeksu 999. Nie uzyskał zaliczenia, bo zapomniał usunąć swoją gałąź i nie przygotował sprawozdania. Pozostałe czynności wykonał poprawnie – można to prześledzić poleceniami `svn log ...` oraz `svn diff ...`.
    
    Uwaga: Zadania 1. nie warto odkładać na ostatnią chwilę, gdyż wtedy pojawia się najwięcej konfliktów.
    
    **Nagrania asciinema:**
    
    Odpowiednie nagrania wykonane przy pomocy programu asciinema znajdują się w plikach `ex-1.1.cast` oraz `ex-1.2.cast`.
    
    **Polecenia, które należy wykonać w celu realizacji zadania:**
    
        - Wykonujemy: `bash . ../repo.sh` – dzięki temu zmienna `$RP` będzie zawierać adres główny do wszystkich repozytoriów z tego kursu.
        - Tworzymy kopię roboczą projektu: `bash svn co $RP/p_75`
        - Wchodzimy w katalog `app_1/trunk` i odczytujemy plik `README`.
        - W pliku `README` zapisujemy opis naszego podprogramu.
        - Rozglądamy się w projekcie – zauważamy pliki `program.h`, `main.c`, `program_usage.c` oraz podprogramy innych studentów (np. `s*_podprogram.c`).
        - Tworzymy nową gałąź: `bash svn copy $RP/p_75/app_1/trunk $RP/p_75/app_1/branches/250075`
        - Tworzymy nowy plik `s250075_podprogram.c` (funkcja w języku C).
        - Modyfikujemy pliki `program.h`, `makefile` oraz `main.c`, aby podpiąć nasz podprogram pod główny program.
        - Wykonujemy: `bash svn commit -m 'added a new subprogram that prints a given real number in its scientific notation'`
        - Aktualizujemy plik `README` (dodajemy opis podprogramu) i commitujemy zmiany.
        - Przechodzimy do katalogu `^/app_1/trunk`.
        - Reintegration zmian z gałęzi: `bash svn merge ^/app_1/branches/250075`
        - Usuwamy gałąź: `bash svn rm ^/app_1/branches/250075`
        - Tworzymy tag: `bash svn copy ^/app_1/trunk ^/app_1/tags/v_250075`
        - Nagranie `ex-1.cast` pokazuje, że wersja programu w `^/app_1/tags/v_250075` kompiluje się i działa poprawnie.
    
    **Skrypt pomocniczy do zadań 2. i 3.:**
    
        Do zadań 2. i 3. używamy skryptu `svn-ls-all.sh`, który wypisuje wszystkie pliki w danym podkatalogu repozytorium dla konkretnej rewizji.
    
    **Zadanie 2.:**
    
        Napisz skrypt, który jako argument otrzymuje:
        
        - Numer rewizji w repozytorium SVN
        - URL do katalogu (korzenia poddrzewa katalogów z plikami tekstowymi)
        
        Skrypt powinien dla wszystkich słów występujących w plikach danego poddrzewa w danej rewizji, drukować statystyki – ile razy dane słowo wystąpiło we wszystkich tych plikach. (Odpowiednik zadania 2 z listy 1.)
        
        Niech skrypt będzie zapisany jako: `./l3z2.bash`.
        
        W prezentacji umieść wykonanie poleceń:
        
            ./l3z2.bash 15 https://repo.cs.pwr.edu.pl/info/SP-20-21/l3/a/
            ./l3z2.bash 18 https://repo.cs.pwr.edu.pl/info/SP-20-21/l3/a/
        
        Plik `l3z2.bash` jest rozwiązaniem tego zadania. Jego działanie można zobaczyć na nagraniu `ex-2.cast`.
    
    **Zadanie 3.:**
    
        Skrypt, wywoływany jak w zadaniu 2, który dla każdego słowa pojawiającego się w plikach danego poddrzewa w danej rewizji, drukuje liczbę plików, w których to słowo występuje. (Odpowiednik zadania 3 z listy 1.)
        
        Niech skrypt będzie zapisany jako: `./l3z3.bash`.
        
        W prezentacji umieść wykonanie poleceń:
        
            ./l3z3.bash 15 https://repo.cs.pwr.edu.pl/info/SP-20-21/l3/a/
            ./l3z3.bash 18 https://repo.cs.pwr.edu.pl/info/SP-20-21/l3/a/
        
        Plik `l3z3.bash` jest rozwiązaniem tego zadania. Jego działanie można zobaczyć na nagraniu `ex-3.cast`.

- **Lista 4 - Zadanie 1.:**

    Każdy student (który dostarczył poprawny klucz publiczny) ma dostęp do repozytoriów GIT na serwerze `156.17.7.16` przez system Gitolite.
    
    Podobnie jak w zadaniu 1 z listy 3, studenci są podzieleni na grupy ze względu na dwie ostatnie cyfry numeru indeksu i mają dostęp do jednej z następujących piaskownic:
    
        - git@156.17.7.16:sandbox-20-21_00
        - git@156.17.7.16:sandbox-20-21_25
        - git@156.17.7.16:sandbox-20-21_50
        - git@156.17.7.16:sandbox-20-21_75
    
    Repozytorium można sklonować, np.:
    
        $ git clone git@156.17.7.16:sandbox-20-21_00
    
    Należy wykonać w GIT zadanie analogiczne do zadania 1 z listy 3, używając mechanizmów tworzenia rozgałęzień i etykietowania (branching, tagging) typowych dla GITa.
    
    Podobnie jak poprzednio, student 999 wykonał już swoje zadanie. Należy uważnie prześledzić historię:
    
        $ git log --all --graph --decorate
    
    oraz przejrzeć utworzony tag:
    
        $ git show s999
