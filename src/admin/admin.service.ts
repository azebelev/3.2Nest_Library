import { Inject, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { CreateBookDto } from './dto/create-book.dto';
import { BooksService } from '../services/books.service';
import { Pagination } from '../services/interfaces/interfaces.pagination';

@Injectable()
export class AdminService {
  constructor(private readonly booksService: BooksService) { }

  async saveNewBook(dto: CreateBookDto) {
    return await this.booksService.addNewBook(dto);
  }

  async getBooks(offset: number, limit: number) {
    return await this.booksService.getBooks(offset, limit);
  }

  async lookupAfterPagination({ maxPaginationSize, offset, itemsByPage }: Partial<Pagination>) {
    const availableBooks = await this.booksService.lookup(offset, itemsByPage * maxPaginationSize + 1);
    const availablePages = Math.ceil(availableBooks / itemsByPage);

    return availablePages;
  }

  async changeStatus(id: number) {
    return await this.booksService.changeStatus(id);
  }

  async search(searchParam: string) {
    searchParam = searchParam.trim();
    if (searchParam == '') return;

    return await this.booksService.search(searchParam);
  }
}
