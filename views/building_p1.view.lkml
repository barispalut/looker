view: building_p1 {
  derived_table: {
    sql:
--building_p1
SELECT distinct
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'building_id') as integer) as building_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'option_id') as integer) as option_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_star') as integer) as remaining_star,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_coin') as integer) as remaining_coin,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'area_id') as integer) as area_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'star_spent') as integer) as star_spent,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'remaining_diamond') as integer) as remaining_diamond,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'edit_mode') as integer) as edit_mode,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'edit_mode_task') as integer) as edit_mode_task,
FROM `big-blast.analytics_270556009.events_*`
where event_name='building_p1';;

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

  dimension: building_id {
    type: number
    sql:  ${TABLE}.building_id ;;
  }

  dimension: option_id {
    type: number
    sql:  ${TABLE}.option_id ;;
  }

  dimension: remaining_star {
    type: number
    sql:  ${TABLE}.remaining_star ;;
  }

  dimension: remaining_coin {
    type: number
    sql:  ${TABLE}.remaining_coin ;;
  }

  dimension: area_id {
    type: number
    sql:  ${TABLE}.area_id ;;
  }

  dimension: star_spent {
    type: number
    sql:  ${TABLE}.star_spent ;;
  }

  dimension: edit_mode {
    type: number
    sql:  ${TABLE}.edit_mode ;;
  }

  dimension: edit_mode_task {
    type: number
    sql:  ${TABLE}.edit_mode_task ;;
  }



}
