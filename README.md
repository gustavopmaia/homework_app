
# Homework 

A place you to share your doubts and then get answered


## API Reference

### User

#### Register User

```http
  POST /api/users
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `Username` | `string` | **Required**. Username of user|
| `Email` | `string` | **Required**. Email of user|
| `Password` | `string` | **Required**. Password of user|

#### Get user

```http
  GET /api/users/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. ID of the user|
| `Bearer token`      | `string` | **Required**. Token of authenticated user|

#### Get users

```http
  GET /api/users
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Bearer token`      | `string` | **Required**. Token of authenticated user|

#### Update user

```https
  GET /api/users/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Bearer token`      | `string` | **Required**. Token of authenticated user (Needs to be the same of the updated user)|
| `Username`      | `string` | **Not Required**. Username to update|
| `Email`      | `string` | **Not Required**. Email to update|
| `Password`      | `string` | **Not Required**. Password to update|

#### Delete user

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. ID of the user|
| `Bearer token`      | `string` | **Required**. Token of authenticated user|

### Questions

#### Register Question

```http
  POST /api/questions
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `Content` | `string` | **Required**. Content of the question|
| `User ID` | `string` | **Required**. Id of the user is adding the question|
| `Bearer token`      | `string` | **Required**. Token of authenticated user|

#### Get Question

```http
  GET /api/questions/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. ID of the question|
| `Bearer token`      | `string` | **Required**. Token of authenticated user|

#### Get questions

```http
  GET /api/questions
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Bearer token`      | `string` | **Required**. Token of authenticated user|

#### Update question

```https
  GET /api/users/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Bearer token`      | `string` | **Required**. Token of authenticated user (Needs to be the same of the updated user)|
| `Content`      | `string` | **Not Required**. Content to update|

#### Delete question

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. ID of the question to delete|
| `Bearer token`      | `string` | **Required**. Token of authenticated user|

### Answers

#### Register answer

```http
  POST /api/answers
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `Content` | `string` | **Required**. Content of the question|
| `User ID` | `string` | **Required**. Id of the user is adding the answer|
| `Question ID` | `string` | **Required**. Id of the question that is being answered`|
| `Bearer token`      | `string` | **Required**. Token of authenticated user|

#### Get answer

```http
  GET /api/asnwers/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. ID of the question|
| `Bearer token`      | `string` | **Required**. Token of authenticated user|

#### Get answers

```http
  GET /api/answers
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Bearer token`      | `string` | **Required**. Token of authenticated user|

#### Update answer

```https
  GET /api/answers/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Bearer token`      | `string` | **Required**. Token of authenticated user (Needs to be the same of the updated user)|
| `Content`      | `string` | **Not Required**. Content to update|

#### Delete answer

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. ID of the answer to delete|
| `Bearer token`      | `string` | **Required**. Token of authenticated user|4

## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`SECRET_KEY_BASE`

`SECRET_KEY`

`DB_PASSWORD`

  
## Run Locally

Clone the project

```bash
  git clone https://github.com/gustavopmaia/homework_app
```

Go to the project directory

```bash
  cd homework_app
```

Install dependencies

```bash
  mix deps.get
```

Start the server

```bash
  source .env
  mix phx.server
```

  