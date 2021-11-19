import { preferences } from '@raycast/api'
import { PullRequestsList } from './components/PullRequestsList'

export default function View() {
  return <PullRequestsList initialSearch={`review-requested:${preferences.username.value}`} />
}
