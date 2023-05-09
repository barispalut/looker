view: performance {
  sql_table_name: `big-blast.analytics_270556009.performance`  ;;

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

  dimension: event_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key ;;
    hidden: yes
  }

  dimension: is_level_end {
    type: number
    sql:  ${TABLE}.is_level_end ;;
  }

  dimension: delta_time {
    type: number
    sql:  ${TABLE}.delta_time ;;
  }

  dimension: perf_ok_20 {
    type: number
    sql:  ${TABLE}.perf_ok_20 ;;
  }

  dimension: perf_20_25 {
    type: number
    sql:  ${TABLE}.perf_20_25 ;;
  }

  dimension: perf_25_33 {
    type: number
    sql:  ${TABLE}.perf_25_33 ;;
  }

  dimension: perf_33_50 {
    type: number
    sql:  ${TABLE}.perf_33_50 ;;
  }

  dimension: perf_50_100 {
    type: number
    sql:  ${TABLE}.perf_50_100 ;;
  }

  dimension: perf_100_up {
    type: number
    sql:  ${TABLE}.perf_100_up ;;
  }

}
