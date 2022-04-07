import { BadRequestException, Body, Controller, Get, Header, Next, Post, Query, Redirect, Req, Res, UnauthorizedException, UseGuards, UseInterceptors } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthDto } from './dto/auth.dto';
import { Response, Request } from 'express'


@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) { }

  @Post('register')
  async register(@Body() dto: AuthDto, @Res() res: Response) {

    const oldUser = await this.authService.findUser(dto.login);
    if (oldUser) {
      throw new BadRequestException('Такой пользователь уже зарегестрирован')
    }
    const newUser = await this.authService.registerUser(dto);

    const nameForRender = (newUser.login == 'admin') ? 'admin' : 'library';

    const jwtToken = await this.authService.login(newUser.login);
    res.cookie('Authentication', jwtToken, {
      httpOnly: true
    })

    res.redirect(`/${nameForRender}`);
  }


  @Post('login')
  async login(@Body() dto: AuthDto, @Req() req: Request, @Res() res: Response) {
    const login = await this.authService.validateUser(dto);
    const jwtToken = await this.authService.login(login);
    res.cookie('Authentication', jwtToken, {
      httpOnly: true
    })
    const nameForRender = (login == 'admin') ? 'admin' : 'library';
    res.redirect(`/${nameForRender}`);
  }

  @Get('logout')
  logout(@Res() res: Response) {
    res.clearCookie('Authentication')
    res.redirect('/')
  }

}
