view: Level_Start_P1 {
  derived_table: {
    sql:
          select distinct
          user_pseudo_id as user_id,
          TIMESTAMP_MICROS(event_timestamp) as Level_Start_Time,
          TIMESTAMP_MICROS (user_first_touch_timestamp) as install_date,
          case when lead(TIMESTAMP_MICROS(event_timestamp))
          over (partition by user_pseudo_id  order by TIMESTAMP_MICROS(event_timestamp) asc) is not null then lead(TIMESTAMP_MICROS(event_timestamp)) over (partition by user_pseudo_id  order by TIMESTAMP_MICROS(event_timestamp) asc) else current_timestamp end as
          Next_Level_Start_Time,
          cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
          cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
          (SELECT key FROM UNNEST(user_properties) WHERE key in ('firebase_exp_46','firebase_exp_45','firebase_exp_48','firebase_exp_49')) as test_name,
          (SELECT value.string_value FROM UNNEST(user_properties) WHERE key in ('firebase_exp_46','firebase_exp_45','firebase_exp_48','firebase_exp_49')) as test_variant,
          platform,
          app_info.version,
          geo.country
          from
          `big-blast.analytics_270556009.events_*`
          where event_name in ("Level_Start_P1") ;;

  }

  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.user_id
      group_label: "User ID";;
  }

  dimension_group: Level_Start_Time  {
    type: time
    timeframes: [date,month,week]
    sql: ${TABLE}.Level_Start_Time ;;
  }

  dimension: Level_ID {
    type: number
    sql:  ${TABLE}.level_id ;;
  }

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: 2 {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
