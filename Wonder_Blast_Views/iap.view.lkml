view: iap {
  sql_table_name: `big-blast.analytics_270556009.iap_p1_view` ;;

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

  dimension: try_count {
    type: number
    sql:  ${TABLE}.try_count ;;
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

  dimension: iap_preset {
    type: number
    sql:  ${TABLE}.iap_preset ;;
  }

  dimension: inapp_item_id {
    type: string
    sql:  ${TABLE}.inapp_item_id ;;
  }

  dimension: inapp_item_name {
    type: string
    sql:  ${TABLE}.inapp_item_name ;;
  }

  dimension: inapp_item_price {
    type: number
    sql:  ${TABLE}.inapp_item_price ;;
  }

  dimension: remaining_life {
    type: number
    sql:  ${TABLE}.remaining_life ;;
  }

  dimension: remaining_coin {
    type: number
    sql:  ${TABLE}.remaining_coin ;;
  }

  dimension: remaining_star {
    type: number
    sql:  ${TABLE}.remaining_star ;;
  }

  dimension: eb1_inventory {
    type: number
    sql:  ${TABLE}.eb1_inventory ;;
  }

  dimension: eb2_inventory {
    type: number
    sql:  ${TABLE}.eb2_inventory ;;
  }

  dimension: eb3_inventory {
    type: number
    sql:  ${TABLE}.eb3_inventory ;;
  }

  dimension: pb1_inventory {
    type: number
    sql:  ${TABLE}.pb1_inventory ;;
  }

  dimension: pb2_inventory {
    type: number
    sql:  ${TABLE}.pb2_inventory ;;
  }

  dimension: pb3_inventory {
    type: number
    sql:  ${TABLE}.pb3_inventory ;;
  }

  dimension: iap_list {
    type: string
    sql:  ${TABLE}.iap_list ;;
  }

  dimension: total_iap_count {
    type: number
    sql:  ${TABLE}.total_iap_count ;;
  }

  dimension: total_rev_user {
    type: number
    sql:  ${TABLE}.total_rev_user ;;
  }

  dimension: iap_level_difference {
    type: number
    sql:  ${TABLE}.iap_level_difference ;;
  }

  dimension: days_since_last_purchase {
    type: number
    sql:  ${TABLE}.days_since_last_purchase ;;
  }

  dimension: total_purchase {
    type: number
    sql:  ${TABLE}.total_purchase ;;
  }

  dimension: total_amount {
    type: number
    sql:  ${TABLE}.total_amount ;;
  }

  dimension: recency {
    type:  number
    sql: case
          when (${days_since_last_purchase} >= 15) then 1
          when (${days_since_last_purchase} >= 10 AND (${days_since_last_purchase} < 15)) then 2
          when (${days_since_last_purchase} >= 5 AND (${days_since_last_purchase} < 10)) then 3
          else 4 end;;
  }

  dimension: frequency {
    type:  number
    sql: case
          when (${total_amount} >= 9) then 1
          when (${days_since_last_purchase} >= 5 AND (${days_since_last_purchase} < 9)) then 2
          when (${days_since_last_purchase} >= 2 AND (${days_since_last_purchase} < 5)) then 3
          else 4 end;;
  }

  dimension: monetary {
    type:  number
    sql: case
          when (${total_amount} >= 100) then 1
          when (${days_since_last_purchase} >= 50 AND (${days_since_last_purchase} < 100)) then 2
          when (${days_since_last_purchase} >= 10 AND (${days_since_last_purchase} < 50)) then 3
          when (${days_since_last_purchase} >= 1 AND (${days_since_last_purchase} < 10)) then 4
          else null end;;
  }

  dimension: score {
    description: "A combination of recency frequency and monetary in this order"
    type: string
    sql: concat(${recency},${frequency},${monetary}) ;;
  }

  dimension: segment {
    type: string
    sql: case
          when (${score} = '111') then low_life_users
          when (${score} = '444' OR ${score} = '344' ) then amazing_users
          else null end;;
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
