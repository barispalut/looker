view: level_end_p3 {
  sql_table_name: `big-blast.analytics_270556009.Level_End_P3_view`;;

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

  dimension: win {
    type: number
    sql:  ${TABLE}.win ;;
  }

  dimension: retry_count_session {
    type: number
    sql:  ${TABLE}.retry_count_session ;;
  }

  dimension: retry_count_lifetime {
    type: number
    sql:  ${TABLE}.retry_count_lifetime ;;
  }

  dimension: remaining_coin {
    type: number
    sql:  ${TABLE}.remaining_coin ;;
  }

  dimension: remaining_star {
    type: number
    sql:  ${TABLE}.remaining_star ;;
  }

  dimension: plus5_used {
    type: number
    sql:  ${TABLE}.plus5_used ;;
  }

  dimension: b1_inventory {
    type: number
    sql:  ${TABLE}.eb1_inventory ;;
  }

  dimension: b2_inventory {
    type: number
    sql:  ${TABLE}.eb2_inventory ;;
  }

  dimension: b3_inventory {
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


  dimension: Last_to_First {
    type: number
    sql:  ${TABLE}.Last_to_First ;;
  }


}
