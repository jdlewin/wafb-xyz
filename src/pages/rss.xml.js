import rss from '@astrojs/rss';
import { getCollection } from 'astro:content';

export async function GET(context) {
  const essays = (await getCollection('essays', ({ data }) => data.publish === true))
    .sort((a, b) => +new Date(b.data.date) - +new Date(a.data.date));
  return rss({
    title: 'wafb.xyz',
    description: 'essays',
    site: context.site ?? 'https://wafb.xyz',
    items: essays.map((e) => ({
      title: e.data.title,
      description: e.data.description ?? e.data.pullquote ?? '',
      pubDate: new Date(e.data.date),
      link: `/essays/${e.slug}/`,
    })),
  });
}
