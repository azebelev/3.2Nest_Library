import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PassportStrategy } from '@nestjs/passport';
import { Request } from 'express';
import { ExtractJwt, Strategy } from 'passport-jwt'
import { UserModel } from '../../entities/user.model';


@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private readonly configService: ConfigService) {
    super({
      jwtFromRequest: ExtractJwt.fromExtractors([
        (request: Request) => {
          return request?.cookies?.Authentication;
        }
      ]),
      ignoreExpiration: true,
      secretOrKey: configService.get('JWT_SECRET')
    });
  }
  validate({ login }: Pick<UserModel, 'login'>) {

    return login;
  }
}