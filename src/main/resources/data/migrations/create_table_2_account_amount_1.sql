create table if not exists "account_amount" (
    account_amount_id bigserial primary key,
    amount double precision,
    id_account bigint references "account"(account_id) on delete cascade,
    transaction_time timestamp default now()
);

INSERT INTO "account_amount" (amount, id_account)
VALUES (500.75, 1), (300.25, 2), (700.00, 3);