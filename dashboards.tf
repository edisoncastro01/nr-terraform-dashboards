data "newrelic_entity" "your entity name" {
  name = var.app_name
  type = "APPLICATION"
  domain = "APM"
}
resource "newrelic_dashboard" "your resource name" {
  title             = var.dashboard_name
  grid_column_count = 3

  widget {
    title         = "Links to APM Dashboard"
    width         = 1
    height        = 1
    row           = 1
    column        = 1
    source        = <<-EOF
      "[Go to APM Dashboard](https://one.newrelic.com/redirect/entity/${var.entity_id})"
    EOF
    visualization = "markdown"
  }

  widget {
    title         = "Statistics"
    nrql          = <<-EOF
      SELECT 
        count(*),max(duration) as max,min(duration) as min,average(duration) as average,median(duration),percentage(count(*), WHERE error is true) as percentage_error 
        FROM Transaction 
        WHERE appName='${var.app_name}' SINCE 30 minutes ago
    EOF
    visualization = "attribute_sheet"
    width         = 1
    height        = 1
    row           = 1
    column        = 2
  }

  widget {
    title         = "Use"
    nrql          = <<-EOF
      SELECT 
        count(*) as count 
      FROM Transaction 
      WHERE appName='${var.app_name}' 
      TIMESERIES auto 
      SINCE 30 minutes ago
    EOF
    visualization = "faceted_area_chart"
    width         = 1
    height        = 1
    row           = 1
    column        = 3
  }

  widget {
    title         = "Response Time"
    nrql          = <<-EOF
      SELECT 
        average(duration),median(duration),max(duration),min(duration)  
      FROM Transaction 
      WHERE appName='${var.app_name}' 
      TIMESERIES AUTO 
      SINCE 30 minutes ago
    EOF
    visualization = "line_chart"
    width         = 1
    height        = 1
    row           = 2
    column        = 1
  }

  widget {
    title         = "Use by Agent"
    nrql          = <<-EOF
      SELECT 
        count(*) 
      FROM Transaction 
      WHERE appName='${var.app_name}' 
      TIMESERIES AUTO 
      FACET request.headers.userAgent 
      SINCE 30 minutes ago
    EOF
    visualization = "faceted_area_chart"
    width         = 1
    height        = 1
    row           = 2
    column        = 2
  }

  widget {
    title         = "Use by Host"
    nrql          = <<-EOF
      SELECT 
        count(*) FROM Transaction 
      WHERE appName='${var.app_name}' 
      FACET request.headers.host  
      SINCE 30 minutes ago
    EOF
    visualization = "facet_bar_chart"
    width         = 1
    height        = 1
    row           = 2
    column        = 3
  }
}
