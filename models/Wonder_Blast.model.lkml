connection: "looker_first"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: event_info {

join:level_start_p1  {
  type: left_outer
  sql_on: ${event_info.event_key} = ${level_start_p1.event_key} ;;
  relationship: one_to_many
}

join:level_end_p1  {
  type: left_outer
  sql_on: ${event_info.event_key} = ${level_end_p1.event_key} ;;
  relationship: one_to_many
}

join:level_end_p2  {
    type: left_outer
    sql_on: ${event_info.event_key} = ${level_end_p2.event_key} ;;
    relationship: one_to_many
  }

join:level_end_p3  {
    type: left_outer
    sql_on: ${event_info.event_key} = ${level_end_p3.event_key} ;;
    relationship: one_to_many
  }

join:level_end_p4  {
    type: left_outer
    sql_on: ${event_info.event_key} = ${level_end_p4.event_key} ;;
    relationship: one_to_many
  }

  join:stage_end_event_1 {
    type: left_outer
    sql_on: ${event_info.event_key} = ${stage_end_event_1.event_key} ;;
    relationship: one_to_many
  }

  join:iap_p1 {
    type: left_outer
    sql_on: ${event_info.event_key} = ${iap_p1.event_key} ;;
    relationship: one_to_many
  }

  join:coin_earn {
    type: left_outer
    sql_on: ${event_info.event_key} = ${coin_earn.event_key} ;;
    relationship: one_to_many
  }

  join:coin_spend {
    type: left_outer
    sql_on: ${event_info.event_key} = ${coin_spend.event_key} ;;
    relationship: one_to_many
  }

join:test_properties  {
    type: left_outer
    sql_on: ${event_info.event_key} = ${test_properties.event_key} ;;
    relationship: one_to_many
  }

  join:building_p1  {
    type: left_outer
    sql_on: ${event_info.event_key} = ${building_p1.event_key} ;;
    relationship: one_to_many
  }

  join:earn_reward  {
    type: left_outer
    sql_on: ${event_info.event_key} = ${earn_reward.event_key} ;;
    relationship: one_to_many
  }

  join:invite_p1  {
    type: left_outer
    sql_on: ${event_info.event_key} = ${invite_p1.event_key} ;;
    relationship: one_to_many
  }

  join:aztec_launch_event  {
    type: left_outer
    sql_on: ${event_info.event_key} = ${aztec_launch_event.event_key} ;;
    relationship: one_to_many
  }

  join:aztec_begin_event  {
    type: left_outer
    sql_on: ${event_info.event_key} = ${aztec_begin_event.event_key} ;;
    relationship: one_to_many
  }

  join:aztec_end_event {
    type: left_outer
    sql_on: ${event_info.event_key} = ${aztec_end_event.event_key} ;;
    relationship: one_to_many
  }



}
