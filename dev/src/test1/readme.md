# Updating build process - test1

* 32b crosscompile
* original test kernel with updates to use link symbols
* still build kernel and test separately

```
build-kernel
build-test

# create mem files for coco sim
cp rom.init test1/.
cp test.init test1/.
```