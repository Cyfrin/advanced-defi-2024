```shell
forge init --no-commit
forge build
forge test --fork-url $FORK_URL \
--match-path test/path/to/Fork.t.sol \
--match-test name_of_test \
-vvv
```
