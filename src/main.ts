import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { join } from 'path';
import { AppModule } from './app.module';
import * as express from 'express'
import * as hbs from 'express-handlebars'
import * as cookieParser from 'cookie-parser';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);


  app.use(express.urlencoded({ extended: false }));
  app.use(cookieParser())
  app.useStaticAssets(join(__dirname, '..', 'public'));



  app.setBaseViewsDir(join(__dirname, '..', 'views'));

  app.engine('hbs',
    hbs.create({
      extname: 'hbs',
      defaultLayout: 'main',
      layoutsDir: join(__dirname, '..', 'views', 'layouts'),
      partialsDir: join(__dirname, '..', 'views', 'partials'),
      helpers: {
        increment: (pageNumber) => ++pageNumber,
        decrement: (pageNumber) => --pageNumber
      }
    }).engine,
  );
  app.setViewEngine('hbs');




  await app.listen(3000);
}
bootstrap();

