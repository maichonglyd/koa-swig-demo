/**
 * @copyright Maichong Software Ltd. 2017 http://maichong.it
 * @date 2017-05-26
 * @author Li <li@maichong.it>
 */

'use strict';

let Koa = require('koa');
let convert = require('koa-convert');
let serve = require('koa-static');
let Router = require('koa-router');
let swig = require('swig');
let fs = require('fs');

let data = [];
let app = new Koa();
let router = new Router();
app.use(convert(serve(__dirname + '/public')));

router.get('/', async function (ctx) {
  let filename = __dirname + '/view/index.swig';
  let html = await swig.compile(fs.readFileSync(filename, 'utf8'));
  ctx.body = html({ list: data });
});

router.get('/plus', async function (ctx) {
  let title = ctx.query.title;
  if (title) {
    data.unshift(title.toString());
  }
  ctx.redirect('/');
});
router.get('/remove', async function (ctx) {
  let title = ctx.query.title;
  for (let i = 0; i < data.length; i += 1) {
    if (data[i] === title) {
      data.splice(i, 1);
      break;
    }
  }
  ctx.redirect('/')
});
app.use(router.routes()).use(router.allowedMethods());

app.listen(5000);
console.log('start');