-- table for bank accounts
create table if not exists "account" (
    account_id bigserial primary key,
    name varchar(255),
    current_amount double precision default 0,

    type varchar(255),
    account_number varchar, -- the bank account number series; example: 0212 2134 1231 4588

    id_currency bigint references "currency"(account_id) on delete cascade not null,
    creation_timestamp timestamp default now()
);
