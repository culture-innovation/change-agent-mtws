-- Change Agent Workshop shared data storage
create table if not exists public.kv_store (
  key text primary key,
  value text not null,
  updated_at timestamptz not null default now()
);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists kv_store_set_updated_at on public.kv_store;
create trigger kv_store_set_updated_at
before update on public.kv_store
for each row execute function public.set_updated_at();

alter table public.kv_store enable row level security;

drop policy if exists "workshop public read" on public.kv_store;
drop policy if exists "workshop public insert" on public.kv_store;
drop policy if exists "workshop public update" on public.kv_store;
drop policy if exists "workshop public delete" on public.kv_store;

create policy "workshop public read" on public.kv_store for select to anon using (true);
create policy "workshop public insert" on public.kv_store for insert to anon with check (true);
create policy "workshop public update" on public.kv_store for update to anon using (true) with check (true);
create policy "workshop public delete" on public.kv_store for delete to anon using (true);