/*  monitoring  */
resource "aws_cloudwatch_event_rule" "default" {
  count         = length(var.cloud_watch_event_objs)
  name          = var.cloud_watch_event_objs[count.index]["cloud_watch_event_rule_name"]
  description   = var.cloud_watch_event_objs[count.index]["cloud_watch_event_rule_description"]
  event_pattern = var.cloud_watch_event_objs[count.index]["event_pattern"]
}

resource "aws_cloudwatch_event_target" "default" {
  count     = length(aws_cloudwatch_event_rule.default)
  rule      = aws_cloudwatch_event_rule.default[count.index].name
  target_id = var.cloud_watch_event_objs[count.index]["aws_cloudwatch_event_target_id"]
  arn       = var.cloud_watch_event_objs[count.index]["function_arn"]
}

resource "aws_lambda_permission" "default" {
  count         = length(aws_cloudwatch_event_target.default)
  statement_id  = var.cloud_watch_event_objs[count.index]["statement_id"]
  action        = "lambda:InvokeFunction"
  function_name = aws_cloudwatch_event_target.default[count.index].arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.default[count.index].arn
}
