connection: "looker_first"

#include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
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

  join:level_start_p2  {
    type: left_outer
    sql_on: ${event_info.event_key} = ${level_start_p2.event_key} ;;
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

  join:level_attributes {
    type: left_outer
    sql_on: ${event_info.level_key} = ${level_attributes.level_key} ;;
    relationship: one_to_many
  }

  join:level_all {
    type: left_outer
    sql_on: ${event_info.level_key} = ${level_all.level_key} ;;
    relationship: one_to_many
  }
}



explore: user_properties {

  join:event_properties  {
    type: left_outer
    sql_on: ${user_properties.user_id} = ${event_properties.user_id}  ;;
    relationship: one_to_many
  }

  join:level  {
    type: left_outer
    sql_on:  ${event_properties.level_key} = ${level.level_key}  ;;
    relationship: many_to_one
  }

  join:iap  {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${iap.event_key}  ;;
    relationship: one_to_many
  }

  join:building  {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${building.event_key}  ;;
    relationship: one_to_many
  }

  join:coin_transaction  {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${coin_transaction.event_key}  ;;
    relationship: one_to_many
  }

  join:reward_earn {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${reward_earn.event_key}  ;;
    relationship: one_to_many
  }

  join:copter_craze  {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${copter_craze.event_key}  ;;
    relationship: one_to_many
  }

  join:move_hunt  {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${move_hunt.event_key}  ;;
    relationship: one_to_many
  }

  join:age  {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${age.event_key}  ;;
    relationship: one_to_many
  }

  join:test_properties  {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${test_properties.event_key}  ;;
    relationship: one_to_many
  }

  join:episode_info  {
    type: left_outer
    sql_on:  ${event_properties.episode_id} = ${episode_info.episode_id}  ;;
    relationship: many_to_one
  }

  join:performance  {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${performance.event_key}  ;;
    relationship: one_to_many
  }

  join:process_profiler  {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${process_profiler.event_key}  ;;
    relationship: one_to_many
  }

  join:ego_event  {
    type: left_outer
    sql_on:  ${event_properties.event_key} = ${ego_event.event_key}  ;;
    relationship: one_to_many
  }

  join:user_performance_spike  {
    type: left_outer
    sql_on: ${user_properties.user_id} = ${user_performance_spike.user_id}  ;;
    relationship: one_to_many
  }

}
