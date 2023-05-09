view: fps_low_performance_devices {
  sql_table_name: `big-blast.analytics_270556009.fps_low_performance_devices`  ;;


  dimension: mobile_model_name {
    type: string
    sql:  ${TABLE}.mobile_model_name ;;
  }


  dimension: app_version {
    type: number
    sql:  ${TABLE}.app_version ;;
  }


}
