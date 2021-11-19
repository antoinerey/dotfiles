import { ActionPanel, List, OpenInBrowserAction } from '@raycast/api'
import { useState, useEffect } from 'react'
import { github } from '../utils/github'

interface Props {
  repository: Repository
}

export function ReleasesList({ repository }: Props) {
  const [isLoading, setIsLoading] = useState(true)
  const [releases, setReleases] = useState<Release[]>([])

  useEffect(() => {
    async function fetchReleases() {
      setIsLoading(true)

      const { data } = await github.request('GET /repos/{org}/{repo}/releases', {
        org: repository.owner.login,
        repo: repository.name,
      })

      setIsLoading(false)
      setReleases(data as Release[])
    }

    fetchReleases()
  }, [repository])

  return (
    <List isLoading={isLoading}>
      {releases.map((release) => {
        const subtitle = new Date(release.published_at).toLocaleString('en-GB', {
          day: 'numeric',
          month: 'short',
          hour: 'numeric',
          minute: 'numeric',
        })

        return (
          <List.Item
            key={release.id}
            title={release.name}
            accessoryTitle={subtitle}
            icon="tag-white.png"
            actions={
              <ActionPanel>
                <OpenInBrowserAction url={release.html_url} title="Open in browser" />
              </ActionPanel>
            }
          />
        )
      })}
    </List>
  )
}
