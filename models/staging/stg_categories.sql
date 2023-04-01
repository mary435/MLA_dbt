{{ config(materialized='view') }}

select 
-- identifier
cast(id as string) as id,

cast(name as string) as name

from {{source('staging', 'categories')}}