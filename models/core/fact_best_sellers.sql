{{ config(materialized='table') }}

with best_sellers as (
    select *
    from {{ ref('stg_best_sellers') }}
), 

categories as (
    select *
    from {{ ref('stg_categories') }}

),

fact_goods as (
    select *
    from {{ ref('fact_goods')}}
)

select 
    best_sellers.id,
    best_sellers.position,
    best_sellers.type,
    --best_sellers.category,
    categories.name as category,
    fact_goods.name as goods, 
    fact_goods.sold_quantity,
    fact_goods.price, 
    --fact_goods.category,
    fact_goods.goods_type

from best_sellers 
inner join categories
on best_sellers.category = categories.id
inner join fact_goods
on best_sellers.id = fact_goods.id
