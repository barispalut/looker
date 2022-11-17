view: test_properties {
  derived_table: {
    sql:
--Test_Properties
select distinct user_id, event_time, time_key, event_name, test_name, variant from
(
  (
      SELECT
      user_id as user_id,
      TIMESTAMP_MICROS(event_timestamp) as event_time,
      cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
      event_name,
      63 as test_name,
      cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_63') as integer) as variant,
      first_value(cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) ignore nulls) over (partition by user_id order by TIMESTAMP_MICROS(event_timestamp) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
      as min_level,
      count (distinct(cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_63') as integer))) over (partition by user_id) as variant_count
      FROM `big-blast.analytics_270556009.events_*`
      where cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_63') as integer) is not null
  )
      union distinct
  (
      SELECT
      user_id as user_id,
      TIMESTAMP_MICROS(event_timestamp) as event_time,
      cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
      event_name,
      64 as test_name,
      cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_64') as integer) as variant,
      first_value(cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) ignore nulls) over (partition by user_id order by TIMESTAMP_MICROS(event_timestamp) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
      as min_level,
      count (distinct(cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_64') as integer))) over (partition by user_id) as variant_count
      FROM `big-blast.analytics_270556009.events_*`
      where cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_64') as integer) is not null
  )
      union distinct
  (
      SELECT
      user_id as user_id,
      TIMESTAMP_MICROS(event_timestamp) as event_time,
      cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
      event_name,
      65 as test_name,
      cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_65') as integer) as variant,
      first_value(cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) ignore nulls) over (partition by user_id order by TIMESTAMP_MICROS(event_timestamp) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
      as min_level,
      count (distinct(cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_65') as integer))) over (partition by user_id) as variant_count
      FROM `big-blast.analytics_270556009.events_*`
      where cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_65') as integer) is not null
  )
        union distinct
  (
      SELECT
      user_id as user_id,
      TIMESTAMP_MICROS(event_timestamp) as event_time,
      cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
      event_name,
      66 as test_name,
      cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_66') as integer) as variant,
      first_value(cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) ignore nulls) over (partition by user_id order by TIMESTAMP_MICROS(event_timestamp) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
      as min_level,
      count (distinct(cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_66') as integer))) over (partition by user_id) as variant_count
      FROM `big-blast.analytics_270556009.events_*`
      where cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_66') as integer) is not null
  )

)
where variant_count = 1
and min_level <= 1 or min_level is null

    ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id;;
    hidden: yes
  }

  dimension_group: Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_time ;;
    hidden: yes
  }

  dimension: time_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.time_key ;;
    hidden: yes
  }


  dimension: test_name {
    type: number
    sql:  ${TABLE}.test_name ;;
  }

  dimension: variant {
    type: number
    sql:  ${TABLE}.variant ;;
  }





}
