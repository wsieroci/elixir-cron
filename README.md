# Sample Cron Service in Elixir

Checking whether given website is alive every couple of seconds

## Running observer by connecting to running host (example)

* elixir --name wsieroci@127.0.0.1 --cookie cookie1 -S mix run --no-halt
* iex --name wsieroci_remote@127.0.0.1 --cookie cookie1 --remsh wsieroci@127.0.0.1
* :observer.start