view: age {
  sql_table_name: `big-blast.analytics_270556009.age_event` ;;


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

dimension: age_previous_stage {
  type: number
  sql: ${TABLE}.age_previous_stage ;;
}

dimension: age_current_stage {
  type: number
  sql: ${TABLE}.age_current_stage ;;
}

dimension: age_progress {
  type: number
  sql: ${TABLE}.age_progress ;;
}

  dimension: age_gain {
    type: number
    sql: ${TABLE}.age_gain ;;
  }

  dimension: age_previous_stage_goal {
    type: number
    sql: ${TABLE}.age_previous_stage_goal ;;
  }

  dimension: age_current_stage_goal {
    type: number
    sql: ${TABLE}.age_current_stage_goal ;;
  }

  dimension: current_reward_type {
    type: string
    sql: ${TABLE}.current_reward_type ;;
  }

  dimension: current_reward_value {
    type: number
    sql: ${TABLE}.current_reward_value ;;
  }

  dimension: multiplier{
    type: number
    sql: ${TABLE}.multiplier ;;
  }


}

# view: age {
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
