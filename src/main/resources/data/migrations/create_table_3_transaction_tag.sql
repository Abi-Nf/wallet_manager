create table if not exists "transaction_tag" (
    transaction_tag_id serial primary key,
    name text unique -- name like: foods, electronics, salaries
);