view: test_properties {
  sql_table_name: `big-blast.analytics_270556009.test_properties_view` ;;

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id;;
    hidden: yes
  }

  dimension_group: Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_time ;;
    hidden: yes
  }

  dimension: event_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key ;;
    hidden: yes
  }


  dimension: test_name {
    type: number
    sql:  ${TABLE}.test_name ;;
  }

  dimension: variant {
    type: number
    sql:  ${TABLE}.variant ;;
  }





}
