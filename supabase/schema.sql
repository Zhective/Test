-- Maskinpark: Supabase schema
-- Run this in Supabase Dashboard -> SQL Editor -> New query.
-- Access is restricted to signed-in users; do not add public write policies.

create table if not exists public.machines (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  machine_code text not null default '',
  category text not null default '',
  brand text not null default '',
  location text not null default '',
  owner_name text not null default '',
  status text not null default 'Ej angiven'
    check (status in ('Ej angiven', 'I drift', 'På service', 'Ur drift', 'Avställd')),
  year integer,
  last_service date,
  next_service date,
  notes text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists machines_name_idx on public.machines (name);
create index if not exists machines_status_idx on public.machines (status);

alter table public.machines enable row level security;

drop policy if exists "Signed-in users can read machines" on public.machines;
create policy "Signed-in users can read machines"
  on public.machines for select
  to authenticated
  using (true);

drop policy if exists "Signed-in users can add machines" on public.machines;
create policy "Signed-in users can add machines"
  on public.machines for insert
  to authenticated
  with check (true);

drop policy if exists "Signed-in users can update machines" on public.machines;
create policy "Signed-in users can update machines"
  on public.machines for update
  to authenticated
  using (true)
  with check (true);

drop policy if exists "Signed-in users can delete machines" on public.machines;
create policy "Signed-in users can delete machines"
  on public.machines for delete
  to authenticated
  using (true);

create or replace function public.set_machines_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists set_machines_updated_at on public.machines;
create trigger set_machines_updated_at
before update on public.machines
for each row execute function public.set_machines_updated_at();

-- Explicit least-privilege table grants for the browser client.
revoke all on public.machines from anon;
grant select, insert, update, delete on public.machines to authenticated;
