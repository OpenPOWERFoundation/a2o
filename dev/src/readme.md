# Kernel updates/build process

### test1
   * 32b crosscompile
   * minimal updates to kernel; add linker script and build kernel and test separately
   * passed coco sim

### test2
   * 32b crosscompile
   * update kernel for minimal setup and branch to bios C code; add linker script and build kernel and test separately
   * passed coco sim

### test3
   * 32b crosscompile
   * add bios code to execute and check a .tst; link test.s
