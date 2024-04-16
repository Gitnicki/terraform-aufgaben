# Terraform Übungsaufgaben

Aufgabe 1: Lokale Datei erstellen
Erstelle eine lokale Datei mit dem Namen `hello.txt`, die den Text "Hello, Terraform!" enthält.

Aufgabe 2: Zufallszahl generieren
Generiere eine zufällige Zahl zwischen 1 und 100 und gib sie als Output aus.

Aufgabe 3: Zufalls-String erstellen
Erstelle einen zufälligen String der Länge 10 und verwende ihn als Teil eines Filenamens.

Aufgabe 4: Zertifikat generieren
Benutze den TLS Provider und erstelle ein selbstsigniertes TLS-Zertifikat für die Domain `example.com`.

Aufgabe 5: Template rendern
Erstelle eine Konfigurationsdatei `config.json` mit den Key/Value Pairs "user" und "password" durch Rendern eines Templates.
Hint: Nutze die template_file Funktion: 
https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file

Aufgabe 6: Archive erstellen
Erstelle ein ZIP-Archiv mit den Dateien im Ordner `data/files`.
Hint: Nutze den Archive Provider

Aufgabe 7: HTTP-Daten abrufen
Abrufen von Daten von einer öffentlich zugänglichen URL (https://api.chucknorris.io/jokes/random) und speichere die Antwort in einer lokalen Datei.
Hint: Nutze den HTTP Provider

Aufgabe 8: Bedingte Ressourcenerstellung
Erstelle eine lokale Datei nur, wenn eine bestimmte Bedingung erfüllt ist (z. B. eine Terraform-Variable `create_file` ist `true`).

Aufgabe 9: Nutze `null_resource` für ein Skript
Führe ein lokales Shell-Skript aus, wenn Terraform angewendet wird.
Hint: Nutze den NULL Provider

Aufgabe 10: Output eines zufälligen Passworts
Generiere ein zufälliges sicheres Passwort und gib es als Output aus.

Aufgabe 11: Dynamische Subnetz-Erstellung
Verwende den `random` Provider, um eine zufällige Anzahl von Subnetzen (zwischen 1 und 5) zu generieren und diese dynamisch in einer lokalen Datei zu speichern.
HINT: Es gibt für Resources ein "count" Attribut

Zusatzaufgabe: Zufällige Farbzuweisung
Erstelle ein zufälliges Farbschema durch Generierung von drei zufälligen Hexadezimal-Farbwerten (für RGB) und speichere diese in einer lokalen Datei.

Aufgabe160424: Erstelle mit Terraform eine EC2 Instanz in einem (auch mit TF erstellten) VPC mit einem public Subnet. Die EC2 Instanz soll eine public IP-Adresse bekommen und über Terraform so konfiguriert werden, dass der Podfinfo Docker Container (https://github.com/stefanprodan/podinfo) auf der Instanz läuft und die Weboberfläche des Containers über die IP abrufbar ist.
Nutze dafür die Terraform AWS Module VPC & EC2