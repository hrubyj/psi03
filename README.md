# KIV/PSI - 3. úloha - REST klient
Zadání: Implementujte REST klienta, který zjistí aktuální pozici mezinárodní vesmírné stanice (ISS) a
zobrazí informaci o tom, zda se nachází na aktuálně osvětlené či neosvětlené straně Země.
Stejně tak vypíše i informaci o tom, zda jsou na daném místě ideální podmínky pro její
pozorování z povrchu Země, tj. 1-2 hodiny před východem nebo po západu Slunce.

## Spuštění
Pro úspěšné zjištění polohy ISS je nutno mít nainstalovány nástroje [httpie](https://httpie.io/) a [jq](https://stedolan.github.io/jq/). 
Nástroje lze nainstalovat jednoduše pomocí příkazu `sudo apt install <nazev>`.

Skript pro zjištění polohy ISS lze spustit pomocí příkazu:
```
./where_is_ISS.sh
```
