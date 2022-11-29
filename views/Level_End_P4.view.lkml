view: level_end_p4 {
  sql_table_name: `big-blast.analytics_270556009.Level_End_P4_view`;;

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
    sql:  ${TABLE}.try_count;;
    hidden: yes
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

  dimension: initial_board_hp {
    type: number
    sql:  ${TABLE}.initial_board_hp ;;
  }

  dimension: final_board_hp {
    type: number
    sql:  ${TABLE}.final_board_hp ;;
  }

  dimension: zero_damage_percentage {
    type: number
    sql:  ${TABLE}.zero_damage_percentage ;;
  }

  dimension: shuffle_count {
    type: number
    sql:  ${TABLE}.shuffle_count ;;
  }

  dimension: disco_merges {
    type: number
    sql:  ${TABLE}.disco_merges ;;
  }

  dimension: Last_to_First {
    type: number
    sql:  ${TABLE}.Last_to_First ;;
  }


}
