FROM --platform=linux/amd64 node:20-bullseye-slim as base

# Install openssl
RUN apt-get update && apt-get install -y openssl git curl

# Install pnpm
RUN npm install -g pnpm

WORKDIR /home/node/app

COPY ./metronome .

RUN pnpm i

RUN pnpm build

CMD ["pnpm", "--filter", "@metronome/web", "start"]
