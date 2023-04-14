view: user_properties {
  sql_table_name: `big-blast.analytics_270556009.User_Properties_view`  ;;

  dimension: user_id {
    type: string
    primary_key: yes
    description: "User Uniq ID"
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: install_date {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.install_date ;;
  }

  dimension: current_level_progress {
    type: number
    sql:  ${TABLE}.level_progress ;;
  }

  dimension: life_time_IAP{
    type: number
    sql:  ${TABLE}.total_IAP_value ;;
  }

  dimension: total_IAP_count{
    type: number
    sql:  ${TABLE}.total_iAP_count ;;
  }

  dimension: max_IAP_count{
    type: number
    sql:  ${TABLE}.max_iAP_count ;;
  }


  dimension: Day_Since_Install {
    type: number
    sql:  date_diff(current_timestamp(),${TABLE}.install_date,day) ;;
  }

}

# view: user_properties {
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
