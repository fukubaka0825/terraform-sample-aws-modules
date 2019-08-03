/* required */
variable "cloud_watch_event_objs" {
  //map(string)でもいいんだけどparameterとしてフィールドが見えてる方がわかりやすいかなと思い
  type = list(object({
    statement_id                       = string
    cloud_watch_event_rule_name        = string
    cloud_watch_event_rule_description = string
    event_pattern                      = string
    aws_cloudwatch_event_target_id     = string
    function_arn                       = string
    })
  )
  description = "watchしたいリソースとイベントパターンとlambda関数を打ち込む"
}

/* optional */
