view: level_end_p1 {
  derived_table: {
    sql:
--Level_End_P1
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'win') as integer) as win,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'retry_count_session') as integer) as  retry_count_session,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'play_time') as numeric) as  play_time,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'in_air_merge') as integer) as in_air_merge,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiA_created') as integer) as ultiA_created,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiB_created') as integer) as ultiB_created,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiC_created') as integer) as ultiC_created,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiA_bycharger') as integer) as ultiA_bycharger,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiB_bycharger') as integer) as ultiB_bycharger,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiC_bycharger') as integer) as ultiC_bycharger,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiA_remaining') as integer) as ultiA_remaining,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiB_remaining') as integer) as ultiB_remaining,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ultiC_remaining') as integer) as ultiC_remaining,
cast(app_info.version as integer) as app_version
FROM `big-blast.analytics_270556009.events_*`
where 1=1
and event_name='Level_End_P1' ;;

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

  dimension: win {
    type: number
    sql:  ${TABLE}.win ;;
  }

  dimension: retry_count_session {
    type: number
    sql:  ${TABLE}.retry_count_session ;;
  }

  dimension: play_time {
    type: number
    sql:  ${TABLE}.play_time ;;
  }

  dimension: in_air_merge {
    type: number
    sql:  ${TABLE}.in_air_merge ;;
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





}
