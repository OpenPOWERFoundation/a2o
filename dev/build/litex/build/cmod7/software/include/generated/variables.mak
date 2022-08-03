PACKAGES=libc libcompiler_rt libbase libfatfs liblitespi liblitedram libliteeth liblitesdcard liblitesata bios
PACKAGE_DIRS=/data/projects/litex/litex/soc/software/libc /data/projects/litex/litex/soc/software/libcompiler_rt /data/projects/litex/litex/soc/software/libbase /data/projects/litex/litex/soc/software/libfatfs /data/projects/litex/litex/soc/software/liblitespi /data/projects/litex/litex/soc/software/liblitedram /data/projects/litex/litex/soc/software/libliteeth /data/projects/litex/litex/soc/software/liblitesdcard /data/projects/litex/litex/soc/software/liblitesata /data/projects/litex/litex/soc/software/bios
LIBS=libc libcompiler_rt libbase libfatfs liblitespi liblitedram libliteeth liblitesdcard liblitesata
TRIPLE=--not-found--
CPU=a2o
CPUFAMILY=ppc64
CPUFLAGS=-ma2 -m64 -mlittle-endian -mabi=elfv2 -fnostack-protector -D__a2o__
CPUENDIANNESS=little
CLANG=0
CPU_DIRECTORY=/data/projects/a2o/dev/build/litex/a2o
SOC_DIRECTORY=/data/projects/litex/litex/soc
PICOLIBC_DIRECTORY=/home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data
COMPILER_RT_DIRECTORY=/usr/local/lib/python3.8/dist-packages/pythondata_software_compiler_rt-0.0.post6206-py3.8.egg/pythondata_software_compiler_rt/data
export BUILDINC_DIRECTORY
BUILDINC_DIRECTORY=/data/projects/a2o/dev/build/litex/build/cmod7/software/include
LIBC_DIRECTORY=/data/projects/litex/litex/soc/software/libc
LIBCOMPILER_RT_DIRECTORY=/data/projects/litex/litex/soc/software/libcompiler_rt
LIBBASE_DIRECTORY=/data/projects/litex/litex/soc/software/libbase
LIBFATFS_DIRECTORY=/data/projects/litex/litex/soc/software/libfatfs
LIBLITESPI_DIRECTORY=/data/projects/litex/litex/soc/software/liblitespi
LIBLITEDRAM_DIRECTORY=/data/projects/litex/litex/soc/software/liblitedram
LIBLITEETH_DIRECTORY=/data/projects/litex/litex/soc/software/libliteeth
LIBLITESDCARD_DIRECTORY=/data/projects/litex/litex/soc/software/liblitesdcard
LIBLITESATA_DIRECTORY=/data/projects/litex/litex/soc/software/liblitesata
BIOS_DIRECTORY=/data/projects/litex/litex/soc/software/bios
LTO=0