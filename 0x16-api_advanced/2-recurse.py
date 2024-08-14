import requests

def recurse(subreddit, hot_list=[], after=None):
    base_url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    headers = {'User-Agent': 'Mozilla/5.0'}
    params = {'after': after} if after else {}

    response = requests.get(base_url, headers=headers, params=params)

    if response.status_code != 200:
        # Invalid subreddit or other error
        return None

    data = response.json()
    if 'data' not in data or 'children' not in data['data']:
        # No articles found
        return None

    articles = data['data']['children']
    if not articles:
        # No more articles to process
        return hot_list

    for article in articles:
        hot_list.append(article['data']['title'])

    # Check if there's a next page
    after = data['data'].get('after')
    if after:
        return recurse(subreddit, hot_list, after)
    else:
        return hot_list
