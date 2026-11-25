# 🖖 Daily Starfleet – Star Trek Zitate für Kumiki

Ein Lua-Widget für den **Kumiki** (ab Firmware `0.15.0`), das alle 12 Stunden oder per Knopfdruck ein zufälliges deutsches Star-Trek-Zitat aus einer Sammlung von 111 Zitaten anzeigt.

## Features

* **111 deutsche Zitate** von Spock, Kirk, Picard, Archer, Pike, Sisko, Janeway, Lorca, Saru und Michael Burnham.
* **Automatische Schriftgröße:** Das Widget wählt automatisch die größtmögliche Schriftstufe (`3` bis `1`), bei der das gesamte Zitat sauber auf eine Seite passt.
* **Automatisches & manuelles Update:** Lädt alle 12 Stunden automatisch ein neues Zitat – oder jederzeit sofort über den Button **„Neues Zitat“**.
* **System-Design:** Unterstützt das helle und dunkle Gerätedesign (`theme: "system"`) mit passender LCARS-Akzentfarbe.

## Installation

1. Lade die aktuelle **`daily-starfleet.zip`** unter [Releases](../../releases) herunter.
2. Öffne die lokale Weboberfläche deines Kumiki im Browser (im selben WLAN).
3. Gehe zu **Widgets** und lade die ZIP-Datei hoch.

## Einrichtung & wichtige Freigaben

Öffne nach dem Upload die **Einstellungen** des Widgets auf der Kumiki-Weboberfläche und prüfe folgende Punkte:

1. **Auf Kumiki aktiv:** Häkchen setzen, damit das Widget auf dem Display erscheint.
2. **Einstellungen:**
   * **GitHub Repo:** `R3adyPlay3r0ne/DailyStarfleet` (Standardwert)
   * **Anzahl:** `111` (Standardwert)
3. **Freigaben (wichtig!):**
   * Setze zwingend den Haken bei **„HTTPS-Anfragen erlauben“** für `raw.githubusercontent.com`. Ohne diese Freigabe darf der Kumiki keine Zitate von GitHub nachladen.
4. Klicke unten auf **Speichern**.

## Eigene Zitate verwenden

Wenn du eigene Zitate nutzen möchtest, kannst du dieses Repository forken, im Ordner `quotes/` weitere JSON-Dateien (`112.json`, `113.json`, ...) nach folgendem Schema anlegen und in den Widget-Einstellungen dein eigenes Repo sowie die neue Anzahl eintragen:

```json
{
  "quote": "Lebe lang und in Frieden!",
  "author": "Spock"
}
