view: level_end_p4 {
  derived_table: {
    sql:
--Level_End_P4
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
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'initial_board_hp') as integer) as initial_board_hp,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'final_board_hp') as integer) as final_board_hp,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'zero_damage_percentage') as numeric) as zero_damage_percentage,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'shuffle_count') as integer) as shuffle_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'disco_merges') as integer) as disco_merges,
row_number() over (partition by user_id, cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer),cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) order by TIMESTAMP_MICROS(event_timestamp) desc) as Last_to_First,
FROM `big-blast.analytics_270556009.events_*`
where event_name='Level_End_P4';;

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

  dimension: initial_board_hp {
    type: number
    sql:  ${TABLE}.initial_board_hp ;;
  }

  dimension: final_board_hp {
    type: number
    sql:  ${TABLE}.final_board_hp ;;
  }

  dimension: zero_damage_percentage {
    type: number
    sql:  ${TABLE}.zero_damage_percentage ;;
  }

  dimension: shuffle_count {
    type: number
    sql:  ${TABLE}.shuffle_count ;;
  }

  dimension: disco_merges {
    type: number
    sql:  ${TABLE}.disco_merges ;;
  }

  dimension: Last_to_First {
    type: number
    sql:  ${TABLE}.Last_to_First ;;
  }


}
