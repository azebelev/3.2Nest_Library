export interface Page {
  pageNumber?: number | undefined,
  active?: boolean | undefined
}

export interface Pagination {
  required: boolean;
  last_page: boolean;
  first_page: boolean;
  offset: number;
  pageNumber: number;
  itemsByPage: number;
  maxPaginationSize: number;
  pages: Array<Page>;
}