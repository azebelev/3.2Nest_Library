import { Request } from 'express';
import { ConfigService } from '@nestjs/config';
import { Injectable } from '@nestjs/common';
import { Pagination } from './interfaces/interfaces.pagination';




@Injectable()
export class PaginationService {
  constructor(private readonly configService: ConfigService) { }

  getPagination(req: Request): Pagination {

    const pagination: Pagination = {
      required: false,
      last_page: false,
      first_page: true,
      offset: 0,
      pageNumber: 1,
      itemsByPage: this.configService.get('BOOKS_BY_PAGE'),
      maxPaginationSize: this.configService.get('MAX_PAGINATION_SIZE'),
      pages: [],
    }

    if (req.query) {
      if (req.query.pageNumber) {
        pagination.offset = +req.query.pageNumber * pagination.itemsByPage - pagination.itemsByPage;
        pagination.pageNumber = +req.query.pageNumber;
        pagination.first_page = (pagination.offset >= pagination.itemsByPage) ? false : true;
      }
    }

    return pagination;
  }

  refresh(availablePages: number, pagination: Pagination) {
    const last_possible_pagination = pagination.pageNumber + (availablePages - 1);

    let first_pagination = pagination.pageNumber - Math.ceil((pagination.maxPaginationSize - 1) / 2);
    if (first_pagination < 1) first_pagination = 1;

    let last_pagination = first_pagination + (pagination.maxPaginationSize - 1);

    if (last_pagination > last_possible_pagination) {
      last_pagination = last_possible_pagination;
      first_pagination = last_pagination - pagination.maxPaginationSize + 1;
      if (first_pagination < 1) first_pagination = 1;
    }
    if (availablePages > 1) {
      pagination.last_page = false
      pagination.required = true;
    }
    if (pagination.pageNumber === last_pagination) pagination.last_page = true;
    pagination.pages = []
    for (let i = first_pagination; i <= last_pagination; i++) {
      if (i !== pagination.pageNumber) {
        pagination.pages.push({ pageNumber: i })
      } else pagination.pages.push({ pageNumber: i, active: true })
    }
    if (pagination.pages.length > 1) pagination.required = true

    return pagination;
  }
}
