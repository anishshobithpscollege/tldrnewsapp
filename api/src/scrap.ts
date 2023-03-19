import * as cheerio from 'cheerio';
import { fetch } from 'undici';
import { Data, Story } from './type.js';

/**
 * Scrap the tldr.tech website
 * @class Scrap
 * @version 1.0.0
 * @example
 * const scrap = new Scrap();
 * // default page is tech
 * const stories = await scrap.latest();
 * console.log(stories);
 * @example
 * const scrap = new Scrap();
 * const stories = await scrap.latest('ai');
 * console.log(stories);
 * @example
 * const scrap = new Scrap();
 * const stories = await scrap.latest('crypto');
 * console.log(stories);
 */
export class Scrap {
    /**
     * The base url to the scrap
     * @type {string}
     * @memberof Scrap
     */
    public BASE_URL: string = "https://tldr.tech/api/latest/";


    /**
     * The page of the scrap
     * @type {string}
     * @default https://tldr.tech/api/latest/tech
     * @memberof Scrap
     */
    public page: string;

    /**
     * Creates an instance of Scrap.
     * @param route The route to the scrap
     */
    public constructor(page: Page = 'tech') {
        this.page = this.BASE_URL.concat(page);
    }

    /**
     * Get the latest stories
     * @memberof Scrap
     * @returns {Promise<Story[]>} The latest stories
     */
    public async latest(page: Page = 'tech'): Promise<Story[]> {
        const data = await this.scrap(page);
        const rawStories = data.props.pageProps.stories;
        const stories: Story[] = [];
        for (const story of rawStories) {
            stories.push({
                id: story.id,
                url: story.url,
                title: story.title,
                tldr: this.cleanText(story.tldr),
                date: story.date,
                category: story.category,
                newsletter: story.newsletter
            } satisfies Story);
        }
        return stories;
    }

    /**
     * Scrap the page
     * @private
     * @memberof Scrap
     * @returns {Promise<Data>} The data of the scrap
     */
    private async scrap(page: Page): Promise<Data> {
        this.page = this.BASE_URL.concat(page);
        const response = await fetch(this.page);
        const text = await response.text();
        const $ = cheerio.load(text);
        const script = $('script[type="application/json"]').html();
        return JSON.parse(script!) as Data;
    }

    /**
     * Clean the text
     * @param text The text to clean
     * @returns {string} The cleaned text
     */
    private cleanText(text: string): string {
        return text.replace(/<\/?[^>]+(>|$)/g, "");
    }
    
}

export type Page = 'tech' | 'ai' | 'crypto';
