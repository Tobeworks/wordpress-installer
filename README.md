Natürlich! Hier ist die deutsche README.md mit der gleichen Inhalt:

---

# Installationsskript für WordPress

Dieses Skript automatisiert die Installation von WordPress, WooCommerce und zusätzlichen Plugins auf einem Server. Es verwendet das `wp-cli`-Tool zum Verwalten von WordPress-Installationsprozessen.

## Voraussetzungen

1. **PHP**: Stelle sicher, dass PHP installiert ist und in deinem Systems PATH verfügbar ist.
2. **wp-cli**: Downloade das `wp-cli.phar`-Datei von [WordPress CLI](https://wp-cli.org/) und speichere es im Verzeichnis, in dem du dieses Skript ausführen möchtest (`../bin/`).
3. **MySQL/MariaDB**: Stelle sicher, dass ein MySQL oder MariaDB-Datenbankserver bereitgestellt ist mit den entsprechenden Zugangsdaten.

## Konfiguration

- **Datenbankname**: `wordpress`
- **Datenbankbenutzer**: `wordpress`
- **Datenbankpasswort**: `dbpass`
- **Site URL**: `woo.tobeworks.de`

### Adminkonfiguration

- **Admin-Benutzername**: `admin`
- **Admin-E-Mail**: `hallo@tobeworks.de`
- **Zweiter Admin-Benutzername**: `Test`
- **Zweiter Admin-E-Mail**: `test@test.tdl`
- **Fallback-Thema**: `twentytwentyfour`

## Installationsschritte

1. **Prüfung der Voraussetzungen**: Das Skript überprüft, ob `wp-cli` installiert ist und die notwendigen Dateien vorhanden sind.

2. **Installieren des WordPress-Korens**: Laden und installieren Sie die aktuelle Version von WordPress in den Deutschen Sprachraum.

3. **Erstellen von wp-config.php**: Generiert ein Konfigurationsdatei für die Datenbankcredentials.

4. **Installieren von WordPress**: Setzt up die WordPress-Installation mit der angegebenen URL, Titel, Admin-Benutzername, Passwort und E-Mail.

5. **Zweiter Administrator erstellen**: Fügt einen zweiten Administrator hinzu, mit einem anderen Benutzernamen und einer anderen E-Mail.

6. **Installieren von WooCommerce**: Installiert und aktiviert das WooCommerce-Plugin.

7. **WooCommerce einrichten**: Konfiguriert WooCommerce durch die Installation von Beispieldaten, die Währung, und andere Einstellungen festlegen.

8. **Themainstallation**: Überprüft, ob Divi-Thema vorhanden ist und installiert es; falls nicht, wird das Fallback-Thema (z.B. `twentytwentyfour`) verwendet.

9. **Installieren zusätzlicher Plugins**: Aktiviert optionale Plugins wie Query Monitor und WooCommerce Germanized.

10. **WooCommerce-Einstellungen konfigurieren**: Ändert WooCommerce-Einstellungen wie den Standardland, die Währung, das Preiskennnzeichen, usw.

11. **Zurücksetzen der Datenbank**: Löscht Beispielbeiträge und Seiten, um den Websitezustand zu bereinigen und ihn für die zukünftige Verwendung bereitzustellen.

## Nutzung

Führe das Skript aus, indem du die folgenden Befehle in deinem Terminal eingibst:

```bash
./install_wordpress.sh
```

Dieses Skript automatisiert die Installation von WordPress, WooCommerce und zusätzlichen Plugins, sodass ein sichere Setup für Ihr E-Commerce-Website wird. Stelle sicher, die Konfigurationsvariablen entsprechend deinen spezifischen Anforderungen zu ändern.

---

