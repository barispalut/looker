view: aztec_end_event {
  derived_table: {
    sql:
--Aztec_End_Event
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
timestamp_millis(cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'launch_time_stamp') as integer)) as launch_time_stamp,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'claimed') as integer) as claimed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'continue_count') as integer) as continue_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'stage') as integer) as stage,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'mask_count') as integer) as mask_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'quit_pop_up_impressions') as integer) as quit_pop_up_impressions,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'total_coin_spent') as integer) as total_coin_spent,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'iap_total') as numeric) as iap_total,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'r_coin') as integer) as r_coin,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'r_pb2') as integer) as r_pb2,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'r_eb1_timed') as integer) as r_eb1_timed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'r_lives_timed') as integer) as r_lives_timed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'r_pb1_timed') as integer) as r_pb1_timed,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'r_eb2') as integer) as r_eb2,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'r_pb3') as integer) as r_pb3,
cast(app_info.version as integer) as app_version
FROM `big-blast.analytics_270556009.events_*`
where event_name = 'Aztec_End_Event';;

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

  dimension_group: aztec_launch_time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.launch_time_stamp ;;
  }

  dimension: claimed {
    type: number
    sql:  ${TABLE}.claimed ;;
  }

  dimension: continue_count {
    type: number
    sql:  ${TABLE}.continue_count ;;
  }

  dimension: stage {
    type: number
    sql:  ${TABLE}.stage ;;
  }

  dimension: mask_count {
    type: number
    sql:  ${TABLE}.mask_count ;;
  }

  dimension: quit_pop_up_impressions {
    type: number
    sql:  ${TABLE}.quit_pop_up_impressions ;;
  }

  dimension: total_coin_spent {
    type: number
    sql:  ${TABLE}.total_coin_spent;;
  }

  dimension: iap_total {
    type: number
    sql:  ${TABLE}.iap_total;;
  }




}
