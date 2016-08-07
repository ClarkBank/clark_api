## Clark API

* Rails API for Clark Bank Application
* Rails 5 API with minimal [dependencies](https://github.com/rafaeljesus/bank_ror/blob/master/config/application.rb#L4) and [middlewares](https://github.com/rafaeljesus/bank_ror/blob/master/config/application.rb#L25)
* A [minimal](https://hub.docker.com/r/rafaeljesus/bank_ror/tags/) docker alpine container
* Automatically pushes it to dockerhub if tests pass

## Installation
```bash
git clone https://github.com/ClarkBank/clark_api.git
cd clark_api
bundle
rails s
```

## API
### Create User
```bash
curl -H 'Content-Type: application/json' -d '{"email": "test@mail.com", "password": "12345678"}' -X POST 'http://localhost:9292/users'
```

### Open a new Bank Account
```bash
curl -H 'Content-Type: application/json' -d '{"name": "City Bank", "user_id": 1}' -H "Authorization: Bearer <ACCESS_TOKEN>" -X POST 'http://localhost:9292/accounts'
```

### Deposit into Account
```bash
curl -H 'Content-Type: application/json' -d '{"amount": 9.99}' -H "Authorization: Bearer <ACCESS_TOKEN>" -X POST 'http://localhost:9292/accounts/123456/deposit'
```

### Withdraw from Account
```bash
curl -H 'Content-Type: application/json' -d '{"amount": 9.99}' -H "Authorization: Bearer <ACCESS_TOKEN>" -X POST 'http://localhost:9292/accounts/123456/withdraw'
```

### Transfer from one Account to Another account
```bash
curl -H 'Content-Type: application/json' -d '{"recipient_id": "654321", "amount": 9.99}' -H "Authorization: Bearer <ACCESS_TOKEN>" -X POST 'http://localhost:9292/accounts/123456/transfer'
```

## Docker
This repository has automated image builds on hub.docker.com after successfully building and testing. See the `deployment` section of [circle.yml](circle.yml) for details on how this is done. Note that three environment variables need to be set on CircleCI for the deployment to work:

  * DOCKER_EMAIL - The email address associated with the user with push access to the Docker Hub repository
  * DOCKER_USER - Docker Hub username
  * DOCKER_PASS - Docker Hub password (these are all stored encrypted on CircleCI, and you can create a deployment user with limited permission on Docker Hub if you like)

## Contributing
- Fork it
- Create your feature branch (`git checkout -b my-new-feature`)
- Commit your changes (`git commit -am 'Add some feature'`)
- Push to the branch (`git push origin my-new-feature`)
- Create new Pull Request

## Badges

[![CircleCI](https://circleci.com/gh/rafaeljesus/bank_ror.svg?style=svg)](https://circleci.com/gh/rafaeljesus/bank_ror)
[![Code Climate](https://codeclimate.com/github/rafaeljesus/bank_ror/badges/gpa.svg)](https://codeclimate.com/github/rafaeljesus/bank_ror)
[![Test Coverage](https://codeclimate.com/github/rafaeljesus/bank_ror/badges/coverage.svg)](https://codeclimate.com/github/rafaeljesus/bank_ror/coverage)
[![Issue Count](https://codeclimate.com/github/rafaeljesus/bank_ror/badges/issue_count.svg)](https://codeclimate.com/github/rafaeljesus/bank_ror)

---

> GitHub [@rafaeljesus](https://github.com/rafaeljesus) &nbsp;&middot;&nbsp;
> Twitter [@rafaeljesus](https://twitter.com/_jesus_rafael)
