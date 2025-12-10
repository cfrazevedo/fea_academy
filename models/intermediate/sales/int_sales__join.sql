with

    order_items as (

        select *
        from {{ ref("stg_nw__order_items")}}

    )

    , orders as (

        select *
        from {{ ref("stg_nw__orders")}}

    )

    , joined as (

        select 
            oi.order_item_sk
            , oi.product_fk
            , o.employee_fk
            , o.customer_fk
            , o.shipper_fk
            , o.order_date
            , o.ship_date
            , o.required_delivery_date
            , oi.discount_pct
            , oi.unit_price
            , oi.quantity
            , o.freight
            , o.order_number
            , o.recipient_name
            , o.recipient_city
            , o.recipient_region
            , o.recipient_country
        
        from order_items as oi
        inner join orders as o
        on oi.order_fk = order_pk
    )

    select * from joined
