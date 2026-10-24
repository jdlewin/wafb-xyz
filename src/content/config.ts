import { defineCollection, z } from 'astro:content';

const essays = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.string(),
    publish: z.boolean(),
    pullquote: z.string().optional(),
    description: z.string().optional(),
  }),
});

export const collections = { essays };
