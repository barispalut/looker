view: level_start_p1 {
  sql_table_name: `big-blast.analytics_270556009.Level_Start_P1_view` ;;

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
  dimension: Try_Count {
    type: number
    sql:  ${TABLE}.try_count ;;
  }


  dimension: level_guid {
    type: string
    sql:  ${TABLE}.level_guid ;;
  }


  dimension: streak_stage {
    type: number
    sql:  ${TABLE}.streak ;;
  }

  dimension: age_stage {
    type: number
    sql:  ${TABLE}.age_stage ;;
  }



  dimension: remaining_star {
    type: number
    sql:  ${TABLE}.remaining_star ;;
  }

  dimension: remaining_coin {
    type: number
    sql:  ${TABLE}.remaining_coin ;;
  }

  dimension: b1_inventory {
    type: number
    sql:  ${TABLE}.b1_inventory ;;
  }


  dimension: b2_inventory {
    type: number
    sql:  ${TABLE}.b2_inventory ;;
  }


  dimension: b3_inventory {
    type: number
    sql:  ${TABLE}.b3_inventory ;;
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



  dimension: Level_Churn{
    type: string
    sql:  case when date_diff (${TABLE}.next_event_time, ${TABLE}.event_time, hour) >= 72 then "C" else null end  ;;

  }


  dimension: Last_to_First {
    type: number
    sql:  ${TABLE}.Last_to_First ;;
  }


}
