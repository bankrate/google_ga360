include: "ga_block.view.lkml"

explore: ga_sessions_block {
  extends: [ga_sessions_base]
  extension: required

#  always_filter: {
#    filters: {
#      field: ga_sessions.partition_date
#      value: "2017-08-13 00:00:00"
#      ## Partition Date should always be set to a recent date to avoid runaway queries
#   }
#  }
}

view: ga_sessions {
  extends: [ga_sessions_base]
  # The SQL_TABLE_NAME must be replaced here for date partitioned queries to work properly.

  #sql_table_name: `ga360.ga_sessions_*` ;;
  #sql_table_name: TEST.GCS_SESSIONS_TEST;;
  #sql_table_name: [92007919.ga_sessions_20170811] ;;
  sql_table_name: `92007919.ga_sessions_*` ;;


  dimension: block_name {
    type: string
    sql: "Google Analytics" ;;
    # link: {
    #   url: "https://googlecloud.looker.com/dashboards/44"
    #   label: "Google Analytics Dashboard"
    #   icon_url: "http://www.looker.com/favicon.ico"
    # }
  }

  # If you have custom dimensions on sessions, declare them here.

  # dimension: custom_dimension_2 {
  #   sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=2) ;;
  # }


  # dimension: custom_dimension_2 {
  #   sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=2) ;;
  # }

  # dimension: custom_dimension_3 {
  #   sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=3) ;;
  # }

   dimension: CD2_PID {
     sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=2) ;;
   }


  dimension: CD23_Repsonsive {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=23) ;;
  }

  dimension: CD34_Optimizely_Test_Slot1 {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=34) ;;
  }

  dimension: CD35_Optimizely_Test_Slot2 {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=35) ;;
  }

  dimension: CD36_Optimizely_Test_Slot3 {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=36) ;;
  }

  dimension: CD37_Optimizely_Test_Slot4 {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=37) ;;
  }

  dimension: CD38_Optimizely_Test_Slot5 {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=38) ;;
  }

  dimension: CD39_Optimizely_Test_Slot6 {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=39) ;;
  }

  dimension: CD40_Optimizely_Test_Slot7 {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=40) ;;
  }

  dimension: CD41_Optimizely_Test_Slot8 {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=41) ;;
  }

  dimension: CD42_Optimizely_Test_Slot9 {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=42) ;;
  }

  dimension: CD43_Optimizely_Test_Slot10 {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=43) ;;
  }

  dimension: CD60_Traffic_Source {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=60) ;;
  }

  dimension: CD68_EC_ID {
    sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=68) ;;
  }

}

view: geoNetwork {
  extends: [geoNetwork_base]
}

view: totals {
  extends: [totals_base]
}

view: trafficSource {
  extends: [trafficSource_base]
}

view: device {
  extends: [device_base]
}

view: hits {
  extends: [hits_base]
}

view: hits_page {
  extends: [hits_page_base]
}

# -- Ecommerce Fields

view: hits_transaction {
  #extends: [hits_transaction_base]  # Comment out to remove fields
}

view: hits_item {
  #extends: [hits_item_base]
}

# -- Advertising Fields

view: adwordsClickInfo {
  #extends: [adwordsClickInfo_base]
}

view: hits_publisher {
  #extends: [hits_publisher_base]   # Comment out this line to remove fields
}

#  We only want some of the interaction fields.
view: hits_social {
  extends: [hits_social_base]

  dimension: socialInteractionNetwork {hidden: yes}

  dimension: socialInteractionAction {hidden: yes}

  dimension: socialInteractions {hidden: yes}

  dimension: socialInteractionTarget {hidden: yes}

  #dimension: socialNetwork {hidden: yes}

  dimension: uniqueSocialInteractions {hidden: yes}

  #dimension: hasSocialSourceReferral {hidden: yes}

  dimension: socialInteractionNetworkAction {hidden: yes}
}


view: hits_appInfo {
  extends: [hits_appInfo_base]
}

view: hits_eventInfo {
  extends: [hits_eventInfo_base]
  dimension: play {
    sql: ${eventAction} = "play" ;;
    type: yesno
  }
}


view: hits_customDimensions {
  extends: [hits_customDimensions_base]
}

view: hits_customVariables {
  extends: [hits_customVariables_base]
}
