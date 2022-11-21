view: event_info {
  derived_table: {
    sql:
--Event_Info
select user_id,
install_date,
event_time,
time_key,
event_name,
collection_id,
level_id,
level_retry_count,
session_id,
app_version,
country,
case when lead(event_time) over (partition by user_id order by event_time) is null then current_timestamp() else lead(event_time) over (partition by user_id order by event_time) end as next_event_time,
count(distinct session_id) over (partition by user_id, date_diff(event_time, install_date,day)) as session_count_per_day,
row_number() over (partition by user_id, date_diff(event_time, install_date,day) order by event_time desc) as Last_to_First_Day,
sum(win) over (partition by user_id order by event_time) as Level_Progress
from
(
SELECT distinct
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
cast(TIMESTAMP_MICROS(event_timestamp) as string) as time_key,
event_name,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
safe_cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
case when event_name = "Level_End_P2" then cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'win') as integer) else null end as win,
safe_cast(app_info.version as integer) as app_version,
geo.country as country
FROM `big-blast.analytics_270556009.events_*`
)
      ;;

  }



  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id
      ;;
  }

  dimension_group: Install_Date {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.install_date
      ;;
  }

  dimension_group: Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql: ${TABLE}.event_time
      ;;
  }

  dimension: Event_Name {
    type: string
    sql:  ${TABLE}.event_name ;;
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


  dimension: app_verison {
    type: number
    sql:  ${TABLE}.app_version ;;
  }


  dimension: country {
    type: string
    sql:  ${TABLE}.country ;;
  }


  dimension: time_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.time_key ;;
    hidden: yes
  }

  dimension_group: Next_Event_Time {
    type: time
    timeframes: [date,month,week,time]
    sql:  ${TABLE}.next_event_time
      ;;
  }

  dimension: Churn{
    type: string
    sql:  case when date_diff (${TABLE}.next_event_time, ${TABLE}.event_time, hour) >= 72 then "C" else null end  ;;

  }

  dimension: Day {
    type: number
    sql:  date_diff(${TABLE}.event_time,${TABLE}.install_date,day) ;;
  }

  dimension: Day_Since_Install {
    type: number
    sql:  date_diff(current_timestamp(),${TABLE}.install_date,day) ;;
  }

  dimension: session_count_per_day {
    type: number
    sql:  ${TABLE}.session_count_per_day ;;
  }

  dimension: Last_to_First_Day {
    type: number
    sql:  ${TABLE}.Last_to_First_Day ;;
  }

  dimension: Level_Progress {
    type: number
    sql:  ${TABLE}.Level_Progress ;;
  }







}
