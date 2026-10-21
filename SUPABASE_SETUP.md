# Anslut maskinparken till Supabase

Webbsidan är konfigurerad för projektet med referensen `lgzoolywsoliudvzjhis` och använder en **publishable key** i webbläsaren. Ingen `service_role`- eller secret-nyckel används.

## 1. Skapa databastabellen
1. Öppna [SQL Editor i ditt Supabase-projekt](https://supabase.com/dashboard/project/lgzoolywsoliudvzjhis/sql/new).
2. Öppna [`supabase/schema.sql` i GitHub](https://github.com/Zhective/Test/blob/main/supabase/schema.sql).
3. Kopiera hela SQL-filen, klistra in i SQL Editor och klicka **Run**.
4. Kontrollera i **Table Editor** att tabellen `public.machines` finns.

## 2. Skapa ditt konto på webbsidan
1. Öppna [Maskinparken](https://zhective.github.io/Test/maskinpark.html).
2. Välj **Inget konto? Skapa konto**, skriv din e-postadress och välj ett starkt lösenord.
3. Om Supabase ber om e-postbekräftelse, öppna bekräftelselänken i mejlet.
4. Logga in. Första gången tabellen är tom försöker sidan importera maskinnamnen från den tidigare lokala listan, eller lägga in maskinparkens grundnamn.

Om registrering inte fungerar, öppna Supabase → **Authentication → Sign In / Providers** och kontrollera att Email-provider är aktiverad. Kontrollera också inställningen för e-postbekräftelse.

## 3. Begränsa vem som kan logga in
Databasens RLS-policy tillåter alla **autentiserade konton i det här Supabase-projektet** att läsa och ändra maskinregistret. När du har skapat och testat de konton som ska användas, stäng av offentlig kontoskapning i Supabase under **Authentication → Settings** (inställningens namn kan visas som *Allow new users to sign up*). Bjud därefter bara in eller skapa konton för personer som ska ha åtkomst. Annars kan andra som hittar webbsidan skapa ett konto och få åtkomst till maskinregistret.

## 4. Publicering och felsökning
- Webbplatsen: https://zhective.github.io/Test/maskinpark.html
- GitHub Actions: https://github.com/Zhective/Test/actions
- SQL-fil: https://github.com/Zhective/Test/blob/main/supabase/schema.sql

Ändringar i `main` publiceras av GitHub Pages. Om sidan visar ett databasfel, kontrollera att SQL-filen körts utan fel och att du är inloggad. Om nya ändringar inte syns, vänta tills senaste GitHub Pages-jobbet är klart och ladda om sidan.

## Säkerhet
Publishable-nyckeln är avsedd för webbläsaren, men skyddet beror på Row Level Security och rätt tabellrättigheter. Lägg aldrig databaslösenord, `service_role`-nyckel eller en `sb_secret_...`-nyckel i HTML, JavaScript eller GitHub.