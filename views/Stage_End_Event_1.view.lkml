view: stage_end_event_1 {
  sql_table_name: `big-blast.analytics_270556009.Stage_End_Event_1_view` ;;


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

  dimension: stage_id {
    type: number
    sql:  ${TABLE}.stage_id ;;
  }

  dimension: stage_move_count {
    type: number
    sql:  ${TABLE}.stage_move_count ;;
  }

  dimension: start_move_count {
    type: number
    sql:  ${TABLE}.start_move_count ;;
  }

  dimension: stage_win {
    type: number
    sql:  ${TABLE}.win ;;
  }

  dimension: level_start_move_count {
    type: number
    sql:  ${TABLE}.level_start_move_count ;;
  }

  dimension: stage_rem_move_count {
    type: number
    sql:  ${TABLE}.stage_rem_move_count ;;
  }

  dimension: stage_duration {
    type: number
    sql:  ${TABLE}.stage_duration ;;
  }

  dimension: stage_count {
    type: number
    sql:  ${TABLE}.stage_count ;;
  }

  dimension: overall_point {
    type: number
    sql:  ${TABLE}.overall_point ;;
  }
}
