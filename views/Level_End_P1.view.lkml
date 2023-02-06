view: level_end_p1 {
  sql_table_name: `big-blast.analytics_270556009.Level_End_P1_view`;;

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

  dimension: event_key{
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key ;;
    hidden: yes
  }

  dimension: win {
    type: number
    sql:  ${TABLE}.win ;;
  }


  dimension: play_time {
    type: number
    sql:  ${TABLE}.play_time ;;
  }

  dimension: charger_fill {
    type: number
    sql:  ${TABLE}.charger_fill ;;
  }


  dimension: ultiA_created {
    type: number
    sql:  ${TABLE}.ultiA_created ;;
  }

  dimension: ultiB_created {
    type: number
    sql:  ${TABLE}.ultiB_created ;;
  }

  dimension: ultiC_created {
    type: number
    sql:  ${TABLE}.ultiC_created ;;
  }

  dimension: ultiA_bycharger {
    type: number
    sql:  ${TABLE}.ultiA_bycharger ;;
  }

  dimension: ultiB_bycharger {
    type: number
    sql:  ${TABLE}.ultiB_bycharger ;;
  }

  dimension: ultiC_bycharger {
    type: number
    sql:  ${TABLE}.ultiC_bycharger ;;
  }

  dimension: ultiA_remaining {
    type: number
    sql:  ${TABLE}.ultiA_remaining ;;
  }

  dimension: ultiB_remaining {
    type: number
    sql:  ${TABLE}.ultiB_remaining ;;
  }

  dimension: ultiC_remaining {
    type: number
    sql:  ${TABLE}.ultiC_remaining ;;
  }

  dimension: Last_to_First {
    type: number
    sql:  ${TABLE}.Last_to_First ;;
  }

  dimension: streak_stage {
    type: number
    sql:  ${level_start_p1.streak_stage} ;;
  }



}
