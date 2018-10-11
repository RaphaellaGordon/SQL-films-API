process.env.NODE_ENV = 'test';
const app = require('../app');
const request = require('supertest')(app);
const { expect } = require('chai');

describe('/api', () => {
  describe('/actresses', () => {
    it('GET returns an array of actress objects and 200 status code', () => {
      return request.get('/api/actresses')
      .expect(200)
      .then(res => {
        expect(res.body.actresses).to.be.an('array')
        expect(res.body.actresses).to.have.lengthOf(3)
        expect(res.body.actresses[0].actress_id).to.equal(1)
        expect(res.body.actresses[0].actress_name).to.equal('Julia Roberts')
      })
    })
    it('POST adds a new actress and sends a 201 status code', () => {
      return request.post('/api/actresses/')
      .send({name: 'Emma Watson', img_url: 'https://m.media-amazon.com/images/M/MV5BMTQ3ODE2NTMxMV5BMl5BanBnXkFtZTgwOTIzOTQzMjE@._V1_UY317_CR21,0,214,317_AL_.jpg'})
      .expect(201)
      .then(res => {
        expect(res.body.actress).to.be.an('object')
        expect(res.body.actress.actress_name).to.equal('Emma Watson')
        expect(res.body.actress.img_url).to.equal('https://m.media-amazon.com/images/M/MV5BMTQ3ODE2NTMxMV5BMl5BanBnXkFtZTgwOTIzOTQzMjE@._V1_UY317_CR21,0,214,317_AL_.jpg')
      })
    })
    it('POST ERROR returns error message and 400 status code' ,() => {
      return request.post('/api/actresses/')
      .send({name: 'em', img_url: 'https://m.media-amazon.com/images/M/MV5BMTQ3ODE2NTMxMV5BMl5BanBnXkFtZTgwOTIzOTQzMjE@._V1_UY317_CR21,0,214,317_AL_.jpg'})
      .expect(400)
      .then(res => {
        expect(res.body).to.be.an('object')
        expect(res.body.msg).to.equal('Bad request')
      })
    })
    describe('/actress', () => {
      it('GET returns an object of requested actress and 200 status code' , () => {
        return request.get('/api/actresses/Julia Roberts')
        .expect(200)
        .then(res => {
          expect(res.body.actress).to.be.an('object')
          expect(res.body.actress.actress_name).be.equal('Julia Roberts')
          expect(res.body.actress.img_url).be.equal('https://m.media-amazon.com/images/M/MV5BMTQzNjU3MDczN15BMl5BanBnXkFtZTYwNzY2Njc4._V1_.jpg')
        })
      })
      it('GET ERROR returns error message and 400 status code', () => {
        return request.get('/api/actresses/5')
        .expect(400)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.equal('Bad request')
        })
      })
      it('GET ERROR returns error message and 404 status code', () => {
        return request.get('/api/actresses/abcdef')
        .expect(404)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.equal('Not found')
        })
      })
      describe('/films', () => {
        it('GET returns an array of objects of films for requested actress and 200 status code', () => {
          return request.get('/api/actresses/Julia Roberts/films')
          .expect(200)
          .then(res => {
            expect(res.body.films).to.be.an('array')
            expect(res.body.films[0].lead_actress_id).to.equal(1)
            expect(res.body.films[0].film_year).to.equal(2000)
          })
        })
        it('GET ERROR returns error message and 400 status code', () => {
          return request.get('/api/actresses/5/films')
          .expect(400)
          .then(res => {
            expect(res.body).to.be.an('object')
            expect(res.body.msg).to.equal('Bad request')
          })
        })
        it('GET ERROR returns error message and 404 status code', () => {
          return request.get('/api/actresses/abcdef/films')
          .expect(404)
          .then(res => {
            expect(res.body).to.be.an('object')
            expect(res.body.msg).to.equal('Not found')
          })
        })
      })
    })
  })
  describe('/genres', () => {
    it('GET returns an array of genre objects and 200 status code', () => {
      return request.get('/api/genres')
      .expect(200)
      .then(res => {
        expect(res.body.genres).to.be.an('array')
        expect(res.body.genres).to.have.lengthOf(7)
        expect(res.body.genres[0].genre_name).be.equal('Animation')
      })
    })
    it('POST adds a new genre and sends a 201 status code', () => {
      return request.post('/api/genres')
      .send({genre: 'Action'})
      .expect(201)
      .then(res => {
        expect(res.body.genre).to.be.an('object')
        expect(res.body.genre.genre_name).to.equal('Action')
      })
    })
    it('POST ERROR returns error message and 400 status code', () => {
      return request.post('/api/genres')
      .send({genre: 'a'})
      .expect(400)
      .then(res => {
        expect(res.body).to.be.an('object')
        expect(res.body.msg).to.equal('Bad request')
      })
    })
    describe('/:genre', () => {
      it('GET returns an object of requested genre and 200 status code', () => {
        return request.get('/api/genres/Animation')
        .expect(200)
        .then(res => {
          expect(res.body.genre).to.be.an('object')
          expect(res.body.genre.genre_name).be.equal('Animation')
        })
      })
      it('GET ERROR returns error message and 400 status code', () => {
        return request.get('/api/genres/5')
        .expect(400)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.equal('Bad request')
        })
      })
      it('GET ERROR returns error message and 404 status code', () => {
        return request.get('/api/genres/abcdef')
        .expect(404)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.equal('Not found')
        })
      })
      describe('/films', () => {
        it('GET returns an array of objects of films for requested genre', () => {
          return request.get(`/api/genres/Biography/films`)
          .expect(200)
          .then(res => {
            expect(res.body.films).to.be.an('array')
            expect(res.body.films[0].genre_id).to.equal(2)
            expect(res.body.films[0].genre_name).to.equal('Biography')
          })
        })
        it('GET ERROR returns error message and 400 status code', () => {
          return request.get('/api/genres/5/films')
          .expect(400)
          .then(res => {
            expect(res.body).to.be.an('object')
            expect(res.body.msg).to.equal('Bad request')
          })
        })
        it('GET ERROR returns error message and 404 status code', () => {
          return request.get('/api/genres/abcdef/films')
          .expect(404)
          .then(res => {
            expect(res.body).to.be.an('object')
            expect(res.body.msg).to.equal('Not found')
          })
        })
      })
    })
  })
  describe('/films', () => {
    it('GET returns an array of film objects and 200 status code', () => {
      return request.get('/api/films')
      .expect(200)
      .then(res => {
        expect(res.body.films).to.be.an('array')
        expect(res.body.films).to.have.lengthOf(3)
        expect(res.body.films[0].film_id).to.be.equal(1)
      })
    })
    it('POST adds a new film and sends a 201 status code', () => {
      return request.post('/api/films')
      .send({
        name: "Freedom Writers",
        year: 2007,
        poster_url: "https://m.media-amazon.com/images/M/MV5BMTIxMzExNTgxMV5BMl5BanBnXkFtZTcwNDUxODM0MQ@@._V1_UX182_CR0,0,182,268_AL_.jpg",
        genre: "Biography",
        lead_character: "Erin Gruwell",
        lead_character_img_url: "https://m.media-amazon.com/images/M/MV5BMTcwNjgxNDYyOV5BMl5BanBnXkFtZTYwMjYyMzM3._V1_.jpg",
        quote: " I can see you. And you are not failing.",
        lead_actress: "Hilary Swank"
      })
      .expect(201)
      .then(res => {
        expect(res.body.film).is.an('object')
        expect(res.body.film.film_name).to.equal('Freedom Writers')
        expect(res.body.film.film_id).to.equal(4)
      })
    })
    it('POST ERROR returns error message and 400 status code', () => {
      return request.post('/api/films')
      .send ({
        // name: "Freedom Writers",
        year: 2007,
        poster_url: "https://m.media-amazon.com/images/M/MV5BMTIxMzExNTgxMV5BMl5BanBnXkFtZTcwNDUxODM0MQ@@._V1_UX182_CR0,0,182,268_AL_.jpg",
        genre: "Biography",
        lead_character: "Erin Gruwell",
        lead_character_img_url: "https://m.media-amazon.com/images/M/MV5BMTcwNjgxNDYyOV5BMl5BanBnXkFtZTYwMjYyMzM3._V1_.jpg",
        quote: " I can see you. And you are not failing.",
        lead_actress: "Hilary Swank"
      })
      .expect(400)
      .then(res => {
        expect(res.body).to.be.an('object')
        expect(res.body.msg).to.equal('null value in column "film_name" violates not-null constraint')
      })
    })
    describe('/:film', () => {
      it('GET returns an object of requested genre and 200 status code', () => {
        return request.get(`/api/films/Conviction`)
        .expect(200)
        .then(res => {
          expect(res.body.film).to.be.an('object')
          expect(res.body.film.film_name).to.be.equal('Conviction')
          expect(res.body.film.lead_character).to.be.equal('Betty Anne Waters')
        })
      })
      it('GET ERROR returns error message and 400 status code', () => {
        return request.get('/api/films/{}')
        .expect(400)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.equal('Bad request')
        })
      })
      it('GET ERROR returns error message and 404 status code', () => {
        return request.get('/api/films/abcdef')
        .expect(404)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.equal('Not found')
        })
      })
      it('PATCH returns the updated vote count increased by 1 for requested film and 200 status code', () => {
        return request.patch(`/api/films/Conviction?vote=up`)
        .expect(200)
        .then(res => {
          expect(res.body.film).to.be.an('object')
          expect(res.body.film.film_name).to.equal('Conviction')
          expect(res.body.film.votes).to.equal(1)
        })
      })
      it('PATCH returns the updated vote count decreased by 1 for requested film and 200 status code', () => {
        return request.patch(`/api/films/Conviction?vote=down`)
        .expect(200)
        .then(res => {
          expect(res.body.film).to.be.an('object')
          expect(res.body.film.film_name).to.equal('Conviction')
          expect(res.body.film.votes).to.equal(0)
        })
      })
      it('PATCH ERROR returns error message when vote query is invalid and status code 400', () => {
        return request.patch(`/api/films/Conviction?vote=1`)
        .expect(400)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.be.equal('Bad request')
        })
      })
      it('PATCH ERROR returns error message when film name is invalid and status code 400', () => {
        return request.patch('/api/films/{}?vote=up')
        .expect(400)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.be.equal('Bad request')
        })
      })
      it('PATCH ERROR returns error message when film name is not found and status code 404', () => {
        return request.patch('/api/films/abcdef?vote=up')
        .expect(404)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.be.equal('Not found')
        })
      })
      it('DELETE removes requested film, return confirmation and 200 status code', () => {
        return request.delete('/api/films/Conviction')
        .expect(200)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.equal('film has been deleted')
        })
      })
      it('DELETE ERROR returns error message and 404 status code', () => {
        return request.delete(`/api/films/Julia Roberts`)
        .expect(404)
        .then(res => {
          expect(res.body).to.be.an('object')
          expect(res.body.msg).to.equal('Not found')
        })
      })
      describe('/actress', () => {
        it('GET return an object of requested actress and 200 status code', () => {
          return request.get('/api/films/Zero Dark Thirty/actress')
          .expect(200)
          .then(res => {
            expect(res.body.actress).to.be.an('object')
            expect(res.body.actress.actress_name).to.equal('Jessica Chastain')
          })
        })
        it('GET ERROR returns error message and 400 status code', () => {
          return request.get('/api/films/{}/actress')
          .expect(400)
          .then(res => {
            expect(res.body).to.be.an('object')
            expect(res.body.msg).to.equal('Bad request')
          })
        })
        it('GET ERROR returns error message and 404 status code', () => {
          return request.get('/api/films/abcdef/actress')
          .expect(404)
          .then(res => {
            expect(res.body).to.be.an('object')
            expect(res.body.msg).to.equal('Not found')
          })
        })
      })
    })
  })
})