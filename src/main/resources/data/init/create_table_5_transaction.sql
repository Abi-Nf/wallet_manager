-- table that does a transaction on a bank account
create table if not exists "transaction" (
    id bigserial primary key,

    tag_id int references "transaction_tag"(id) not null,
    amount double precision default 0, -- the amount price
    type transaction_type not null, -- like transfer, spending, claims

    -- transfer to another bank account
    -- will create a transaction to the sibling account on success
    -- not required
    transfer_to bigint references "account"(id),

    -- the account who does transaction
    account_id bigint references "account"(id),

    creation_timestamp timestamp default now()
);

insert into "transaction" (id, tag_id, amount, type, transfer_to, account_id)
values (1, 1, 300, 'spend'::transaction_type, null, 1)
on conflict (id)
    do update
    set id = 1,
        tag_id = 1,
        amount = 300,
        type = 'spend'::transaction_type,
        transfer_to = null,
        account_id = 1
;

insert into "transaction" (id, tag_id, amount, type, transfer_to, account_id)
values (2, 3, 2000, 'claim'::transaction_type, null, 2)
on conflict (id)
    do update
    set id = 2,
        tag_id = 3,
        amount = 2000,
        type = 'claim'::transaction_type,
        transfer_to = null,
        account_id = 2
;

insert into "transaction" (id, tag_id, amount, type, transfer_to, account_id)
values (3, 2, 400, 'transfer'::transaction_type, 1, 3)
on conflict (id)
    do update
    set id = 3,
        tag_id = 2,
        amount = 400,
        type = 'transfer'::transaction_type,
        transfer_to = 1,
        account_id = 3
;