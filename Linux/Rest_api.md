# What is REST API?
- A **REST API** (**Representational State Transfer Application Programming Interface**) is a set of rules that allows systems to communicate over HTTP, following a stateless, client-server architecture. REST APIs are widely used for building web services that allow different applications to exchange data.

<br>

## Key Concepts
### **Resource:**
---
- REST uses resources, which are typically entities like users, posts, or products, and these resources are represented using `URIs` (**Uniform Resource Identifiers**). For example, a user resource might be accessible at `/users/123`.

<br>

### **HTTP Methods**
---
- REST APIs use standard HTTP methods to perform actions on resources:
  - `GET` - Read (Retrieve a resource)
  - `POST` - Create (Create a new resource)
  - `PUT` - Update (Update an existing resource or create if it doesn't exist)
  - `DELETE` - Delete (Remove a resource)
  - `PATCH` - Partially update a Resource

<br>

### **Statelessness:**
---
- Each request from a client to a server must contain all the information needed to understand and process the request. The server does not store the client's state.

<br>

### **Representation:**
---
- Resources are returned to the client in formats like `JSON` (commonly used) or `XML`, allowing the client to interpret the data.

<br>

### **URL Structure:**
---
- RESTful APIs follow a predictable, hierarchical URL structure:
  - Example: `https://api.example.com/users/123/posts/456`
  - Represents the posts of a specific user, with both the user ID and post ID in the URL.

<br>

### **Stateless Operations:**
---
- Each request is independent; the server doesn’t maintain any client session between calls, ensuring scalability.

<br>

## Example:
### E-commerce API Example:
---
- Suppose you are building an API for an e-commerce platform. The endpoints might look like:
  - `GET /products` – Retrieves a list of all products.
  - `GET /products/101` – Retrieves details for a specific product with ID 101.
  - `POST /products` – Adds a new product to the catalog.
  - `PUT /products/101` – Updates the details of the product with ID 101.
  - `DELETE /products/101` – Deletes the product with ID 101.

- For managing a shopping cart:
  - `GET /cart` – Retrieves the current user's shopping cart.
  - `POST /cart/items` – Adds a product to the user's cart.
  - `PUT /cart/items/101` – Updates the quantity of the product with ID 101 in the cart.
  - `DELETE /cart/items/101` – Removes the product with ID 101 from the cart.

<br>

## REST API Request-Response Cycle
- To understand the components of a REST API request and response, let's break it down with examples for `Operations`, `Headers`, `Endpoint`, `Parameters/Body`, and the Response in `JSON` format.

<br>

### Operations (HTTP Methods)
---
- `Operations` refer to the HTTP methods that define what action is being performed on the resource.
  - **GET** `/users/1` – Retrieves information about user 1.
  - **POST** `/users` – Creates a new user.
  - **PUT** `/users/1` – Updates information for user 1.
  - **DELETE** `/users/1` – Deletes user 1.

<br>

### Header
---
- `Headers` are key-value pairs in an HTTP request or response that provide metadata about the request or response. They help the server understand how to process the request and provide additional information.
```
GET /users/1 HTTP/1.1
Host: api.example.com
Content-Type: application/json
Authorization: Bearer <your-token>
```
- **Content-Type:** Specifies the data format (e.g., JSON, XML).
- **Authorization:** Used to authenticate the request (e.g., API keys, tokens).
- **Host:** Specifies the domain name of the server.
- In this example, the request is asking for user data from `/users/1`, with the expectation that the response will be in JSON format and the request includes an authentication token.

<br>

### Endpoint
---
- An endpoint is the URL where the resource or data can be accessed. It usually includes:
  - Base URL (e.g., `https://api.example.com`)
  - Path (e.g., `/users`)
```
GET https://api.example.com/users/1
```
- The base URL is `https://api.example.com`
- The endpoint is `/users/1`, which is used to access the user with ID 1.

<br>

### Parameters and Body
---
- `Parameters` are used to pass data to the server in a request. They can be passed in the URL (query parameters) or in the request body.
  - **Query Parameters:** Part of the URL that modifies the resource request.
    - Example: `/users?age=30&gender=male`
      - `age=30` and `gender=male` are query parameters.
  - **Path Parameters:** Parameters that are part of the endpoint path.
    - Example: `/users/{id}` where `{id}` is the path parameter.
  - **Request Body:** Data passed in a POST or PUT request to the server to create or update a resource.
```
POST /users HTTP/1.1
Host: api.example.com
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com"
}
```
- The endpoint is `/users`.
- The `body` contains data to create a new user `(name and email)`.

<br>

## Response in JSON
- The server responds to the request with a status code and a body (usually in **JSON** format).
```
{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "createdAt": "2024-09-10T12:34:56Z"
}
```
- **Breakdown:**
  - **Status Code:** `201 Created` (indicates success and that the resource was created).
  - **Response Body:** JSON format, with fields `id`, `name`, `email`, and `createdAt` representing the newly created user.

<br>
<br>

## Full Example: Creating a User
### Request
---
```
POST /users HTTP/1.1
Host: api.example.com
Content-Type: application/json
Authorization: Bearer your-token

{
  "name": "John Doe",
  "email": "john@example.com"
}
```
- **Headers:** Include `Content-Type` (JSON) and `Authorization` (Bearer token).
- **Operation:** POST (creating a new user).
- **Endpoint:** `/users`.
- **Body:** Contains `name` and `email`.

<br>

### Response
---
```
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "createdAt": "2024-09-10T12:34:56Z"
}
```
- **Status:** `201 Created` (indicates success).
- **Response Body:** The created user's data in JSON format, including the `id`, `name`, `email`, and the `createdAt` timestamp.

---

## Summary
- **Headers:** Metadata (e.g., `Content-Type`, `Authorization`) about the request.
- **Operations:** HTTP methods (e.g., `GET`, `POST`, `PUT`, `DELETE`) used to perform actions on resources.
- **Endpoint:** The URL where the API resource can be accessed.
- **Parameters/Body:** Data sent with the request, either in the URL (query parameters) or as part of the request body.
- **Response:** The server's response in JSON format, often containing the result of the operation performed.