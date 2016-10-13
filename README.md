# Sample Cron Service in Elixir

Checking whether given website is alive every couple of seconds

## Running observer by connecting to running host (example)

* elixir --name wsieroci@127.0.0.1 --cookie cookie1 -S mix run --no-halt
* iex --name wsieroci_remote@127.0.0.1 --cookie cookie1 --remsh wsieroci@127.0.0.1
* :observer.start

## Executing actions on running instance

Cron.WebsiteChecker.set(:simple_checker, 101)

## Code reloading

* :sys.suspend(:simple_checker)
* c "lib/cron/website_checker.ex"
* :sys.change_code(:simple_checker, Cron.WebsiteChecker, "https://www.polidea.com", [:param])
* :sys.resume(:simple_checker) 

## Many nodes

* iex --sname node1
* iex --sname node2
* iex --sname node3

* Node.connect :"node2@Wiktors-MacBook-Pro-2"
* Node.connect :"node3@Wiktors-MacBook-Pro-2"

* Node.list
* :rpc.multicall(:inets, :start, [])
* :rpc.multicall(:httpc, :request, ['http://api.icndb.com/jokes/random'])