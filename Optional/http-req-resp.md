# HTTP request/response 

### HTTP Request:
- **Client Initiates**: A request is initiated by a client, which could be a web browser, a mobile app, or any other software accessing a web server.
- **Components**:
  - **Method**: Specifies the action to be performed by the server. Common methods include GET (retrieve a resource), POST (submit data to be processed), PUT (update a resource), DELETE (remove a resource), etc.
  - **URL**: Identifies the resource being requested.
  - **Headers**: Provide additional information about the request, such as the type of data being sent, supported encoding, cookies, etc.
  - **Body (Optional)**: Contains data sent by the client, such as form inputs or JSON payloads. Not all requests have a body.

### HTTP Response:
- **Server Responds**: After receiving a request, the server processes it and sends back a response to the client.
- **Components**:
  - **Status Code**: Indicates the outcome of the request. Status codes are grouped into categories such as informational (1xx), success (2xx), redirection (3xx), client errors (4xx), and server errors (5xx).
  - **Headers**: Provide metadata about the response, such as content type, content length, cache directives, etc.
  - **Body (Optional)**: Contains the actual content of the response, such as HTML for a web page, JSON data, images, etc. Not all responses have a body.

### Example http reqest as curl command
```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"username": "john", "password": "secret"}' \
  http://example.com/login
```

  - **-X POST**: Specifies that the request method is POST.
  - **-H "Content-Type**: application/json": Sets the Content-Type header to indicate that the request body is in JSON format.
  - **-d '{"username": "john", "password": "secret"}'**: Specifies the data to be sent in the request body.
  - **http://example.com/login**: Specifies the URL of the server endpoint to which the request will be sent.
  - This **curl** command sends a POST request to http://example.com/login with JSON data containing a username and password. You can adjust the method, headers, data, and URL according to your specific use case.

  ---
  ## Workshop 

Build a sample application 

 ```bash
  cd ../workshop/lab01/
  docker build -t lab-01 .
 ```

 run a new container

  ```bash
   docker run -d -p 3000:3000 --name sample-app-01
  ```

Test call application as curl command

```bash
  curl -i -X GET localhost:3000/getdata
```

```bash
  curl -i -X POST localhost:3000/getdata -H 'Cotent-type: application/json' -d '{"name": "nukoolmu", "email": "nukoolmu
  @ais.co.th" }'
```