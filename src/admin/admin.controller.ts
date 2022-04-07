import { Body, Controller, Delete, Get, Headers, Inject, Patch, Post, Query, Req, Res, UseGuards } from '@nestjs/common';
import { Request, Response } from 'express'
import { AdminService } from './admin.service';
import { JwtAuthGuard } from '../auth/guards/jwt.guard';
import { CreateBookDto } from './dto/create-book.dto';
import { PaginationService } from '../services/pagination.service';
import { Pagination } from '../services/interfaces/interfaces.pagination';


@Controller('admin')
export class AdminController {
  constructor(private readonly adminService: AdminService,
    private readonly paginationService: PaginationService) { }


  @UseGuards(JwtAuthGuard)
  @Get('/')
  async getAdminPage(@Req() req: Request, @Res() res: Response) {

    let pagination: Pagination = this.paginationService.getPagination(req);

    const availablePages = await this.adminService.lookupAfterPagination(pagination);

    pagination = this.paginationService.refresh(availablePages, pagination);

    const books = await this.adminService.getBooks(pagination.offset, pagination.itemsByPage);

    res.render('admin', {
      title: 'Admin',
      books,
      pagination
    })
  }

  @UseGuards(JwtAuthGuard)
  @Post('/addBook')
  async addBook(@Body() dto: CreateBookDto, @Res() res: Response) {
    await this.adminService.saveNewBook(dto)
    res.redirect('/admin')
  }

  @UseGuards(JwtAuthGuard)
  @Post('/changeStatus')
  async changeStatus(@Req() req: Request, @Res() res: Response) {
    if (req.body.id && req.body.pageNumber) {
      const result = await this.adminService.changeStatus(req.body.id)

      if (result) res.redirect(`/admin/?pageNumber=${req.body.pageNumber}`)
    } else res.redirect('/admin')
  }

  @UseGuards(JwtAuthGuard)
  @Post('/search')
  async search(@Body('searchParam') searchParam: string, @Res() res: Response) {
    if (searchParam.trim() !== '') {
      const books = await this.adminService.search(searchParam);

      const search = { searchParam }
      res.render('admin', {
        title: 'admin',
        search,
        books
      })
    } else res.redirect('/admin')
  }
}
