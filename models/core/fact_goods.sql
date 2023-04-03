{{ config(materialized='table') }}

with items as (
    select *, 
        'Item' as goods_type 
    from {{ ref('stg_items') }}
), 

products as (
    select *, 
        'Product' as goods_type
    from {{ ref('stg_products') }}
), 

goods_unioned as (
    select * from items
    union all
    select * from products
)
select 
    goods_unioned.id, 
    goods_unioned.name, 
    goods_unioned.sold_quantity,
    goods_unioned.price, 
    goods_unioned.category,
    goods_unioned.goods_type
from goods_unioned 

