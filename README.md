# Starting the app

```
# start apps on docker
cp .env.template .env
docker-compose up backend worker db redis

# start frontend localy *because it's too slow on docker
cd frontend
cp .env.template .env
yarn install
yarn dev
```

# Database creation

```
docker-compose exec backend bundle exec rake db:create
```

# Database initialization

```
# create tables
docker-compose exec backend bundle exec ridgepole --apply --file db/Schemafile --config config/database.yml --allow-pk-change

# create seed data
docker-compose exec backend bundle exec rake db:seed_fu

# create customer tier data
# customer tier data needs to be created thruogh worker because it's suppose to be created once a year by the scheduled job.

docker-compose exec backend bundle exec rails runner 'CustomerTierWorker.perform_async'
```

# How to access the web page

```
open http://localhost:3000/
# or open manually with browser
```

# How to run the test suite

```
docker-compose exec backend bundle exec rspec
```
