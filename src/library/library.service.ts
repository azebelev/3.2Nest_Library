import { Injectable } from '@nestjs/common';
import { BooksService } from '../services/books.service';
import { Pagination } from '../services/interfaces/interfaces.pagination';


@Injectable()
export class LibraryService {
  constructor(private readonly booksService: BooksService) { }

  async getOneBook(id: number) {
    return await this.booksService.findOne(id);
  }


  async incrementValue(id: number, columnName: string) {

    return await this.booksService.incrementValue(id, columnName);
  }


  async getBooks(offset: number, limit: number) {
    return await this.booksService.getBooks(offset, limit);
  }


  async lookupAfterPagination({ maxPaginationSize, offset, itemsByPage }: Partial<Pagination>) {
    const availableBooks = await this.booksService.lookup(offset, itemsByPage * maxPaginationSize + 1);
    const availablePages = Math.ceil(availableBooks / itemsByPage);

    return availablePages;
  }


  async search(searchParam: string) {
    searchParam = searchParam.trim();
    if (searchParam == '') return;

    return await this.booksService.search(searchParam);
  }
}


