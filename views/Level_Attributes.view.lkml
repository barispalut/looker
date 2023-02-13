view: level_attributes {


  derived_table: {
    sql: select level_key,streak,try_count,plus5_used from   `big-blast.analytics_270556009.Level_Start_P1_view`;;

  }

  dimension: level_key {
    type: string
    primary_key: yes
    sql:  ${TABLE}.level_key;;
  }

  dimension: streak {
    type: number
    sql:  ${TABLE}.streak;;
  }

  dimension: try_count {
    type: number
    sql:  ${TABLE}.try_count;;
  }

  dimension: plus5_used {
    type: number
    sql:  ${TABLE}.plus5_used ;;
  }

  }
