with 

    source as (

        select * from {{ source('sap_northwind', 'order_details') }}

    ),

    renamed as (

        select
            {{ dbt_utils.generate_surrogate_key(['order_id', 'product_id']) }} as order_item_sk
            , cast(order_id as int) as order_fk
            , cast(product_id as int) as product_fk
            , cast(discount as float) as discount_pct
            , cast(unit_price as float) as unit_price
            , cast(quantity as int) as quantity

        from source

    )

    select * from renamed