fetch('http://localhost:58088/resources/test1', {
  method: "PUT",
  body: "Hello world",
  headers: {
    "content-type": 'text/plain',
    "Seaweed-meta": JSON.stringify({ metadata: 1234 })
  }
})