import { preferences, setLocalStorageItem, getLocalStorageItem } from '@raycast/api'
import { Octokit } from 'octokit'

export const github = new Octokit({
  auth: preferences.token.value,
})

github.hook.wrap('request', async (request, options) => {
  const cacheKey = JSON.stringify(options)
  const cachedResponse = await getLocalStorageItem(cacheKey)

  if (cachedResponse && typeof cachedResponse === 'string') {
    return JSON.parse(cachedResponse)
  }

  const response = await request(options)

  if (response.status === 200) {
    setLocalStorageItem(cacheKey, JSON.stringify(response))
  }

  return response
})
