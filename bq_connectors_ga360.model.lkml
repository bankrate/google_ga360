connection: "big_query_connection"
#connection: "datacollector"


# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: ga_sessions {
  hidden: yes
  extends: [ga_sessions_block]
}
