import { Module } from '@nestjs/common';
import { JwtStrategy } from '../auth/strategies/jwt.strategy';
import { AdminController } from './admin.controller';
import { AdminService } from './admin.service';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { JwtModule } from '@nestjs/jwt';
import { getJWTConfig } from 'src/configs/jwt.config';
import { BooksService } from '../services/books.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthorsModel } from '../entities/authors.model';
import { BooksModel } from '../entities/books.model';
import { BooksAuthorsModel } from 'src/entities/books_authors.model';
import { UserModel } from '../entities/user.model';
import { ServicesModule } from '../services/services.module';

@Module({
  imports: [
    ConfigModule,
    ServicesModule
  ],
  controllers: [AdminController],
  providers: [AdminService]
})
export class AdminModule { }
