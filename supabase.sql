-- Run in Supabase SQL Editor. Create ONE parent in Authentication > Users first.
-- Replace PARENT_USER_UUID with that user's UUID before running.
create table if not exists public.activities (
 id uuid primary key default gen_random_uuid(),
 title text not null,
 subject text not null check (subject in ('English','Maths','Science')),
 year text not null,
 type text not null check (type in ('choice','blank','boolean','match')),
 questions jsonb not null,
 published boolean not null default false,
 created_by uuid not null references auth.users(id),
 created_at timestamptz not null default now()
);
alter table public.activities enable row level security;
create table if not exists public.parent_access (user_id uuid primary key references auth.users(id));
alter table public.parent_access enable row level security;
-- Parent access is provisioned ONLY through the SQL editor, not the website.
insert into public.parent_access(user_id) values ('c6335851-b7a7-43d8-be2a-8ac5520e2c3d') on conflict do nothing;
create policy "Anyone reads published activities" on public.activities for select to anon, authenticated using (published = true OR (auth.uid() = created_by AND exists(select 1 from public.parent_access where user_id=auth.uid())));
create policy "Parent inserts" on public.activities for insert to authenticated with check (created_by=auth.uid() AND exists(select 1 from public.parent_access where user_id=auth.uid()));
create policy "Parent edits" on public.activities for update to authenticated using (created_by=auth.uid() AND exists(select 1 from public.parent_access where user_id=auth.uid())) with check (created_by=auth.uid());
create policy "Parent deletes" on public.activities for delete to authenticated using (created_by=auth.uid() AND exists(select 1 from public.parent_access where user_id=auth.uid()));
