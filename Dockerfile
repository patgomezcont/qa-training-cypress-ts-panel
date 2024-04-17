FROM cypress/included:12.0.1

MAINTAINER Codium <info@codium.team>

WORKDIR /code

COPY package.* ./

RUN npm i

# Volume to have access to the source code
VOLUME ["/code", "/code/node_modules"]
