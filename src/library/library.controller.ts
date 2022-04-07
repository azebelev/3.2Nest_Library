import { Body, Controller, Get, Param, Post, Req, Res, UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from '../auth/guards/jwt.guard';
import { Pagination } from '../services/interfaces/interfaces.pagination';
import { PaginationService } from '../services/pagination.service';
import { LibraryService } from './library.service';
import { Request, Response } from 'express'

@Controller('library')
export class LibraryController {
  constructor(private readonly libraryService: LibraryService,
    private readonly paginationService: PaginationService) { }


  @UseGuards(JwtAuthGuard)
  @Get('/')
  async getLibraryPage(@Req() req: Request, @Res() res: Response) {

    let pagination: Pagination = this.paginationService.getPagination(req);
    const availablePages = await this.libraryService.lookupAfterPagination(pagination);

    pagination = this.paginationService.refresh(availablePages, pagination);

    const books = await this.libraryService.getBooks(pagination.offset, pagination.itemsByPage);

    res.render('books', {
      title: 'Library',
      books,
      pagination
    })
  }



  @UseGuards(JwtAuthGuard)
  @Get('/:id')
  async getBook(@Param('id') id: number, @Res() res: Response) {
    await this.libraryService.incrementValue(id, 'visits');

    const book = await this.libraryService.getOneBook(id);

    if (!book) res.redirect('/library');

    res.render('book', {
      book,
      visitsCounter: book.visits,
    })
  }


  @UseGuards(JwtAuthGuard)
  @Post('/search')
  async search(@Body('searchParam') searchParam: string, @Res() res: Response) {

    if (searchParam.trim() !== '') {
      const books = await this.libraryService.search(searchParam);

      const search = { searchParam }
      res.render('admin', {
        title: 'admin',
        search,
        books
      });
    } else res.redirect('/library');
  }


  @UseGuards(JwtAuthGuard)
  @Post('/clickCounter')
  countReadings(@Body('id') id: number, @Res() res: Response) {

    this.libraryService.incrementValue(id, 'clicks');
    res.status(200).end();
  }

}
