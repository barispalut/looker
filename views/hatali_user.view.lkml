view: hatali_user {
  derived_table: {
    sql:

select distinct
user_id,
min(level_id) as min_level_id
from `big-blast.analytics_270556009.events_*`
where 1=1
and {%condition test_55_variant%} cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_55') as integer) {%endcondition%}
and {%condition test_56_variant%} cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_56') as integer) {%endcondition%}
and {%condition test_57_variant%} cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_57') as integer) {%endcondition%}
and {%condition test_58_variant%} cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_58') as integer) {%endcondition%}
and {%condition test_59_variant%} cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_59') as integer) {%endcondition%}
and {%condition test_60_variant%} cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_60') as integer) {%endcondition%}
and {%condition test_61_variant%} cast((SELECT value.string_value FROM UNNEST(user_properties) WHERE key = 'firebase_exp_61') as integer) {%endcondition%}
group by 1




      ;;

  }


  filter: test_55_variant {
    type: number


  }


  filter: test_56_variant {
    type: number


  }
  filter: test_57_variant {
    type: number


  }


  filter: test_58_variant {
    type: number


  }

  filter: test_59_variant {
    type: number

     }


  filter: test_60_variant {
    type: number


  }

  filter: test_61_variant {
    type: number

  }


  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.user_id
      ;;
  }


  dimension: min_level_id {
    type: number
    sql:  ${TABLE}.min_level_id ;;
  }



}

# view: cohort_deneme_cohort {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
