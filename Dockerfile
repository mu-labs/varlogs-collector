FROM elixir:1.3.4-slim
ENV MIX_ENV prod
RUN mix local.rebar
RUN mix local.hex --force

COPY . /app
WORKDIR /app

RUN mix deps.get
RUN mix compile
EXPOSE 8080
ENTRYPOINT mix phoenix.server
