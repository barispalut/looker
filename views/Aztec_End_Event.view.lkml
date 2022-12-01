view: aztec_end_event {
  sql_table_name: `big-blast.analytics_270556009.Aztec_End_Event_view` ;;

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

  dimension_group: aztec_launch_time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.launch_time_stamp ;;
  }

  dimension: claimed {
    type: number
    sql:  ${TABLE}.claimed ;;
  }

  dimension: continue_count {
    type: number
    sql:  ${TABLE}.continue_count ;;
  }

  dimension: stage {
    type: number
    sql:  ${TABLE}.stage ;;
  }

  dimension: mask_count {
    type: number
    sql:  ${TABLE}.mask_count ;;
  }

  dimension: quit_pop_up_impressions {
    type: number
    sql:  ${TABLE}.quit_pop_up_impressions ;;
  }

  dimension: total_coin_spent {
    type: number
    sql:  ${TABLE}.total_coin_spent;;
  }

  dimension: iap_total {
    type: number
    sql:  ${TABLE}.iap_total;;
  }




}
