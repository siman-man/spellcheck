# Spellcheck

simple spell checker for programming, written in Ruby.

## Installation

```
$ gem install spellcheck
```

## Usage

example text.

```
hello world.
I create aplication now.
good bye
```

run `spellcheck` command

```
$ spellcheck example.md
```

result

```
+----------+--------------------------+------------+-------------+
| Location | Text                     | Pattern    | Expected    |
+----------+--------------------------+------------+-------------+
| 2        | I create aplication now. | aplication | application |
+----------+--------------------------+------------+-------------+

result: 1 typo found.
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/siman-man/spellcheck. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
