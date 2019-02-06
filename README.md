# UE4 bash scripts

For doing things on the command line, that should be simple!

## quickstart

Edit `common/config.source` and setup the various paths

A typical setup should look like this:

```
    $WORKSPACE/ue4-bash-scripts/ <--- This repo
    $WORKSPACE/UnrealEngine <--- The UE4 engine source
    $WORKSPACE/MyProject <--- Your project
```

Into your `.profile`:

```
function my-project {
    SCRIPTS_DIR="$WORKSPACE/ue4-bash-scripts"
    "$SCRIPTS_DIR/$1.sh" MyProject
}
```

You can then do, this for example:

```
$ my-project xcode
$ my-project build
$ my-project run
```

