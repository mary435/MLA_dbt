{{ config(materialized='view') }}

select 
-- identifier
cast(id as string) as id,

-- item info
cast(title as string) as name,
cast(sold_quantity as integer) as sold_quantity,
cast(price as integer) as price,

-- category to which it belongs
cast(category_id as string) as category

from {{source('staging', 'items')}}