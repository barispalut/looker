view: level_start_p1 {
  derived_table: {
    sql:
--Level_Start_P1
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer)+1 as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_guid') as level_guid,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_star') as integer) as  remaining_star,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_coin') as integer) as  remaining_coin,
row_number() over (partition by user_id, cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer),cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) order by TIMESTAMP_MICROS(event_timestamp) desc) as Last_to_First,
cast(app_info.version as integer) as app_version
FROM `big-blast.analytics_270556009.events_*`
where 1=1
and event_name='Level_Start_P1'
      ;;

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
  dimension: Try_Count {
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

  dimension: remaining_coin {
    type: number
    sql:  ${TABLE}.remaining_coin ;;
  }


  dimension: Last_to_First {
    type: number
    sql:  ${TABLE}.Last_to_First ;;
  }


}
