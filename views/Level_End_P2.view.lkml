view: level_end_p2 {
  derived_table: {
    sql:
--Level_End_P2
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
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'stage_id') as integer) as stage_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'stage_count') as integer) as stage_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'retry_count_session') as integer) as retry_count_session,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'retry_count_lifetime') as integer) as retry_count_lifetime,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_coin') as integer) as remaining_coin,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_lives') as integer) as remaining_lives,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'plus5_used') as integer) as plus5_used,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b1_used') as integer) as b1_used,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b2_used') as integer) as b2_used,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b3_used') as integer) as b3_used,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb1_used') as integer) as pb1_used,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb2_used') as integer) as pb2_used,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb3_used') as integer) as pb3_used,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'start_move_count') as integer) as start_move_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'rem_move_count') as integer) as rem_move_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'move_spent') as integer) as move_spent,
FROM `big-blast.analytics_270556009.events_*`
where event_name='Level_End_P2';;

  }


  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.user_id
      ;;
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
    sql:  ${TABLE}.time_key ;;
    hidden: yes
  }

  dimension: win {
    type: number
    sql:  ${TABLE}.win ;;
  }

  dimension: stage_id {
    type: number
    sql:  ${TABLE}.stage_id ;;
  }

  dimension: stage_count {
    type: number
    sql:  ${TABLE}.stage_count ;;
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

  dimension: remaining_lives {
    type: number
    sql:  ${TABLE}.remaining_lives ;;
  }

  dimension: plus5_used {
    type: number
    sql:  ${TABLE}.plus5_used ;;
  }

  dimension: b1_used {
    type: number
    sql:  ${TABLE}.b1_used ;;
  }

  dimension: b2_used {
    type: number
    sql:  ${TABLE}.b2_used ;;
  }

  dimension: b3_used {
    type: number
    sql:  ${TABLE}.b3_used ;;
  }

  dimension: pb1_used {
    type: number
    sql:  ${TABLE}.pb1_used ;;
  }

  dimension: pb2_used {
    type: number
    sql:  ${TABLE}.pb2_used ;;
  }

  dimension: pb3_used {
    type: number
    sql:  ${TABLE}.pb3_used ;;
  }

  dimension: start_move_count {
    type: number
    sql:  ${TABLE}.start_move_count ;;
  }

  dimension: rem_move_count {
    type: number
    sql:  ${TABLE}.rem_move_count ;;
  }

  dimension: move_spent {
    type: number
    sql:  ${TABLE}.move_spent ;;
  }

}
