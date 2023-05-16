view: ego_event {
  sql_table_name: `big-blast.analytics_270556009.ego_event` ;;

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

  dimension: session_id {
    type: number
    sql:  ${TABLE}.session_id ;;
    hidden: yes
  }

  dimension: collection_id {
    type: number
    sql:  ${TABLE}.collection_id ;;
    hidden: yes
  }

  dimension: episode_id {
    type: number
    sql:  ${TABLE}.episode_id ;;
    hidden: yes
  }

  dimension: level_id {
    type: number
    sql:  ${TABLE}.level_id ;;
    hidden: yes
  }

  dimension: try {
    type: number
    sql:  ${TABLE}.try ;;
    hidden: yes
  }

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

  dimension: screen_one {
    type: string
    sql:  ${TABLE}.screen_one;;
  }

  dimension: screen_one_play_on {
    type: number
    sql:  ${TABLE}.screen_one_play_on;;
  }

  dimension: screen_two {
    type: string
    sql:  ${TABLE}.screen_two;;
  }

  dimension: screen_two_play_on {
    type: number
    sql:  ${TABLE}.screen_two_play_on;;
  }

  dimension: screen_three {
    type: string
    sql:  ${TABLE}.screen_three;;
  }

  dimension: screen_three_play_on {
    type: number
    sql:  ${TABLE}.screen_three_play_on;;
  }

  dimension: final_board_hp {
    type: number
    sql:  ${TABLE}.final_board_hp;;
  }

  dimension: initial_board_hp {
    type: number
    sql:  ${TABLE}.initial_board_hp;;
  }

  dimension: ego_used {
    type: number
    sql:  ${TABLE}.ego_used;;
  }


}

# view: iap {
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
