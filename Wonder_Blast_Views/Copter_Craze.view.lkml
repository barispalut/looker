view: copter_craze {
  sql_table_name: `big-blast.analytics_270556009.minicopter_event`;;

  dimension: event_key{
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key;;
    hidden: yes
  }

  dimension: level_key{
    type: string
    sql:  ${TABLE}.level_key;;
    hidden: yes
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: yes
  }

  dimension_group: Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_time ;;
    hidden: yes
  }

  dimension: copter_craze_trigger_type {
    type: string
    sql: ${TABLE}.trigger_type ;;
  }

  dimension: copter_craze_icon_click_count {
    type: number
    sql: ${TABLE}.icon_click_count ;;
  }

  dimension_group: copter_craze_event_entry_time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_entry_time ;;
  }

  dimension: copter_craze_stage {
    type: number
    sql: ${TABLE}.stage ;;
  }

  dimension: copter_craze_stage_target {
    type: number
    sql: ${TABLE}.stage_target ;;
  }

  dimension: copter_craze_multiplier {
    type: number
    sql: ${TABLE}.multiplier ;;
  }

  dimension: propeller_count {
    type: number
    sql: ${TABLE}.propeller_count ;;
  }

  dimension: propeller_gain{
    type: number
    sql: ${TABLE}.propeller_gain ;;
  }


}

# view: copter_craze {
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
