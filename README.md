# Ecopark SQL

Running SQL queries with Rust.

![wallpaper.jpg](wallpaper.jpg)

## Instructions

* Start a new MySQL database.

```bash
docker run --name ecopark -e MYSQL_ROOT_PASSWORD=viu -d mysql:latest 
```

* Run the Rust program.

```bash
cargo build && cargo run
```

## Development

* Automatically format the code.

```bash
cargo fmt
```