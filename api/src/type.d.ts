export interface Data {
    props: Props;
    page: string;
    query: Query;
    buildId: string;
    isFallback: boolean;
    gsp: boolean;
    scriptLoader: unknown[];
}
  
export interface Props {
    pageProps: PageProps;
    __N_SSG: boolean;
}
  
export interface PageProps {
    date: Date;
    stories: Story[];
    subject: string;
}
  
export interface Story {
    id: number;
    url: string;
    title: string;
    tldr: string;
    date: Date;
    category: string;
    newsletter: string;
}
  
export interface Query {
    date: Date;
}
