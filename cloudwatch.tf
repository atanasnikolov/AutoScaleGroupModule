# Cloudwatch configuaration ---------------------------------------------------
resource "aws_cloudwatch_metric_alarm" "autoscale_alarm" {
  alarm_name                = var.cloudwatch_alarm_name
  comparison_operator       = var.cloudwatch_comparison_operator
  evaluation_periods        = 1
  metric_name               = var.cloudwatch_metric_name
  namespace                 = var.namespace
  period                    = 60
  statistic                 = var.statistic
  threshold                 = 80
  alarm_description         = var.alarm_description
  alarm_actions = [aws_autoscaling_policy.nginx_autoscale_policy.arn]
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.auto_scale_group.name

  }
}