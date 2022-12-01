view: building_p1 {
  sql_table_name: `big-blast.analytics_270556009.building_p1_view` ;;

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

  dimension: building_id {
    type: number
    sql:  ${TABLE}.building_id ;;
  }

  dimension: option_id {
    type: number
    sql:  ${TABLE}.option_id ;;
  }

  dimension: remaining_star {
    type: number
    sql:  ${TABLE}.remaining_star ;;
  }

  dimension: remaining_coin {
    type: number
    sql:  ${TABLE}.remaining_coin ;;
  }

  dimension: area_id {
    type: number
    sql:  ${TABLE}.area_id ;;
  }

  dimension: star_spent {
    type: number
    sql:  ${TABLE}.star_spent ;;
  }

  dimension: edit_mode {
    type: number
    sql:  ${TABLE}.edit_mode ;;
  }

  dimension: edit_mode_task {
    type: number
    sql:  ${TABLE}.edit_mode_task ;;
  }



}
