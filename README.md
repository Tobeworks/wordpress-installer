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

## Nutzung

Führe das Skript aus, indem du die folgenden Befehle in deinem Terminal eingibst:

```bash
./install_wordpress.sh
```

Dieses Skript automatisiert die Installation von WordPress, WooCommerce und zusätzlichen Plugins, sodass ein sichere Setup für Ihr E-Commerce-Website wird. Stelle sicher, die Konfigurationsvariablen entsprechend deinen spezifischen Anforderungen zu ändern.

---

