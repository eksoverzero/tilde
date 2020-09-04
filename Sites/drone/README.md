# Drone

[Docker Compose](https://docs.docker.com/compose/) file for [Drone](https://drone.io/).

## Setup

* Setup GitHub secrets according to the Drone [documentation](https://docs.drone.io/server/provider/github/)
  and set the values of `DRONE_GITHUB_CLIENT_ID` and `DRONE_GITHUB_CLIENT_SECRET`.

* Generate a secure key and use it to set the value of `DRONE_RPC_SECRET`.

  ```
  openssl rand -hex 16
  ```
