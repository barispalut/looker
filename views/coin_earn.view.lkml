view: coin_earn {
  sql_table_name: `big-blast.analytics_270556009.coin_earn_view` ;;

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

  dimension: event_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key ;;
    hidden: yes
  }

  dimension: earned_coin_amount {
    type: number
    sql:  ${TABLE}.amount ;;
  }

  dimension: new_coin_amount {
    type: number
    sql:  ${TABLE}.new_amount ;;
  }

  dimension: coin_earn_info {
    type: string
    sql:  case when ${TABLE}.info in ("70","Building") then "Area"
               when ${TABLE}.info = "4000" then "Age"
               when ${TABLE}.info in ("8000","8001","8002") then "Copter Craze"
               when ${TABLE}.info in ("9000","9001","9002") then "Move Hunt"
               when ${TABLE}.info in ("40","Level Win") then "Level Win"
               when ${TABLE}.info in ("10") then "IAP" else "Other Sources" end
              ;;
  }








}
