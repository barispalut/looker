view: stage_end_event_1 {
  derived_table: {
    sql:
--Stage_End_Event_1
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'stage_id') as integer) as stage_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'stage_move_count') as integer) as stage_move_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'start_move_count') as integer) as start_move_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'stage_win') as integer) as stage_win,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_start_move_count') as integer) as level_start_move_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'stage_rem_move_count') as integer) as stage_rem_move_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'stage_duration') as numeric) as stage_duration,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'stage_count') as integer) as stage_count,
safe_cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'overall_point') as numeric) as overall_point,
safe_cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'bpm') as numeric) as bpm,
FROM `big-blast.analytics_270556009.events_*`
where event_name='Stage_End_Event_1';;

  }


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

  dimension: time_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.time_key ;;
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
    sql:  ${TABLE}.stage_win ;;
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

  dimension: bpm {
    type: number
    sql:  ${TABLE}.bpm ;;
  }






}
