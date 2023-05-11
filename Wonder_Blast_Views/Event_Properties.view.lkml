view: event_properties {
  sql_table_name: `big-blast.analytics_270556009.Event_Properties_view`;;



  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id
      ;;
    hidden: yes
  }

  dimension_group: Install_Date {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.install_date
      ;;
    hidden: yes
  }

  dimension_group: Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_time
      ;;
  }

  dimension: Event_Name {
    type: string
    sql:  ${TABLE}.event_name ;;
  }

  dimension: session_id {
    type: number
    sql:  case when ${TABLE}.session_id = -1 then 0 else ${TABLE}.session_id end;;
  }

  dimension: episode_id {
    type: number
    sql:  ${TABLE}.episode_id ;;
  }

  dimension: level_progress {
    type: number
    sql:  ${TABLE}.level_progress ;;
    hidden: yes
  }

  dimension: collection_id {
    type: number
    sql:  ${TABLE}.collection_id ;;
    hidden: yes
  }


  dimension: level_id {
    type: number
    sql:  ${TABLE}.level_id ;;
    hidden: yes
  }

  dimension: try {
    type: number
    sql:  ${TABLE}.try_count ;;
    hidden: yes
  }

  dimension: sum_iap_lifetime {
    type: number
    sql:  ${TABLE}.sum_iap_lifetime ;;
  }

  dimension: iap_count_lifetime {
    type: number
    sql:  ${TABLE}.iap_count_lifetime ;;
  }

  dimension: app_version {
    type: number
    sql:  ${TABLE}.app_version ;;
  }


  dimension: country {
    type: string
    sql:  ${TABLE}.country ;;
  }


  dimension: event_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key;;
  }

  dimension_group: Next_Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql:  ${TABLE}.next_event_time
      ;;
  }

  dimension: Churn{
    type: string
    sql:  case when date_diff (${TABLE}.next_event_time, ${TABLE}.event_time, hour) >= 72 then "C" else null end  ;;

  }

  dimension: Day {
    type: number
    sql:  date_diff(timestamp(${TABLE}.event_time),timestamp(${user_properties.install_date_time}),day) ;;
  }


  dimension: session_count {
    type: number
    sql:  ${TABLE}.session_count ;;
  }


  dimension: mobile_model_name {
    type: string
    sql:  ${TABLE}.device_mobile_model_name ;;
  }

  dimension: mobile_brand_name {
    type: string
    sql:  ${TABLE}.device_mobile_brand_name ;;
  }

  dimension: level_key {
    type: string
    sql:  ${TABLE}.level_key ;;
    hidden: yes
  }
  dimension: platform {
    type: string
    sql:  ${TABLE}.platform ;;
  }
  dimension_group: max_event_time {
    type: time
    timeframes: [date,month,week,time]
    sql:  ${TABLE}.max_event_time;;
  }


  dimension: network{
    type: string
    sql:  ${TABLE}.network ;;
  }

  dimension: campaign{
    type: string
    sql:  ${TABLE}.campaign ;;
  }

}

# view: event_properties {
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
