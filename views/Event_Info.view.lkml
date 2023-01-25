view: event_info {
  sql_table_name: `big-blast.analytics_270556009.Event_Info_view`;;



  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id
      ;;
  }

  dimension_group: Install_Date {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.install_date
      ;;
  }

  dimension_group: Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_time
      ;;
  }

  dimension: Event_Name {
    type: string
    sql:  ${TABLE}.event_name ;;
  }

  dimension: session_id {
    type: number
    sql:  case when ${TABLE}.session_id = -1 then 0 else ${TABLE}.session_id end;;
  }


  dimension: collection_id {
    type: number
    sql:  ${TABLE}.collection_id ;;
  }


  dimension: level_id {
    type: number
    sql:  ${TABLE}.level_id ;;
  }

  dimension: try_count {
    type: number
    sql:  ${TABLE}.try_count ;;
  }


  dimension: app_verison {
    type: number
    sql:  ${TABLE}.app_version ;;
  }


  dimension: country {
    type: string
    sql:  ${TABLE}.country ;;
  }


  dimension: event_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key;;
  }

  dimension_group: Next_Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql:  ${TABLE}.next_event_time
      ;;
  }

  dimension: Churn{
    type: string
    sql:  case when date_diff (${TABLE}.next_event_time, ${TABLE}.event_time, hour) >= 72 then "C" else null end  ;;

  }

  dimension: Day {
    type: number
    sql:  date_diff(${TABLE}.event_time,${TABLE}.install_date,day) ;;
  }

  dimension: Day_Since_Install {
    type: number
    sql:  date_diff(current_timestamp(),${TABLE}.install_date,day) ;;
  }


  dimension: session_count {
    type: number
    sql:  ${TABLE}.session_count ;;
  }


  dimension: Current_Level_Progress {
    type: number
    sql:  ${TABLE}.Current_Level_Progress ;;
  }



}
