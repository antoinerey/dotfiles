import { preferences } from '@raycast/api'
import { RepositoriesList } from './components/RepositoriesList'

export default function View() {
  return <RepositoriesList initialSearch={`org:${preferences.organisation.value}`} />
}
