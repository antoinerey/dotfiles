import { ActionPanel, List, OpenInBrowserAction } from '@raycast/api'
import { useState, useEffect } from 'react'
import { github } from '../utils/github'

interface Props {
  initialSearch?: string
}

export function PullRequestsList({ initialSearch = '' }: Props) {
  const [search, setSearch] = useState('')
  const [isLoading, setIsLoading] = useState(true)
  const [pullRequests, setPullRequests] = useState<PullRequest[]>([])

  useEffect(() => {
    async function fetchPullRequests() {
      setIsLoading(true)

      const { data } = await github.request('GET /search/issues', {
        q: `is:pull ${initialSearch} ${search}`,
      })

      console.log({ data })

      setIsLoading(false)
      setPullRequests(data.items as unknown as PullRequest[])
    }

    fetchPullRequests()
  }, [initialSearch, search])

  return (
    <List isLoading={isLoading} onSearchTextChange={setSearch} throttle>
      {pullRequests.map((pullRequest) => (
        <List.Item
          key={pullRequest.id}
          title={pullRequest.title}
          subtitle={`#${pullRequest.number}`}
          accessoryTitle={pullRequest.repo.full_name}
          icon="pull-request-white.png"
          actions={
            <ActionPanel>
              <OpenInBrowserAction url={pullRequest.html_url} title="Open in browser" />
            </ActionPanel>
          }
        />
      ))}
    </List>
  )
}
