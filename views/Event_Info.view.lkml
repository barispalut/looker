view: event_info {
  derived_table: {
    sql:
--Event_Info
SELECT
user_id as user_id,
min(TIMESTAMP_MICROS (user_first_touch_timestamp)) over (partition by user_id) as install_date,
TIMESTAMP_MICROS(event_timestamp) as event_time,
event_name,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'collection_id') as integer) as collection_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_id') as integer) as level_id,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'level_retry_count') as integer) as level_retry_count,
cast((SELECT value.string_value FROM UNNEST (event_params) WHERE key = 'session_id') as integer) as session_id,
safe_cast(app_info.version as integer) as app_version,
geo.country as country
FROM `big-blast.analytics_270556009.events_*`
where 1=1
and event_name in ('Aztec_Begin_Event','Aztec_End_Event','Aztec_Launch_Event','Level_End_P1','Level_End_P2','Level_End_P3','Level_End_P4','Level_Start_P1','Stage_End_Event_1','building_p1',
'coin_earn','coin_spend','earn_reward','gem_earn','iap_p1','insufficient_funds','invite_p1','kart_race_p1','loading_continue','ma_p1','network_persistent_fail','network_request','network_request_time_out',
'network_retry_success','process_profiler','star_earn','star_spend','teams_p1','user_session_start','wilsons_fair_event_entry_event','wilsons_fair_homepage_icon_click_event','wilsons_fair_homepage_stage_event','wilsons_fair_reward_event')


      ;;

  }



  dimension: user_id {
    type: string
    primary_key: yes
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
    sql:  ${TABLE}.app_verison ;;
  }


  dimension: country {
    type: string
    sql:  ${TABLE}.country ;;
  }

}
