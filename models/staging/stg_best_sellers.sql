{{ config(materialized='view') }}

select 
-- identifier
cast(id as string) as id,

-- ranking info
cast(position as integer) as position,

-- type of goods(product or item)
cast(type as string) as type,

-- category to which it belongs
cast(category as string) as category

from {{source('staging', 'best_sellers')}}