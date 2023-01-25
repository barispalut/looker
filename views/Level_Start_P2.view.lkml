view: level_start_p2 {
  sql_table_name: `big-blast.analytics_270556009.Level_Start_P2_view`  ;;

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

  dimension: level_retry_count {
    type: number
    sql:  ${TABLE}.level_retry_count ;;
    hidden: yes
  }

  dimension: event_key{
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key ;;
    hidden: yes
  }


  dimension: try_count{
    type: string
    primary_key: yes
    sql:  ${TABLE}.try_count ;;
    hidden: yes
  }

  dimension: pb1_timed{
    type: number
    sql:  ${TABLE}.pb1_timed ;;
  }

  dimension: pb2_timed{
    type: number
    sql:  ${TABLE}.pb2_timed ;;
  }

  dimension: pb3_timed{
    type: number
    sql:  ${TABLE}.pb3_timed ;;
  }

  dimension: pb1_used{
    type: number
    sql:  ${TABLE}.pb1_used ;;
  }

  dimension: pb2_used{
    type: number
    sql:  ${TABLE}.pb2_used ;;
  }

  dimension: pb3_used{
    type: number
    sql:  ${TABLE}.pb3_used ;;
  }


  dimension: life_timed{
    type: number
    sql:  ${TABLE}.life_timed;;
  }


  dimension: remaining_lives{
    type: number
    sql:  ${TABLE}.remaining_lives;;
  }


    }
