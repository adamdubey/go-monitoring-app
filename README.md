# Go-Monitoring-App

## Quick Start

- A [Pusher](https://pusher.com/) account, or alternative solution such as [ipê](https://github.com/dimiro1/ipe) is required. _See [QRH](##QRH) for additional details._

_via `run.sh`:_
```sh
# start docker container services
docker-compose up -d

# start ipe service
cd ipe && ./ipe

# start client app
./run.sh
# in browser, visit localhost:4000
```

---

## QRH

- Compile IPE: _(Performed on new installation/first-time setup)_
```sh
# build IPE binary
git clone https://github.com/dimiro1/ipe.git
cd ipe/cmd
go build -o ipe
```

- Cold Start: _(Performed on new installation/first-time setup)_
```sh
# start docker container services
docker-compose up -d

# execute database migrations
soda migrate

# start ipe service
cd ipe && ./ipe

# start client app
./run.sh
# in browser, visit localhost:4000
```

- Accessing MailHog:
```sh
# start docker container services
docker-compose up -d

# in browser, visit localhost:8025
```

---

## Technologies & Frameworks

- [Bootstrap 5](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
- [Chi](https://github.com/go-chi/chi)
- [Cron](https://github.com/robfig/cron/v3)
- [Docker](https://www.docker.com/)
- [Go](https://go.dev/)
- [Gorilla](https://github.com/gorilla/css)
- [Go-FastPing](https://github.com/tatsushid/go-fastping)
- [HTML2Text](https://jaytaylor.com/html2text)
- [IPE](https://github.com/dimiro1/ipe)
- [Jet](https://github.com/CloudyKit/jet/v6)
- [MailHog](https://github.com/mailhog/MailHog)
- [PGX](https://github.com/jackc/pgx/v4 )
- [PostgreSQL](https://www.postgresql.org/)
- [Pusher](https://github.com/pusher/pusher-http-go)
- [Soda](https://gobuffalo.io/documentation/database/fizz/)
- [Terraform](https://www.terraform.io/)
- [Twilio](https://www.twilio.com/)
