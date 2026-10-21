# Anslut maskinparken till Supabase

## 1. Skapa projektet
1. Öppna https://supabase.com/dashboard och skapa ett projekt som heter `maskinpark`.
2. Välj en region i Europa och spara databaslösenordet på ett säkert ställe.
3. Vänta tills projektet har skapats.

## 2. Skapa tabellen
1. Öppna **SQL Editor** i Supabase.
2. Välj **New query**.
3. Öppna `supabase/schema.sql` i det här GitHub-repot och kopiera hela innehållet.
4. Klistra in i SQL Editor och tryck **Run**. Det skapar tabellen `public.machines` med Row Level Security aktiverat.

## 3. Hämta anslutningsuppgifterna
I Supabase-projektet öppnar du **Connect** eller **Settings → API Keys** och kopierar:
- Project URL
- Publishable key (eller äldre anon key)

Lägg aldrig in databaslösenordet eller en `service_role`-/secret-nyckel i webbsidans HTML eller i GitHub.

## 4. Anslut webbplatsen
När projektet är klart behöver webbplatsens JavaScript konfigureras med Project URL och publishable/anon key. Tabellen använder inloggning och tillåter bara autentiserade användare att läsa och ändra maskiner. Därför måste inloggning också aktiveras i webbplatsen innan databaslagring fungerar.

## 5. Publicering
Ändringar i `main` publiceras av GitHub Pages-workflowen. Kontrollera **Actions** i GitHub och vänta tills senaste Pages-jobbet är klart.

## Säkerhet
Policyn tillåter alla inloggade användare i projektet att läsa och ändra maskiner. Om sidan ska användas av en arbetsplats bör konton endast delas ut till behöriga personer. För striktare behörigheter kan policyn senare begränsas till en särskild grupp.
