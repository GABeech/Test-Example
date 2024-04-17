# Dockerfile

What i'm looking for in this area is pretty simple, I want to see a Dockerfile that has the base version and variant parameterized so that it can be easily changed.

I will also build the docker image, and run it to make sure that it works correctly. For this simple example I would simply do:

```bash
docker build . -t test-image
docker run -p 3000:3000 test-image
```

Then load `http://localhost:3000` on my web browser which should show the default react framework start page.