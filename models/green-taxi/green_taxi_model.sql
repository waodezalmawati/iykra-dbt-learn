with source_transact_taxi as (
    select * from {{ source('green_taxi_data_sources', 'data_green_taxi') }}
),
group_data as (
    SELECT 
        COUNT(VendorID) as vendor_id,
        max(tip_amount) as tip

    FROM source_transact_taxi
    
    GROUP BY VendorID
),

final as (
    select * from group_data
)
select * from final