view: level_start_p1 {
  derived_table: {
    sql:
--Level_Start_P1
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_guid') as level_guid,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_star') as integer) as  remaining_star,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_coin') as integer) as  remaining_coin,
cast(app_info.version as integer) as app_version
FROM `big-blast.analytics_270556009.events_*`
where 1=1
and event_name='Level_Start_P1'
      ;;

  }

  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.user_id
      ;;
  }


  dimension_group: Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_time
      ;;
  }

  dimension: session_id {
    type: number
    sql:  ${TABLE}.session_id ;;
  }


  dimension: collection_id {
    type: number
    sql:  ${TABLE}.collection_id ;;
  }


  dimension: level_id {
    type: number
    sql:  ${TABLE}.level_id ;;
  }

  dimension: level_retry_count {
    type: number
    sql:  ${TABLE}.level_retry_count ;;
  }


  dimension: level_guid {
    type: string
    sql:  ${TABLE}.level_guid ;;
  }



  dimension: remaining_star {
    type: number
    sql:  ${TABLE}.remaining_star ;;
  }



}
