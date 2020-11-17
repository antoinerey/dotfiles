# TODO: How can I generate autocompletion?
function bm {
  local command=$1
  local argument=$2

  if [ $command = "list" ]; then
    gh pr status
  fi

  if [ $command = "open" ]; then
    gh pr create --draft --label "Waiting for QA" --assignee antoinerey
  fi

  if [ $command = "ready" ]; then
    local number=${argument:-$(get_pr_number)}

    gh pr ready $number

    add_label $number "Validated by QA"
    remove_label $number "Waiting for QA"
  fi

  if [ $command = "done" ]; then
    gh pr merge --squash $argument
    git pull # Once merged, we're back to the default branch
  fi

  if [ $command = "show" ]; then
    gh pr view --web
  fi
}

# Those functions are internal implementation.

function get_pr_number {
  # Bash functions can't return values as usual. Instead, we need to echo them.
  # See: https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php#functions
  echo $(gh api /repos/:owner/:repo/pulls --field head=:owner::branch --method GET | jq ".[0].number")
}

function add_label {
  local number=$1
  local label=$2

  # See https://github.com/cli/cli/issues/1588#issuecomment-682110360
  echo "{\"labels\":[\"$label\"]}" | gh api /repos/:owner/:repo/issues/$number/labels --method POST --input=-  --silent
}

function remove_label {
  local number=$1
  local label=$2

  # Since the label is sent as URL parameter, we need to encode spaces.
  local labelEncoded="${label// /%20}"

  gh api /repos/:owner/:repo/issues/$number/labels/$labelEncoded --method DELETE --silent
}
