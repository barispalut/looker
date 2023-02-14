view: level_end_p2 {
  sql_table_name: `big-blast.analytics_270556009.Level_End_P2_view`;;


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
  }

  dimension: event_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key ;;
    hidden: yes
  }

  dimension: win {
    type: number
    sql:  ${TABLE}.win ;;
  }

  dimension: stage_id {
    type: number
    sql:  ${TABLE}.stage_id ;;
  }

  dimension: stage_count {
    type: number
    sql:  ${TABLE}.stage_count ;;
  }


  dimension: remaining_coin {
    type: number
    sql:  ${TABLE}.remaining_coin ;;
  }

  dimension: remaining_lives {
    type: number
    sql:  ${TABLE}.remaining_lives ;;
  }

  dimension: plus5_used {
    type: number
    sql:  ${TABLE}.plus5_used ;;
  }

  dimension: b1_used {
    type: number
    sql:  ${TABLE}.eb1_used ;;
  }

  dimension: b2_used {
    type: number
    sql:  ${TABLE}.eb2_used ;;
  }

  dimension: b3_used {
    type: number
    sql:  ${TABLE}.eb3_used ;;
  }

  dimension: pb1_used {
    type: number
    sql:  ${TABLE}.pb1_used ;;
  }

  dimension: pb2_used {
    type: number
    sql:  ${TABLE}.pb2_used ;;
  }

  dimension: pb3_used {
    type: number
    sql:  ${TABLE}.pb3_used ;;
  }

  dimension: start_move_count {
    type: number
    sql:  ${TABLE}.start_move_count ;;
  }

  dimension: rem_move_count {
    type: number
    sql:  ${TABLE}.rem_move_count ;;
  }

  dimension: move_spent {
    type: number
    sql:  ${TABLE}.move_spent ;;
  }

  dimension: Last_to_First {
    type: number
    sql:  ${TABLE}.Last_to_First ;;
  }

  dimension: level_key {
    type: string
    sql:  ${TABLE}.level_key ;;
    hidden: yes
  }



}
