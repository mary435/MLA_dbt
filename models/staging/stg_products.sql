{{ config(materialized='view') }}

select 
-- identifier
cast(id as string) as id,

-- item info
cast(name as integer) as name,
cast(sold_quantity as integer) as sold_quantity,
cast(buy_box_winner_price as integer) as price,

-- category to which it belongs
cast(category_id as string) as category

from {{source('staging', 'products')}}