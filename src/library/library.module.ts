import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { ServicesModule } from '../services/services.module';
import { LibraryController } from './library.controller';
import { LibraryService } from './library.service';

@Module({
  imports: [
    ConfigModule,
    ServicesModule
  ],
  controllers: [LibraryController],
  providers: [LibraryService]
})
export class LibraryModule { }
