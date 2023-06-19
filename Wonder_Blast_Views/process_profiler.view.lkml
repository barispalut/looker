view: process_profiler {
  sql_table_name: `big-blast.analytics_270556009.process_profiler_view`  ;;

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

  dimension: event_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.event_key ;;
    hidden: yes
  }

  dimension: id {
    type: number
    sql:  ${TABLE}.id ;;
  }

  dimension: awake {
    type: number
    sql:  ${TABLE}.awake ;;
  }

  dimension: completed {
    type: number
    sql:  ${TABLE}.completed ;;
  }

  dimension: loading_time {
    type: number
    sql:  ${TABLE}.loading_time ;;
  }

  dimension: loading_time_without_download {
    type: number
    sql:  ${TABLE}.loading_time_without_download ;;
  }
  dimension: duration_asset_manager {
    type: number
    sql:  ${TABLE}.duration_asset_manager ;;
  }

  dimension: duration_clear_prior_asset_bundles {
    type: number
    sql:  ${TABLE}.duration_clear_prior_asset_bundles ;;
  }

  dimension: duration_create_firebase {
    type: number
    sql:  ${TABLE}.duration_create_firebase ;;
  }

  dimension: duration_create_player {
    type: number
    sql:  ${TABLE}.duration_create_player ;;
  }

  dimension: duration_create_system_instances {
    type: number
    sql:  ${TABLE}.duration_create_system_instances ;;
  }

  dimension: duration_fb_initialize {
    type: number
    sql:  ${TABLE}.duration_fb_initialize ;;
  }

  dimension: duration_firebase_init {
    type: number
    sql:  ${TABLE}.duration_firebase_init ;;
  }

  dimension: duration_game_services_initialize {
    type: number
    sql:  ${TABLE}.duration_game_services_initialize ;;
  }

  dimension: duration_initial_sync {
    type: number
    sql:  ${TABLE}.duration_initial_sync ;;
  }

  dimension: duration_load_first_level {
    type: number
    sql:  ${TABLE}.duration_load_first_level ;;
  }

  dimension: duration_load_local_data {
    type: number
    sql:  ${TABLE}.duration_load_local_data ;;
  }

  dimension: duration_load_scene {
    type: number
    sql:  ${TABLE}.duration_load_scene ;;
  }

  dimension: duration_match_scene {
    type: number
    sql:  ${TABLE}.duration_match_scene ;;
  }

  dimension: duration_opening_popups {
    type: number
    sql:  ${TABLE}.duration_opening_popups ;;
  }

  dimension: duration_player_initialize {
    type: number
    sql:  ${TABLE}.duration_player_initialize ;;
  }

  dimension: duration_preload_bundles {
    type: number
    sql:  ${TABLE}.duration_preload_bundles ;;
  }


  dimension: duration_preload {
    type: number
    sql:  ${TABLE}.duration_preload ;;
  }

  dimension: duration_stats {
    type: number
    sql:  ${TABLE}.duration_stats ;;
  }

  dimension: duration_types_load {
    type: number
    sql:  ${TABLE}.duration_types_load ;;
  }

  dimension: duration_wait_for_building_manager_init {
    type: number
    sql:  ${TABLE}.duration_wait_for_building_manager_init ;;
  }

  dimension: duration_wait_for_firebase_get_ready {
    type: number
    sql:  ${TABLE}.duration_wait_for_firebase_get_ready ;;
  }

  dimension: duration_wait_for_player_init {
    type: number
    sql:  ${TABLE}.duration_wait_for_player_init ;;
  }

  dimension: version_first_open {
    type: number
    sql:  ${TABLE}.version_first_open ;;
  }

  dimension: version_entry_success {
    type: number
    sql:  ${TABLE}.version_entry_success ;;
  }

  dimension: duration_preload_bundles_with_download {
    type: number
    sql:  ${TABLE}.duration_preload_bundles_with_download ;;
  }

  dimension: duration_preload_bundles_without_download {
    type: number
    sql:  ${TABLE}.duration_preload_bundles_without_download ;;
  }


}
