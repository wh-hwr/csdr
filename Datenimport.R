# Daten importieren im Tidyverse::Schummelzettel ----
## https://github.com/rstudio/cheatsheets/blob/master/data-import.pdf

# Paket installieren und laden ----
install.packages("readr") # nach der Installation Zeile mit # auskommentieren
library(readr)

# Erstellen von vier häufig verwendeten Tabellentypen ----
write_file(x = "A|B|C\n1|2|3\n4|5|NA", 
           file = "file.txt")
write_file(x = "A,B,C\n1,2,3\n4,5,NA", 
           file = "file.csv")
write_file(x = "A;B;C\n1,5;2;3\n4,5;5;NA", 
           file = "file2.csv")
write_file(x = "A\tB\tC\n1\t2\t3\n4\t5\tNA", 
           file = "file.tsv")

# Einlesen der vier Tabellentypen ----
data_txt <- read_delim("file.txt")
data_csv <- read_csv("file.csv")
data_csv2 <- read_csv2("file2.csv")
data_tsv <- read_tsv("file.tsv")

# Aufgaben zur Verdeutlichung von häufigen Problemen ----
## Lesen Sie "file.csv" mit read_tsv() ein. Was ist passiert?
aufgabe <- read_tsv("file.csv")
## Lesen Sie "file2.csv" mit read_csv() ein. Was ist passiert?
aufgabe2 <- read_csv("file2.csv")
## Lesen Sie "file.csv" mit read_csv2() ein. Was ist passiert?
aufgabe3 <- read_csv2("file.csv")

# Aufgaben zum Einlesen der csv Datensätze über den RStudio Wizard ---- 
## Tipp: Nutzen Sie den folgenden Schummelzettel, um den Wizard zu finden
## https://github.com/rstudio/cheatsheets/blob/master/rstudio-ide.pdf

## Importieren Sie den normalen Datensatz file.csv über den Wizard
#library(readr)
file <- read_csv("file.csv")
#View(file)

## Importieren Sie den Datensatz file2.csv über den Wizard
#library(readr)
file2 <- read_delim("file2.csv", 
                    delim = ";", 
                    escape_double = FALSE, 
                    locale = locale(decimal_mark = ","), 
                    trim_ws = TRUE)
#View(file2)

## Benutzen Sie die Hilfefunktion, um herauszufinden, 
## was die zusätzlichen Argumente bedeuten
help("read_delim")

# Amerikanisches csv ins deutsche csv2 umwandeln ----

## Öffnen Sie "file.csv" und "file2.csv" mit Excel. Was ist passiert?

## Schreiben Sie die amerikanischen Daten file.csv in eine vom 
## deutschen Excel lesbare Datei "file3.csv" mit write_csv2()
## Nutzen Sie den Schummelzettel sowie help(write_csv2)
help(write_csv2)
write_csv2(x = file, 
           file = "file3.csv")

# Aufgaben zum Einlesen / Schreiben der csv Datensätze über den R Commander ----
## Installieren Sie den R Commander
install.packages("Rcmdr") # nach der Installation Zeile mit # auskommentieren

## Laden Sie den R Commander
library("Rcmdr") # beim ersten Laden werden u.U. weitere Pakete installiert

## Lesen Sie file.csv mit den Standardeinstellungen ein. Was ist passiert?
## Nutzen Sie die Hilfefunktion, um das Problem zu lösen
help(read.table)

## Versuchen Sie es erneut nach folgendem Rezept:
### Klick Datenmanagement
### Klick Importiere Daten
### Klick aus Textdatei, Zwischenablage, oder URL ...
### Setze **Datenfeldtrennzeichen** auf Komma
Dataset <- read.table("H:/R/csdr/file.csv", # ggf. durch ihren Pfad ersetzen
                      header=TRUE, 
                      stringsAsFactors=TRUE, 
                      sep=",", 
                      na.strings="NA", 
                      dec=".", 
                      strip.white=TRUE)

## Lesen Sie das deutsche file2.csv als Dataset2 ein mit 
## Datenfeldtrennzeichen sep=";" und 
## Dezimaltrennzeichen dec=","
Dataset2 <- read.table("H:/R/csdr/file2.csv", # ggf. durch ihren Pfad ersetzen
                      header=TRUE, 
                      stringsAsFactors=TRUE, 
                      sep=";", 
                      na.strings="NA", 
                      dec=",", 
                      strip.white=TRUE)

## Exportieren Sie den Datensatz Dataset2 in eine vom 
## deutschen Excel lesbare Datei "Dataset2.csv"
### Rezept: Dataset2 auswählen
### Datenmanagement > Aktive Datenmatrix > Exportiere aktive Datenmatrix...
### Datenfeldtrennzeichen auf Strichpunkt [;] setzen
### Den Dateinamen von Dataset.txt auf Dataset.csv wechseln und speichern
write.table(Dataset2, 
            "H:/R/csdr/Dataset2.csv", 
            sep=";", 
            col.names=TRUE, 
            row.names=TRUE, 
            quote=TRUE, 
            na="NA")
### Mit Excel öffnen. Was ist das Problem?
### Lösen Sie das Problem mit der Hilfefunktion
help(write.table)
### Neuer Code (händisch angepasst) als Dataset3.csv exportieren
write.table(Dataset2, 
            "H:/R/csdr/Dataset3.csv", 
            sep=";",
            dec=",",
            col.names=TRUE, 
            row.names=TRUE, 
            quote=TRUE, 
            na="NA")
### Mit Excel öffnen. Was ist passiert?
### Überlegen Sie wie Sie den letzen Codechunk schöner schreiben können
#### Nutzen Sie die Hilfefunktion
#### Ergänzen Sie die Argumentbezeichnungen 
#### Benutzen Sie relative statt absolute Pfade (nutzen Sie Autocomplete mit TAB)
#### Wechseln Sie den Namen von "Dataset3.csv" auf "Dataset4.csv"
#### Löschen Sie Argumente, die nicht von den Defaults abweichen
#### Benutzen Sie Leerzeichen (und setzen Sie Absätze)
write.table(x = Dataset2, 
            file = "Dataset4.csv", 
            sep=";",
            dec=",")
#### Mit Excel öffnen. Was ist passiert?
#### Vergleichen Sie das Ergebnis zum obigen Ergebnis, bei dem Sie die
#### Funktion write_csv2() verwendet haben. Welches Verfahren finden Sie besser?
#### Selber Programmieren mit Schummelzettel oder 
#### Drop & Click mit R Commander, Anpassung mit Hilfefunktion & 
#### händische Verschönerung des Codes? 

# Hausaufgaben----
## 1) Installieren Sie R auf Ihren Rechner (siehe Links auf Kursseite)
## 2) Installieren Sie RStudio auf ihren Rechner
## 3) Führen Sie zur Nachbereitung das Skript "Datenimport.R" zeilenweise aus
