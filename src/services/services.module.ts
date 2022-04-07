import { Global, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserModel } from '../entities/user.model';
import { BooksModel } from '../entities/books.model';
import { AuthorsModel } from '../entities/authors.model';
import { BooksAuthorsModel } from '../entities/books_authors.model';
import { BooksService } from './books.service';
import { PaginationService } from './pagination.service';
import { Connection } from 'typeorm';
import { ConfigModule } from '@nestjs/config';
//import { TaskService } from './task.service';
import { ScheduleModule } from '@nestjs/schedule';
import { TaskService } from './task.service';


@Module({
  imports: [TypeOrmModule.forFeature([UserModel, BooksModel, AuthorsModel, BooksAuthorsModel]),
    ConfigModule,
  ScheduleModule.forRoot()
  ],
  providers: [BooksService, PaginationService],
  exports: [BooksService, PaginationService]
})
export class ServicesModule {
  constructor(connection: Connection) { }
}
