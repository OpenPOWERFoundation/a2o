# Updating build process - test1

* 32b crosscompile
* partial original test kernel plus bios.c to complete boot
* this version puts kernel at rom start and bios at ram start (different erat entries)

```
build

# create mem file for coco sim
cp rom.init test2
```

* this version puts kernel and bios in rom

```
build2

# create mem file for coco sim
cp rom.init test2
```