view: level_end_p3 {
  derived_table: {
    sql:
--Level_End_P3
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
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'retry_count_lifetime') as integer) as  retry_count_lifetime,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_coin') as integer) as  remaining_coin,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_star') as integer) as  remaining_star,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'plus5_used') as integer) as plus5_used,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b1_inventory') as integer) as b1_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b2_inventory') as integer) as b2_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'b3_inventory') as integer) as b3_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb1_inventory') as integer) as pb1_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb2_inventory') as integer) as pb2_inventory,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'pb3_inventory') as integer) as pb3_inventory,
safe_cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ww_stage') as integer) as ww_stage,
(SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'ww_reward_earned') as ww_reward_earned,
row_number() over (partition by user_id, cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer),cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) order by TIMESTAMP_MICROS(event_timestamp) desc) as Last_to_First,
FROM `big-blast.analytics_270556009.events_*`
where event_name='Level_End_P3';;

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

  dimension: remaining_star {
    type: number
    sql:  ${TABLE}.remaining_star ;;
  }

  dimension: plus5_used {
    type: number
    sql:  ${TABLE}.plus5_used ;;
  }

  dimension: b1_inventory {
    type: number
    sql:  ${TABLE}.b1_inventory ;;
  }

  dimension: b2_inventory {
    type: number
    sql:  ${TABLE}.b2_inventory ;;
  }

  dimension: b3_inventory {
    type: number
    sql:  ${TABLE}.b3_inventory ;;
  }

  dimension: pb1_inventory {
    type: number
    sql:  ${TABLE}.pb1_inventory ;;
  }

  dimension: pb2_inventory {
    type: number
    sql:  ${TABLE}.pb2_inventory ;;
  }

  dimension: pb3_inventory {
    type: number
    sql:  ${TABLE}.pb3_inventory ;;
  }

  dimension: ww_stage {
    type: number
    sql:  ${TABLE}.ww_stage ;;
  }

  dimension: ww_reward_earned {
    type: string
    sql:  ${TABLE}.ww_reward_earned ;;
  }

  dimension: Last_to_First {
    type: number
    sql:  ${TABLE}.Last_to_First ;;
  }


}
